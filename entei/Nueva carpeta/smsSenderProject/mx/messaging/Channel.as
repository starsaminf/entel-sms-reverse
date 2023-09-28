package mx.messaging
{
    import Channel.as$121.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.collections.*;
    import mx.events.*;
    import mx.logging.*;
    import mx.messaging.config.*;
    import mx.messaging.errors.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;
    import mx.resources.*;
    import mx.utils.*;

    public class Channel extends EventDispatcher implements IMXMLObject
    {
        private var _failoverIndex:int;
        private var _ownsWaitGuard:Boolean = false;
        protected var _recordMessageTimes:Boolean = false;
        private var _reconnecting:Boolean = false;
        private var _authenticated:Boolean = false;
        protected var messagingVersion:Number = 1;
        private var _channelSets:Array;
        private var _connectTimeout:int = -1;
        var authenticating:Boolean;
        protected var _connecting:Boolean;
        private var _connectTimer:Timer;
        protected var _recordMessageSizes:Boolean = false;
        private var _failoverURIs:Array;
        protected var _log:ILogger;
        private var _connected:Boolean = false;
        private var _smallMessagesSupported:Boolean;
        private var _primaryURI:String;
        public var enableSmallMessages:Boolean = true;
        private var _id:String;
        private var resourceManager:IResourceManager;
        private var _uri:String;
        protected var _loginAfterDisconnect:Boolean = false;
        private var _isEndpointCalculated:Boolean = false;
        private var _shouldBeConnected:Boolean;
        private var _requestTimeout:int = -1;
        private var _endpoint:String;
        protected var credentials:String;
        public static const SMALL_MESSAGES_FEATURE:String = "small_messages";
        private static const dep:ArrayCollection = null;

        public function Channel(param1:String = null, param2:String = null)
        {
            resourceManager = ResourceManager.getInstance();
            _channelSets = [];
            _log = Log.getLogger("mx.messaging.Channel");
            _connecting = false;
            _failoverIndex = -1;
            this.id = param1;
            _primaryURI = param2;
            _shouldBeConnected = false;
            this.uri = param2;
            authenticating = false;
            return;
        }// end function

        private function shutdownConnectTimer() : void
        {
            if (_connectTimer != null)
            {
                _connectTimer.stop();
                _connectTimer = null;
            }
            return;
        }// end function

        public function get connected() : Boolean
        {
            return _connected;
        }// end function

        public function get connectTimeout() : int
        {
            return _connectTimeout;
        }// end function

        public function get id() : String
        {
            return _id;
        }// end function

        private function calculateEndpoint() : void
        {
            var _loc_3:String = null;
            if (uri == null)
            {
                _loc_3 = resourceManager.getString("messaging", "noURLSpecified");
                throw new InvalidChannelError(_loc_3);
            }
            var _loc_1:* = uri;
            var _loc_2:* = URLUtil.getProtocol(_loc_1);
            if (_loc_2.length == 0)
            {
                _loc_1 = URLUtil.getFullURL(LoaderConfig.url, _loc_1);
            }
            if (!URLUtil.hasUnresolvableTokens())
            {
                _isEndpointCalculated = false;
                return;
            }
            _loc_1 = URLUtil.replaceTokens(_loc_1);
            _loc_2 = URLUtil.getProtocol(_loc_1);
            if (_loc_2.length > 0)
            {
                _endpoint = URLUtil.replaceProtocol(_loc_1, protocol);
            }
            else
            {
                _endpoint = protocol + ":" + _loc_1;
            }
            _isEndpointCalculated = true;
            if (Log.isInfo())
            {
                _log.info("\'{0}\' channel endpoint set to {1}", id, _endpoint);
            }
            return;
        }// end function

        public function get reconnecting() : Boolean
        {
            return _reconnecting;
        }// end function

        public function get useSmallMessages() : Boolean
        {
            return _smallMessagesSupported && enableSmallMessages;
        }// end function

        public function set connectTimeout(ILogger:int) : void
        {
            _connectTimeout = ILogger;
            return;
        }// end function

        public function get authenticated() : Boolean
        {
            return _authenticated;
        }// end function

        protected function getMessageResponder(Logout successful:MessageAgent, Logout successful:IMessage) : MessageResponder
        {
            throw new IllegalOperationError("Channel subclasses must override " + " getMessageResponder().");
        }// end function

        public function set failoverURIs(ILogger:Array) : void
        {
            if (ILogger != null)
            {
                _failoverURIs = ILogger;
                _failoverIndex = -1;
            }
            return;
        }// end function

        protected function internalDisconnect(ILogger:Boolean = false) : void
        {
            return;
        }// end function

        public function setCredentials(ILogger:String, ILogger:MessageAgent = null, ILogger:String = null) : void
        {
            var _loc_5:CommandMessage = null;
            var _loc_4:* = this.credentials !== ILogger;
            if (authenticating && _loc_4)
            {
                throw new IllegalOperationError("Credentials cannot be set while authenticating or logging out.");
            }
            if (authenticated && _loc_4)
            {
                throw new IllegalOperationError("Credentials cannot be set when already authenticated. Logout must be performed before changing credentials.");
            }
            this.credentials = ILogger;
            if (connected && _loc_4 && ILogger != null)
            {
                authenticating = true;
                _loc_5 = new CommandMessage();
                _loc_5.operation = CommandMessage.LOGIN_OPERATION;
                _loc_5.body = ILogger;
                if (ILogger != null)
                {
                    _loc_5.headers[CommandMessage.CREDENTIALS_CHARSET_HEADER] = ILogger;
                }
                internalSend(new AuthenticationMessageResponder(ILogger, _loc_5, this, _log));
            }
            return;
        }// end function

        public function get mpiEnabled() : Boolean
        {
            return _recordMessageSizes || _recordMessageTimes;
        }// end function

        public function set id(ILogger:String) : void
        {
            if (_id != ILogger)
            {
                _id = ILogger;
            }
            return;
        }// end function

        protected function connectTimeoutHandler(event:TimerEvent) : void
        {
            var _loc_2:String = null;
            var _loc_3:ChannelFaultEvent = null;
            shutdownConnectTimer();
            if (!connected)
            {
                _shouldBeConnected = false;
                _loc_2 = resourceManager.getString("messaging", "connectTimedOut");
                _loc_3 = ChannelFaultEvent.createEvent(this, false, "Channel.Connect.Failed", "error", _loc_2);
                connectFailed(_loc_3);
            }
            return;
        }// end function

        protected function setFlexClientIdOnMessage(ILogger:IMessage) : void
        {
            var _loc_2:* = FlexClient.getInstance().id;
            ILogger.headers[AbstractMessage.FLEX_CLIENT_ID_HEADER] = _loc_2 != null ? (_loc_2) : (FlexClient.NULL_FLEXCLIENT_ID);
            return;
        }// end function

        protected function flexClientWaitHandler(event:PropertyChangeEvent) : void
        {
            var _loc_2:FlexClient = null;
            if (event.property == "waitForFlexClientId")
            {
                _loc_2 = event.source as FlexClient;
                if (_loc_2.waitForFlexClientId == false)
                {
                    _loc_2.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, flexClientWaitHandler);
                    _loc_2.waitForFlexClientId = true;
                    _ownsWaitGuard = true;
                    internalConnect();
                }
            }
            return;
        }// end function

        public function set useSmallMessages(ILogger:Boolean) : void
        {
            _smallMessagesSupported = ILogger;
            return;
        }// end function

        function internalSetCredentials(ILogger:String) : void
        {
            this.credentials = ILogger;
            return;
        }// end function

        private function reconnect(event:TimerEvent) : void
        {
            internalConnect();
            return;
        }// end function

        function get realtime() : Boolean
        {
            return false;
        }// end function

        protected function internalConnect() : void
        {
            return;
        }// end function

        public function get url() : String
        {
            return uri;
        }// end function

        public function get recordMessageTimes() : Boolean
        {
            return _recordMessageTimes;
        }// end function

        public function get uri() : String
        {
            return _uri;
        }// end function

        private function initializeRequestTimeout(ILogger:MessageResponder) : void
        {
            var _loc_2:* = ILogger.message;
            if (_loc_2.headers[AbstractMessage.REQUEST_TIMEOUT_HEADER] != null)
            {
                ILogger.startRequestTimeout(_loc_2.headers[AbstractMessage.REQUEST_TIMEOUT_HEADER]);
            }
            else if (requestTimeout > 0)
            {
                ILogger.startRequestTimeout(requestTimeout);
            }
            return;
        }// end function

        public function send(ILogger:MessageAgent, ILogger:IMessage) : void
        {
            var _loc_4:String = null;
            if (ILogger.destination.length == 0)
            {
                if (ILogger.destination.length == 0)
                {
                    _loc_4 = resourceManager.getString("messaging", "noDestinationSpecified");
                    throw new InvalidDestinationError(_loc_4);
                }
                ILogger.destination = ILogger.destination;
            }
            if (Log.isDebug())
            {
                _log.debug("\'{0}\' channel sending message:\n{1}", id, ILogger.toString());
            }
            ILogger.headers[AbstractMessage.ENDPOINT_HEADER] = id;
            var _loc_3:* = getMessageResponder(ILogger, ILogger);
            initializeRequestTimeout(_loc_3);
            internalSend(_loc_3);
            return;
        }// end function

        public function logout(ILogger:MessageAgent) : void
        {
            var _loc_2:CommandMessage = null;
            if (connected && authenticated && credentials || authenticating && credentials)
            {
                _loc_2 = new CommandMessage();
                _loc_2.operation = CommandMessage.LOGOUT_OPERATION;
                internalSend(new AuthenticationMessageResponder(ILogger, _loc_2, this, _log));
                authenticating = true;
            }
            credentials = null;
            return;
        }// end function

        public function get endpoint() : String
        {
            if (!_isEndpointCalculated)
            {
                calculateEndpoint();
            }
            return _endpoint;
        }// end function

        public function get protocol() : String
        {
            throw new IllegalOperationError("Channel subclasses must override " + "the get function for \'protocol\' to return the proper protocol " + "string.");
        }// end function

        public function get failoverURIs() : Array
        {
            return _failoverURIs != null ? (_failoverURIs) : ([]);
        }// end function

        final public function disconnect(ILogger:ChannelSet) : void
        {
            if (_ownsWaitGuard)
            {
                _ownsWaitGuard = false;
                FlexClient.getInstance().waitForFlexClientId = false;
            }
            var _loc_2:* = ILogger != null ? (_channelSets.indexOf(ILogger)) : (-1);
            if (_loc_2 != -1)
            {
                _channelSets.splice(_loc_2, 1);
                removeEventListener(ChannelEvent.CONNECT, ILogger.channelConnectHandler, false);
                removeEventListener(ChannelEvent.DISCONNECT, ILogger.channelDisconnectHandler, false);
                removeEventListener(ChannelFaultEvent.FAULT, ILogger.channelFaultHandler, false);
                if (connected)
                {
                    ILogger.channelDisconnectHandler(ChannelEvent.createEvent(ChannelEvent.DISCONNECT, this, false));
                }
                if (_channelSets.length == 0)
                {
                    _shouldBeConnected = false;
                    if (connected)
                    {
                        internalDisconnect();
                    }
                }
            }
            return;
        }// end function

        public function set requestTimeout(ILogger:int) : void
        {
            _requestTimeout = ILogger;
            return;
        }// end function

        private function shouldAttemptFailover() : Boolean
        {
            return _shouldBeConnected && _failoverURIs != null && _failoverURIs.length > 0;
        }// end function

        private function setReconnecting(ILogger:Boolean) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_reconnecting != ILogger)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "reconnecting", _reconnecting, ILogger);
                _reconnecting = ILogger;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function applySettings(ILogger:XML) : void
        {
            var _loc_2:XML = null;
            var _loc_3:XMLList = null;
            if (Log.isInfo())
            {
                _log.info("\'{0}\' channel settings are:\n{1}", id, ILogger);
            }
            if (ILogger.properties.length())
            {
                _loc_2 = ILogger.properties[0];
                if (_loc_2["connect-timeout-seconds"].length())
                {
                    connectTimeout = _loc_2["connect-timeout-seconds"].toString();
                }
                if (_loc_2["record-message-times"].length())
                {
                    _recordMessageTimes = _loc_2["record-message-times"].toString() == "true";
                }
                if (_loc_2["record-message-sizes"].length())
                {
                    _recordMessageSizes = _loc_2["record-message-sizes"].toString() == "true";
                }
                _loc_3 = _loc_2["serialization"];
                if (_loc_3.length() > 0)
                {
                    if (_loc_3["enable-small-messages"].toString() == "false")
                    {
                        enableSmallMessages = false;
                    }
                }
            }
            return;
        }// end function

        protected function connectSuccess() : void
        {
            var _loc_1:int = 0;
            var _loc_2:Array = null;
            var _loc_3:int = 0;
            if (_ownsWaitGuard)
            {
                _ownsWaitGuard = false;
                FlexClient.getInstance().waitForFlexClientId = false;
            }
            shutdownConnectTimer();
            _connecting = false;
            if (ServerConfig.fetchedConfig(endpoint))
            {
                _loc_1 = 0;
                while (_loc_1 < channelSets.length)
                {
                    
                    _loc_2 = ChannelSet(channelSets[_loc_1]).messageAgents;
                    _loc_3 = 0;
                    while (_loc_3 < _loc_2.length)
                    {
                        
                        _loc_2[_loc_3].needsConfig = false;
                        _loc_3++;
                    }
                    _loc_1++;
                }
            }
            setConnected(true);
            _failoverIndex = -1;
            if (Log.isInfo())
            {
                _log.info("\'{0}\' channel is connected.", id);
            }
            dispatchEvent(ChannelEvent.createEvent(ChannelEvent.CONNECT, this, reconnecting));
            setReconnecting(false);
            return;
        }// end function

        public function get recordMessageSizes() : Boolean
        {
            return _recordMessageSizes;
        }// end function

        protected function disconnectSuccess(ILogger:Boolean = false) : void
        {
            setConnected(false);
            if (Log.isInfo())
            {
                _log.info("\'{0}\' channel disconnected.", id);
            }
            if (!ILogger && shouldAttemptFailover())
            {
                _connecting = true;
                failover();
            }
            else
            {
                _connecting = false;
            }
            dispatchEvent(ChannelEvent.createEvent(ChannelEvent.DISCONNECT, this, reconnecting, ILogger));
            return;
        }// end function

        protected function setConnected(ILogger:Boolean) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_connected != ILogger)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "connected", _connected, ILogger);
                _connected = ILogger;
                dispatchEvent(_loc_2);
                if (!ILogger)
                {
                    setAuthenticated(false);
                }
            }
            return;
        }// end function

        public function get requestTimeout() : int
        {
            return _requestTimeout;
        }// end function

        protected function connectFailed(event:ChannelFaultEvent) : void
        {
            shutdownConnectTimer();
            setConnected(false);
            if (Log.isError())
            {
                _log.error("\'{0}\' channel connect failed.", id);
            }
            if (!event.rejected && shouldAttemptFailover())
            {
                _connecting = true;
                failover();
            }
            else
            {
                if (_ownsWaitGuard)
                {
                    _ownsWaitGuard = false;
                    FlexClient.getInstance().waitForFlexClientId = false;
                }
                _connecting = false;
            }
            if (reconnecting)
            {
                event.reconnecting = true;
            }
            dispatchEvent(event);
            return;
        }// end function

        public function set uri(ILogger:String) : void
        {
            if (ILogger != null)
            {
                _uri = ILogger;
                calculateEndpoint();
            }
            return;
        }// end function

        public function initialized(ILogger:Object, ILogger:String) : void
        {
            this.id = ILogger;
            return;
        }// end function

        function sendClusterRequest(ILogger:MessageResponder) : void
        {
            internalSend(ILogger);
            return;
        }// end function

        public function set url(ILogger:String) : void
        {
            uri = ILogger;
            return;
        }// end function

        protected function handleServerMessagingVersion(ILogger:Number) : void
        {
            useSmallMessages = ILogger >= messagingVersion;
            return;
        }// end function

        protected function internalSend(ILogger:MessageResponder) : void
        {
            return;
        }// end function

        final public function connect(ILogger:ChannelSet) : void
        {
            var _loc_5:FlexClient = null;
            var _loc_2:Boolean = false;
            var _loc_3:* = _channelSets.length;
            var _loc_4:int = 0;
            while (_loc_4 < _channelSets.length)
            {
                
                if (_channelSets[_loc_4] == ILogger)
                {
                    _loc_2 = true;
                    break;
                }
                _loc_4++;
            }
            _shouldBeConnected = true;
            if (!_loc_2)
            {
                _channelSets.push(ILogger);
                addEventListener(ChannelEvent.CONNECT, ILogger.channelConnectHandler);
                addEventListener(ChannelEvent.DISCONNECT, ILogger.channelDisconnectHandler);
                addEventListener(ChannelFaultEvent.FAULT, ILogger.channelFaultHandler);
            }
            if (connected)
            {
                ILogger.channelConnectHandler(ChannelEvent.createEvent(ChannelEvent.CONNECT, this, false, false, connected));
            }
            else if (!_connecting)
            {
                _connecting = true;
                if (connectTimeout > 0)
                {
                    _connectTimer = new Timer(connectTimeout * 1000, 1);
                    _connectTimer.addEventListener(TimerEvent.TIMER, connectTimeoutHandler);
                    _connectTimer.start();
                }
                if (FlexClient.getInstance().id == null)
                {
                    _loc_5 = FlexClient.getInstance();
                    if (!_loc_5.waitForFlexClientId)
                    {
                        _loc_5.waitForFlexClientId = true;
                        _ownsWaitGuard = true;
                        internalConnect();
                    }
                    else
                    {
                        _loc_5.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, flexClientWaitHandler);
                    }
                }
                else
                {
                    internalConnect();
                }
            }
            return;
        }// end function

        private function resetToPrimaryURI() : void
        {
            _connecting = false;
            setReconnecting(false);
            uri = _primaryURI;
            _failoverIndex = -1;
            return;
        }// end function

        function setAuthenticated(ILogger:Boolean) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            var _loc_3:ChannelSet = null;
            var _loc_4:int = 0;
            if (ILogger != _authenticated)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "authenticated", _authenticated, ILogger);
                _authenticated = ILogger;
                _loc_4 = 0;
                while (_loc_4 < _channelSets.length)
                {
                    
                    _loc_3 = ChannelSet(_channelSets[_loc_4]);
                    _loc_3.setAuthenticated(authenticated, credentials);
                    _loc_4++;
                }
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        function get loginAfterDisconnect() : Boolean
        {
            return _loginAfterDisconnect;
        }// end function

        private function failover() : void
        {
            var _loc_1:Timer = null;
            var _loc_3:* = _failoverIndex + 1;
            _failoverIndex = _loc_3;
            if ((_failoverIndex + 1) <= failoverURIs.length)
            {
                setReconnecting(true);
                uri = failoverURIs[_failoverIndex];
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' channel attempting to connect to {1}.", id, endpoint);
                }
                _loc_1 = new Timer(1, 1);
                _loc_1.addEventListener(TimerEvent.TIMER, reconnect);
                _loc_1.start();
            }
            else
            {
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' channel has exhausted failover options and has reset to its primary endpoint.", id);
                }
                resetToPrimaryURI();
            }
            return;
        }// end function

        public function get channelSets() : Array
        {
            return _channelSets;
        }// end function

        protected function disconnectFailed(event:ChannelFaultEvent) : void
        {
            _connecting = false;
            setConnected(false);
            if (Log.isError())
            {
                _log.error("\'{0}\' channel disconnect failed.", id);
            }
            if (reconnecting)
            {
                resetToPrimaryURI();
                event.reconnecting = false;
            }
            dispatchEvent(event);
            return;
        }// end function

    }
}
