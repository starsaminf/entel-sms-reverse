package mx.messaging.channels
{
    import AMFChannel.as$150.*;
    import flash.events.*;
    import flash.net.*;
    import mx.logging.*;
    import mx.messaging.*;
    import mx.messaging.config.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;
    import mx.resources.*;
    import mx.utils.*;

    public class AMFChannel extends NetConnectionChannel
    {
        protected var _reconnectingWithSessionId:Boolean;
        private var _ignoreNetStatusEvents:Boolean;
        private var resourceManager:IResourceManager;

        public function AMFChannel(param1:String = null, param2:String = null)
        {
            resourceManager = ResourceManager.getInstance();
            super(param1, param2);
            return;
        }// end function

        override public function AppendToGatewayUrl(ResourceManager:String) : void
        {
            if (ResourceManager != null && ResourceManager != "" && _appendToURL != ResourceManager)
            {
                super.AppendToGatewayUrl(ResourceManager);
                _reconnectingWithSessionId = true;
            }
            return;
        }// end function

        public function get polling() : Boolean
        {
            return pollOutstanding;
        }// end function

        public function get pollingEnabled() : Boolean
        {
            return internalPollingEnabled;
        }// end function

        public function get piggybackingEnabled() : Boolean
        {
            return internalPiggybackingEnabled;
        }// end function

        override protected function statusHandler(event:NetStatusEvent) : void
        {
            var _loc_2:ChannelFaultEvent = null;
            var _loc_4:Object = null;
            var _loc_5:String = null;
            if (_ignoreNetStatusEvents)
            {
                return;
            }
            if (Log.isDebug())
            {
                _log.debug("\'{0}\' channel got status. {1}", id, ObjectUtil.toString(event.info));
            }
            var _loc_3:Boolean = true;
            if (event.info != null)
            {
                _loc_4 = event.info;
                if (_loc_4.level == "error")
                {
                    if (connected)
                    {
                        if (_loc_4.code.indexOf("Call.Failed") != -1)
                        {
                            _loc_2 = ChannelFaultEvent.createEvent(this, false, "Channel.Call.Failed", _loc_4.level, _loc_4.code + ": " + _loc_4.description);
                            _loc_2.rootCause = _loc_4;
                            dispatchEvent(_loc_2);
                        }
                        internalDisconnect();
                    }
                    else
                    {
                        _loc_2 = ChannelFaultEvent.createEvent(this, false, "Channel.Connect.Failed", _loc_4.level, _loc_4.code + ": " + _loc_4.description + ": url: \'" + endpoint + "\'");
                        _loc_2.rootCause = _loc_4;
                        connectFailed(_loc_2);
                    }
                }
                else if (!connected)
                {
                    _loc_3 = _loc_4.level == "status" && _loc_4.code.indexOf("Connect.Closed") != -1;
                }
                else
                {
                    _loc_3 = false;
                }
            }
            else
            {
                _loc_3 = false;
            }
            if (!_loc_3)
            {
                _loc_5 = resourceManager.getString("messaging", "invalidURL");
                connectFailed(ChannelFaultEvent.createEvent(this, false, "Channel.Connect.Failed", "error", _loc_5 + " url: \'" + endpoint + "\'"));
            }
            return;
        }// end function

        public function get pollingInterval() : Number
        {
            return internalPollingInterval;
        }// end function

        protected function handleReconnectWithSessionId() : void
        {
            if (_reconnectingWithSessionId)
            {
                _reconnectingWithSessionId = false;
                shutdownNetConnection();
                super.internalConnect();
                _ignoreNetStatusEvents = false;
            }
            return;
        }// end function

        public function set piggybackingEnabled(ResourceManager:Boolean) : void
        {
            internalPiggybackingEnabled = ResourceManager;
            return;
        }// end function

        override protected function internalConnect() : void
        {
            super.internalConnect();
            _ignoreNetStatusEvents = false;
            var _loc_1:* = new CommandMessage();
            if (credentials != null)
            {
                _loc_1.operation = CommandMessage.LOGIN_OPERATION;
                _loc_1.body = credentials;
            }
            else
            {
                _loc_1.operation = CommandMessage.CLIENT_PING_OPERATION;
            }
            _loc_1.headers[CommandMessage.MESSAGING_VERSION] = messagingVersion;
            if (ServerConfig.needsConfig(this))
            {
                _loc_1.headers[CommandMessage.NEEDS_CONFIG_HEADER] = true;
            }
            setFlexClientIdOnMessage(_loc_1);
            netConnection.call(null, new Responder(resultHandler, faultHandler), _loc_1);
            if (Log.isDebug())
            {
                _log.debug("\'{0}\' pinging endpoint.", id);
            }
            return;
        }// end function

        protected function faultHandler(ResourceManager:ErrorMessage) : void
        {
            var _loc_2:ChannelFaultEvent = null;
            var _loc_3:Number = NaN;
            if (ResourceManager != null)
            {
                _loc_2 = null;
                if (ResourceManager.faultCode == "Client.Authentication")
                {
                    resultHandler(ResourceManager);
                    _loc_2 = ChannelFaultEvent.createEvent(this, false, "Channel.Authentication.Error", "warn", ResourceManager.faultString);
                    _loc_2.rootCause = ResourceManager;
                    dispatchEvent(_loc_2);
                }
                else
                {
                    _log.debug("\'{0}\' fault handler called. {1}", id, ResourceManager.toString());
                    if (FlexClient.getInstance().id == null && ResourceManager.headers[AbstractMessage.FLEX_CLIENT_ID_HEADER] != null)
                    {
                        FlexClient.getInstance().id = ResourceManager.headers[AbstractMessage.FLEX_CLIENT_ID_HEADER];
                    }
                    if (ResourceManager.headers[CommandMessage.MESSAGING_VERSION] != null)
                    {
                        _loc_3 = ResourceManager.headers[CommandMessage.MESSAGING_VERSION] as Number;
                        handleServerMessagingVersion(_loc_3);
                    }
                    _loc_2 = ChannelFaultEvent.createEvent(this, false, "Channel.Ping.Failed", "error", ResourceManager.faultDetail + " url: \'" + endpoint + "\'");
                    _loc_2.rootCause = ResourceManager;
                    connectFailed(_loc_2);
                }
            }
            handleReconnectWithSessionId();
            return;
        }// end function

        public function set pollingInterval(ResourceManager:Number) : void
        {
            internalPollingInterval = ResourceManager;
            return;
        }// end function

        override public function applySettings(ResourceManager:XML) : void
        {
            super.applySettings(ResourceManager);
            applyPollingSettings(ResourceManager);
            return;
        }// end function

        override protected function shutdownNetConnection() : void
        {
            _nc.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            _nc.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            _ignoreNetStatusEvents = true;
            _nc.close();
            return;
        }// end function

        override public function get protocol() : String
        {
            return "http";
        }// end function

        override protected function internalDisconnect(ResourceManager:Boolean = false) : void
        {
            var _loc_2:CommandMessage = null;
            if (!ResourceManager)
            {
                _loc_2 = new CommandMessage();
                _loc_2.operation = CommandMessage.DISCONNECT_OPERATION;
                internalSend(new AMFFireAndForgetResponder(_loc_2));
            }
            setConnected(false);
            super.internalDisconnect(ResourceManager);
            return;
        }// end function

        protected function resultHandler(ResourceManager:IMessage) : void
        {
            var _loc_2:Number = NaN;
            if (ResourceManager != null)
            {
                ServerConfig.updateServerConfigData(ResourceManager.body as ConfigMap, endpoint);
                if (FlexClient.getInstance().id == null && ResourceManager.headers[AbstractMessage.FLEX_CLIENT_ID_HEADER] != null)
                {
                    FlexClient.getInstance().id = ResourceManager.headers[AbstractMessage.FLEX_CLIENT_ID_HEADER];
                }
                if (ResourceManager.headers[CommandMessage.MESSAGING_VERSION] != null)
                {
                    _loc_2 = ResourceManager.headers[CommandMessage.MESSAGING_VERSION] as Number;
                    handleServerMessagingVersion(_loc_2);
                }
            }
            handleReconnectWithSessionId();
            connectSuccess();
            if (credentials != null && !(ResourceManager is ErrorMessage))
            {
                setAuthenticated(true);
            }
            return;
        }// end function

        public function set pollingEnabled(ResourceManager:Boolean) : void
        {
            internalPollingEnabled = ResourceManager;
            return;
        }// end function

    }
}
