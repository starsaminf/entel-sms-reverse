package mx.messaging
{
    import flash.events.*;
    import mx.events.*;
    import mx.logging.*;
    import mx.messaging.config.*;
    import mx.messaging.errors.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;
    import mx.resources.*;
    import mx.utils.*;

    public class MessageAgent extends EventDispatcher implements IMXMLObject
    {
        private var _needsConfig:Boolean;
        protected var _disconnectBarrier:Boolean;
        protected var _log:ILogger;
        private var _connected:Boolean = false;
        private var _clientId:String;
        private var _sendRemoteCredentials:Boolean;
        private var _authenticated:Boolean;
        protected var _ignoreFault:Boolean = false;
        private var _id:String;
        protected var _credentials:String;
        private var resourceManager:IResourceManager;
        private var _channelSetMode:int = 0;
        var configRequested:Boolean = false;
        private var _pendingConnectEvent:ChannelEvent;
        protected var _credentialsCharset:String;
        private var _remoteCredentials:String = "";
        private var _destination:String = "";
        protected var _agentType:String;
        private var _requestTimeout:int = -1;
        private var _remoteCredentialsCharset:String;
        private var _clientIdWaitQueue:Array;
        private var _channelSet:ChannelSet;
        static const AUTO_CONFIGURED_CHANNELSET:int = 0;
        static const MANUALLY_ASSIGNED_CHANNELSET:int = 1;

        public function MessageAgent()
        {
            resourceManager = ResourceManager.getInstance();
            _id = UIDUtil.createUID();
            return;
        }// end function

        public function get connected() : Boolean
        {
            return _connected;
        }// end function

        public function get destination() : String
        {
            return _destination;
        }// end function

        protected function initChannelSet(mx.messaging:MessageAgent/MessageAgent:IMessage) : void
        {
            if (_channelSet == null)
            {
                _channelSetMode = AUTO_CONFIGURED_CHANNELSET;
                internalSetChannelSet(ServerConfig.getChannelSet(destination));
            }
            if (_channelSet.connected && needsConfig && !configRequested)
            {
                mx.messaging:MessageAgent/MessageAgent.headers[CommandMessage.NEEDS_CONFIG_HEADER] = true;
                configRequested = true;
            }
            _channelSet.connect(this);
            if (_credentials != null)
            {
                channelSet.setCredentials(_credentials, this, _credentialsCharset);
            }
            return;
        }// end function

        function set needsConfig(mx.messaging:MessageAgent/MessageAgent:Boolean) : void
        {
            var cs:ChannelSet;
            var value:* = mx.messaging:MessageAgent/MessageAgent;
            if (_needsConfig != value)
            {
                _needsConfig = value;
                if (_needsConfig)
                {
                    cs = channelSet;
                    disconnect();
                    finally
                    {
                        var _loc_3:* = new catch0;
                        throw null;
                    }
                    finally
                    {
                        internalSetChannelSet(cs);
                    }
                }
            }
            return;
        }// end function

        public function logout() : void
        {
            _credentials = null;
            if (channelSet)
            {
                channelSet.logout(this);
            }
            return;
        }// end function

        public function get id() : String
        {
            return _id;
        }// end function

        public function set destination(mx.messaging:MessageAgent/MessageAgent:String) : void
        {
            var _loc_2:String = null;
            var _loc_3:PropertyChangeEvent = null;
            if (mx.messaging:MessageAgent/MessageAgent == null || mx.messaging:MessageAgent/MessageAgent.length == 0)
            {
                _loc_2 = resourceManager.getString("messaging", "emptyDestinationName", [mx.messaging:MessageAgent/MessageAgent]);
                throw new InvalidDestinationError(_loc_2);
            }
            if (_destination != mx.messaging:MessageAgent/MessageAgent)
            {
                if (_channelSetMode == AUTO_CONFIGURED_CHANNELSET && channelSet != null)
                {
                    channelSet.disconnect(this);
                    channelSet = null;
                }
                _loc_3 = PropertyChangeEvent.createUpdateEvent(this, "destination", _destination, mx.messaging:MessageAgent/MessageAgent);
                _destination = mx.messaging:MessageAgent/MessageAgent;
                dispatchEvent(_loc_3);
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' {2} set destination to \'{1}\'.", id, _destination, _agentType);
                }
            }
            return;
        }// end function

        function get channelSetMode() : int
        {
            return _channelSetMode;
        }// end function

        public function acknowledge(mx.messaging:MessageAgent/MessageAgent:AcknowledgeMessage, mx.messaging:MessageAgent/MessageAgent:IMessage) : void
        {
            var mpiutil:MessagePerformanceUtils;
            var ackMsg:* = mx.messaging:MessageAgent/MessageAgent;
            var msg:* = mx.messaging:MessageAgent/MessageAgent;
            if (Log.isInfo())
            {
                _log.info("\'{0}\' {2} acknowledge of \'{1}\'.", id, msg.messageId, _agentType);
            }
            if (Log.isDebug() && channelSet != null && channelSet.currentChannel != null && channelSet.currentChannel.mpiEnabled)
            {
                try
                {
                    mpiutil = new MessagePerformanceUtils(ackMsg);
                    _log.debug(mpiutil.prettyPrint());
                }
                catch (e:Error)
                {
                    _log.debug("Could not get message performance information for: " + msg.toString());
                }
            }
            if (ackMsg.headers[AcknowledgeMessage.ERROR_HINT_HEADER])
            {
                delete ackMsg.headers[AcknowledgeMessage.ERROR_HINT_HEADER];
            }
            if (configRequested)
            {
                configRequested = false;
                ServerConfig.updateServerConfigData(ackMsg.body as ConfigMap);
                needsConfig = false;
                if (_pendingConnectEvent)
                {
                    channelConnectHandler(_pendingConnectEvent);
                }
                _pendingConnectEvent = null;
            }
            if (clientId == null)
            {
                if (ackMsg.clientId != null)
                {
                    setClientId(ackMsg.clientId);
                }
                else
                {
                    flushClientIdWaitQueue();
                }
            }
            dispatchEvent(MessageAckEvent.createEvent(ackMsg, msg));
            return;
        }// end function

        function internalSetChannelSet(mx.messaging:MessageAgent/MessageAgent:ChannelSet) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_channelSet != mx.messaging:MessageAgent/MessageAgent)
            {
                if (_channelSet != null)
                {
                    _channelSet.disconnect(this);
                }
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "channelSet", _channelSet, mx.messaging:MessageAgent/MessageAgent);
                _channelSet = mx.messaging:MessageAgent/MessageAgent;
                if (_channelSet != null)
                {
                    if (_credentials)
                    {
                        _channelSet.setCredentials(_credentials, this, _credentialsCharset);
                    }
                    _channelSet.connect(this);
                }
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function fault(mx.messaging:MessageAgent/MessageAgent:ErrorMessage, mx.messaging:MessageAgent/MessageAgent:IMessage) : void
        {
            if (Log.isError())
            {
                _log.error("\'{0}\' {2} fault for \'{1}\'.", id, mx.messaging:MessageAgent/MessageAgent.messageId, _agentType);
            }
            _ignoreFault = false;
            configRequested = false;
            if (mx.messaging:MessageAgent/MessageAgent.headers[ErrorMessage.RETRYABLE_HINT_HEADER])
            {
                delete mx.messaging:MessageAgent/MessageAgent.headers[ErrorMessage.RETRYABLE_HINT_HEADER];
            }
            if (clientId == null)
            {
                if (mx.messaging:MessageAgent/MessageAgent.clientId != null)
                {
                    setClientId(mx.messaging:MessageAgent/MessageAgent.clientId);
                }
                else
                {
                    flushClientIdWaitQueue();
                }
            }
            dispatchEvent(MessageFaultEvent.createEvent(mx.messaging:MessageAgent/MessageAgent));
            if (mx.messaging:MessageAgent/MessageAgent.faultCode == "Client.Authentication" && authenticated && channelSet != null && channelSet.currentChannel != null)
            {
                channelSet.currentChannel.setAuthenticated(false);
                if (channelSet.currentChannel.loginAfterDisconnect)
                {
                    reAuthorize(mx.messaging:MessageAgent/MessageAgent);
                    _ignoreFault = true;
                }
            }
            return;
        }// end function

        public function set requestTimeout(mx.messaging:MessageAgent/MessageAgent:int) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_requestTimeout != mx.messaging:MessageAgent/MessageAgent)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "requestTimeout", _requestTimeout, mx.messaging:MessageAgent/MessageAgent);
                _requestTimeout = mx.messaging:MessageAgent/MessageAgent;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function disconnect() : void
        {
            if (!_disconnectBarrier)
            {
                _disconnectBarrier = true;
                if (_channelSetMode == AUTO_CONFIGURED_CHANNELSET)
                {
                    internalSetChannelSet(null);
                }
                else if (_channelSet != null)
                {
                    _channelSet.disconnect(this);
                }
            }
            return;
        }// end function

        public function set id(mx.messaging:MessageAgent/MessageAgent:String) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_id != mx.messaging:MessageAgent/MessageAgent)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "id", _id, mx.messaging:MessageAgent/MessageAgent);
                _id = mx.messaging:MessageAgent/MessageAgent;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function set channelSet(mx.messaging:MessageAgent/MessageAgent:ChannelSet) : void
        {
            internalSetChannelSet(mx.messaging:MessageAgent/MessageAgent);
            _channelSetMode = MANUALLY_ASSIGNED_CHANNELSET;
            return;
        }// end function

        public function get clientId() : String
        {
            return _clientId;
        }// end function

        protected function setConnected(mx.messaging:MessageAgent/MessageAgent:Boolean) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_connected != mx.messaging:MessageAgent/MessageAgent)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "connected", _connected, mx.messaging:MessageAgent/MessageAgent);
                _connected = mx.messaging:MessageAgent/MessageAgent;
                dispatchEvent(_loc_2);
                setAuthenticated(mx.messaging:MessageAgent/MessageAgent && channelSet && channelSet.authenticated, _credentials);
            }
            return;
        }// end function

        function setClientId(mx.messaging:MessageAgent/MessageAgent:String) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_clientId != mx.messaging:MessageAgent/MessageAgent)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "clientId", _clientId, mx.messaging:MessageAgent/MessageAgent);
                _clientId = mx.messaging:MessageAgent/MessageAgent;
                flushClientIdWaitQueue();
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function setCredentials(mx.messaging:MessageAgent/MessageAgent:String, mx.messaging:MessageAgent/MessageAgent:String, mx.messaging:MessageAgent/MessageAgent:String = null) : void
        {
            var _loc_4:String = null;
            var _loc_5:Base64Encoder = null;
            if (mx.messaging:MessageAgent/MessageAgent == null && mx.messaging:MessageAgent/MessageAgent == null)
            {
                _credentials = null;
                _credentialsCharset = null;
            }
            else
            {
                _loc_4 = mx.messaging:MessageAgent/MessageAgent + ":" + mx.messaging:MessageAgent/MessageAgent;
                _loc_5 = new Base64Encoder();
                if (mx.messaging:MessageAgent/MessageAgent == Base64Encoder.CHARSET_UTF_8)
                {
                    _loc_5.encodeUTFBytes(_loc_4);
                }
                else
                {
                    _loc_5.encode(_loc_4);
                }
                _credentials = _loc_5.drain();
                _credentialsCharset = mx.messaging:MessageAgent/MessageAgent;
            }
            if (channelSet != null)
            {
                channelSet.setCredentials(_credentials, this, _credentialsCharset);
            }
            return;
        }// end function

        public function channelDisconnectHandler(event:ChannelEvent) : void
        {
            if (Log.isWarn())
            {
                _log.warn("\'{0}\' {1} channel disconnected.", id, _agentType);
            }
            setConnected(false);
            if (_remoteCredentials != null)
            {
                _sendRemoteCredentials = true;
            }
            dispatchEvent(event);
            return;
        }// end function

        public function setRemoteCredentials(mx.messaging:MessageAgent/MessageAgent:String, mx.messaging:MessageAgent/MessageAgent:String, mx.messaging:MessageAgent/MessageAgent:String = null) : void
        {
            var _loc_4:String = null;
            var _loc_5:Base64Encoder = null;
            if (mx.messaging:MessageAgent/MessageAgent == null && mx.messaging:MessageAgent/MessageAgent == null)
            {
                _remoteCredentials = "";
                _remoteCredentialsCharset = null;
            }
            else
            {
                _loc_4 = mx.messaging:MessageAgent/MessageAgent + ":" + mx.messaging:MessageAgent/MessageAgent;
                _loc_5 = new Base64Encoder();
                if (mx.messaging:MessageAgent/MessageAgent == Base64Encoder.CHARSET_UTF_8)
                {
                    _loc_5.encodeUTFBytes(_loc_4);
                }
                else
                {
                    _loc_5.encode(_loc_4);
                }
                _remoteCredentials = _loc_5.drain();
                _remoteCredentialsCharset = mx.messaging:MessageAgent/MessageAgent;
            }
            _sendRemoteCredentials = true;
            return;
        }// end function

        function get needsConfig() : Boolean
        {
            return _needsConfig;
        }// end function

        public function hasPendingRequestForMessage(getInstance:IMessage) : Boolean
        {
            return false;
        }// end function

        public function get authenticated() : Boolean
        {
            return _authenticated;
        }// end function

        public function get requestTimeout() : int
        {
            return _requestTimeout;
        }// end function

        public function initialized(mx.messaging:MessageAgent/MessageAgent:Object, mx.messaging:MessageAgent/MessageAgent:String) : void
        {
            this.id = mx.messaging:MessageAgent/MessageAgent;
            return;
        }// end function

        final protected function flushClientIdWaitQueue() : void
        {
            if (_clientIdWaitQueue != null)
            {
                if (clientId != null)
                {
                    while (_clientIdWaitQueue.length > 0)
                    {
                        
                        internalSend(_clientIdWaitQueue.shift() as IMessage);
                    }
                }
                if (_clientIdWaitQueue.length > 0)
                {
                    internalSend(_clientIdWaitQueue.shift() as IMessage);
                }
                else
                {
                    _clientIdWaitQueue = null;
                }
            }
            return;
        }// end function

        final protected function assertCredentials(mx.messaging:MessageAgent/MessageAgent:String) : void
        {
            var _loc_2:ErrorMessage = null;
            if (_credentials != null && _credentials != mx.messaging:MessageAgent/MessageAgent)
            {
                _loc_2 = new ErrorMessage();
                _loc_2.faultCode = "Client.Authentication.Error";
                _loc_2.faultString = "Credentials specified do not match those used on underlying connection.";
                _loc_2.faultDetail = "Channel was authenticated with a different set of credentials than those used for this agent.";
                dispatchEvent(MessageFaultEvent.createEvent(_loc_2));
            }
            return;
        }// end function

        public function get channelSet() : ChannelSet
        {
            return _channelSet;
        }// end function

        public function channelConnectHandler(event:ChannelEvent) : void
        {
            _disconnectBarrier = false;
            if (needsConfig)
            {
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' {1} waiting for configuration information.", id, _agentType);
                }
                _pendingConnectEvent = event;
            }
            else
            {
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' {1} connected.", id, _agentType);
                }
                setConnected(true);
                dispatchEvent(event);
            }
            return;
        }// end function

        function internalSetCredentials(mx.messaging:MessageAgent/MessageAgent:String) : void
        {
            _credentials = mx.messaging:MessageAgent/MessageAgent;
            return;
        }// end function

        public function channelFaultHandler(event:ChannelFaultEvent) : void
        {
            if (Log.isWarn())
            {
                _log.warn("\'{0}\' {1} channel faulted with {2} {3}", id, _agentType, event.faultCode, event.faultDetail);
            }
            if (!event.channel.connected)
            {
                setConnected(false);
                if (_remoteCredentials != null)
                {
                    _sendRemoteCredentials = true;
                }
            }
            dispatchEvent(event);
            return;
        }// end function

        protected function internalSend(mx.messaging:MessageAgent/MessageAgent:IMessage, mx.messaging:MessageAgent/MessageAgent:Boolean = true) : void
        {
            var _loc_3:String = null;
            if (mx.messaging:MessageAgent/MessageAgent.clientId == null && mx.messaging:MessageAgent/MessageAgent && clientId == null)
            {
                if (_clientIdWaitQueue == null)
                {
                    _clientIdWaitQueue = [];
                }
                else
                {
                    _clientIdWaitQueue.push(mx.messaging:MessageAgent/MessageAgent);
                    return;
                }
            }
            if (mx.messaging:MessageAgent/MessageAgent.clientId == null)
            {
                mx.messaging:MessageAgent/MessageAgent.clientId = clientId;
            }
            if (requestTimeout > 0)
            {
                mx.messaging:MessageAgent/MessageAgent.headers[AbstractMessage.REQUEST_TIMEOUT_HEADER] = requestTimeout;
            }
            if (_sendRemoteCredentials)
            {
                if (!(mx.messaging:MessageAgent/MessageAgent is CommandMessage && CommandMessage(mx.messaging:MessageAgent/MessageAgent).operation == CommandMessage.TRIGGER_CONNECT_OPERATION))
                {
                    mx.messaging:MessageAgent/MessageAgent.headers[AbstractMessage.REMOTE_CREDENTIALS_HEADER] = _remoteCredentials;
                    mx.messaging:MessageAgent/MessageAgent.headers[AbstractMessage.REMOTE_CREDENTIALS_CHARSET_HEADER] = _remoteCredentialsCharset;
                    _sendRemoteCredentials = false;
                }
            }
            if (channelSet != null)
            {
                if (!connected && _channelSetMode == MANUALLY_ASSIGNED_CHANNELSET)
                {
                    _channelSet.connect(this);
                }
                if (channelSet.connected && needsConfig && !configRequested)
                {
                    mx.messaging:MessageAgent/MessageAgent.headers[CommandMessage.NEEDS_CONFIG_HEADER] = true;
                    configRequested = true;
                }
                channelSet.send(this, mx.messaging:MessageAgent/MessageAgent);
            }
            else if (destination.length > 0)
            {
                initChannelSet(mx.messaging:MessageAgent/MessageAgent);
                if (channelSet != null)
                {
                    channelSet.send(this, mx.messaging:MessageAgent/MessageAgent);
                }
            }
            else
            {
                _loc_3 = resourceManager.getString("messaging", "destinationNotSet");
                throw new InvalidDestinationError(_loc_3);
            }
            return;
        }// end function

        function setAuthenticated(mx.messaging:MessageAgent/MessageAgent:Boolean, mx.messaging:MessageAgent/MessageAgent:String) : void
        {
            var _loc_3:PropertyChangeEvent = null;
            if (_authenticated != mx.messaging:MessageAgent/MessageAgent)
            {
                _loc_3 = PropertyChangeEvent.createUpdateEvent(this, "authenticated", _authenticated, mx.messaging:MessageAgent/MessageAgent);
                _authenticated = mx.messaging:MessageAgent/MessageAgent;
                dispatchEvent(_loc_3);
                if (mx.messaging:MessageAgent/MessageAgent)
                {
                    assertCredentials(mx.messaging:MessageAgent/MessageAgent);
                }
            }
            return;
        }// end function

        protected function reAuthorize(mx.messaging:MessageAgent/MessageAgent:IMessage) : void
        {
            disconnect();
            internalSend(mx.messaging:MessageAgent/MessageAgent);
            return;
        }// end function

    }
}
