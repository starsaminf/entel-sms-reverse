package mx.messaging
{
    import flash.events.*;
    import flash.utils.*;
    import mx.events.*;
    import mx.logging.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;
    import mx.resources.*;

    public class AbstractProducer extends MessageAgent
    {
        private var _currentAttempt:int;
        private var _autoConnect:Boolean = true;
        private var _reconnectTimer:Timer;
        protected var _shouldBeConnected:Boolean;
        private var _connectMsg:CommandMessage;
        private var _defaultHeaders:Object;
        private var _reconnectInterval:int;
        private var _reconnectAttempts:int;
        private var resourceManager:IResourceManager;

        public function AbstractProducer()
        {
            resourceManager = ResourceManager.getInstance();
            return;
        }// end function

        public function get reconnectAttempts() : int
        {
            return _reconnectAttempts;
        }// end function

        public function get defaultHeaders() : Object
        {
            return _defaultHeaders;
        }// end function

        public function set reconnectInterval(_autoConnect:int) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            var _loc_3:String = null;
            if (_reconnectInterval != _autoConnect)
            {
                if (_autoConnect < 0)
                {
                    _loc_3 = resourceManager.getString("messaging", "reconnectIntervalNegative");
                    throw new ArgumentError(_loc_3);
                }
                if (_autoConnect == 0)
                {
                    stopReconnectTimer();
                }
                else if (_reconnectTimer != null)
                {
                    _reconnectTimer.delay = _autoConnect;
                }
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "reconnectInterval", _reconnectInterval, _autoConnect);
                _reconnectInterval = _autoConnect;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function set defaultHeaders(_autoConnect:Object) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_defaultHeaders != _autoConnect)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "defaultHeaders", _defaultHeaders, _autoConnect);
                _defaultHeaders = _autoConnect;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function get reconnectInterval() : int
        {
            return _reconnectInterval;
        }// end function

        public function send(_autoConnect:IMessage) : void
        {
            var _loc_2:String = null;
            var _loc_3:ErrorMessage = null;
            if (!connected && autoConnect)
            {
                _shouldBeConnected = true;
            }
            if (defaultHeaders != null)
            {
                for (_loc_2 in defaultHeaders)
                {
                    
                    if (!_autoConnect.headers.hasOwnProperty(_loc_2))
                    {
                        _autoConnect.headers[_loc_2] = defaultHeaders[_loc_2];
                    }
                }
            }
            if (!connected && !autoConnect)
            {
                _shouldBeConnected = false;
                _loc_3 = new ErrorMessage();
                _loc_3.faultCode = "Client.Error.MessageSend";
                _loc_3.faultString = resourceManager.getString("messaging", "producerSendError");
                _loc_3.faultDetail = resourceManager.getString("messaging", "producerSendErrorDetails");
                _loc_3.correlationId = _autoConnect.messageId;
                internalFault(_loc_3, _autoConnect, false, true);
            }
            else
            {
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' {1} sending message \'{2}\'", id, _agentType, _autoConnect.messageId);
                }
                internalSend(_autoConnect);
            }
            return;
        }// end function

        protected function stopReconnectTimer() : void
        {
            if (_reconnectTimer != null)
            {
                if (Log.isDebug())
                {
                    _log.debug("\'{0}\' {1} stopping reconnect timer.", id, _agentType);
                }
                _reconnectTimer.removeEventListener(TimerEvent.TIMER, reconnect);
                _reconnectTimer.reset();
                _reconnectTimer = null;
            }
            return;
        }// end function

        override public function channelDisconnectHandler(event:ChannelEvent) : void
        {
            super.channelDisconnectHandler(event);
            if (_shouldBeConnected && !event.rejected)
            {
                startReconnectTimer();
            }
            return;
        }// end function

        protected function reconnect(event:TimerEvent) : void
        {
            if (_reconnectAttempts != -1 && _currentAttempt >= _reconnectAttempts)
            {
                stopReconnectTimer();
                _shouldBeConnected = false;
                fault(buildConnectErrorMessage(), _connectMsg);
                return;
            }
            if (Log.isDebug())
            {
                _log.debug("\'{0}\' {1} trying to reconnect.", id, _agentType);
            }
            _reconnectTimer.delay = _reconnectInterval;
            var _loc_3:* = _currentAttempt + 1;
            _currentAttempt = _loc_3;
            if (_connectMsg == null)
            {
                _connectMsg = buildConnectMessage();
            }
            internalSend(_connectMsg, false);
            return;
        }// end function

        private function buildConnectErrorMessage() : ErrorMessage
        {
            var _loc_1:* = new ErrorMessage();
            _loc_1.faultCode = "Client.Error.Connect";
            _loc_1.faultString = resourceManager.getString("messaging", "producerConnectError");
            _loc_1.faultDetail = resourceManager.getString("messaging", "failedToConnect");
            _loc_1.correlationId = _connectMsg.messageId;
            return _loc_1;
        }// end function

        override public function acknowledge(_autoConnect:AcknowledgeMessage, _autoConnect:IMessage) : void
        {
            if (_disconnectBarrier)
            {
                return;
            }
            super.acknowledge(_autoConnect, _autoConnect);
            if (_autoConnect is CommandMessage && CommandMessage(_autoConnect).operation == CommandMessage.TRIGGER_CONNECT_OPERATION)
            {
                stopReconnectTimer();
            }
            return;
        }// end function

        override public function fault(_autoConnect:ErrorMessage, _autoConnect:IMessage) : void
        {
            internalFault(_autoConnect, _autoConnect);
            return;
        }// end function

        override public function disconnect() : void
        {
            _shouldBeConnected = false;
            stopReconnectTimer();
            super.disconnect();
            return;
        }// end function

        function internalFault(_autoConnect:ErrorMessage, _autoConnect:IMessage, _autoConnect:Boolean = true, _autoConnect:Boolean = false) : void
        {
            var _loc_5:ErrorMessage = null;
            if (_disconnectBarrier && !_autoConnect)
            {
                return;
            }
            if (_autoConnect is CommandMessage && CommandMessage(_autoConnect).operation == CommandMessage.TRIGGER_CONNECT_OPERATION)
            {
                if (_reconnectTimer == null)
                {
                    if (_connectMsg != null && _autoConnect.correlationId == _connectMsg.messageId)
                    {
                        _shouldBeConnected = false;
                        _loc_5 = buildConnectErrorMessage();
                        _loc_5.rootCause = _autoConnect.rootCause;
                        super.fault(_loc_5, _autoConnect);
                    }
                    else
                    {
                        super.fault(_autoConnect, _autoConnect);
                    }
                }
            }
            else
            {
                super.fault(_autoConnect, _autoConnect);
            }
            return;
        }// end function

        public function connect() : void
        {
            if (!connected)
            {
                _shouldBeConnected = true;
                if (_connectMsg == null)
                {
                    _connectMsg = buildConnectMessage();
                }
                internalSend(_connectMsg, false);
            }
            return;
        }// end function

        override public function channelFaultHandler(event:ChannelFaultEvent) : void
        {
            super.channelFaultHandler(event);
            if (_shouldBeConnected && !event.rejected && !event.channel.connected)
            {
                startReconnectTimer();
            }
            return;
        }// end function

        private function buildConnectMessage() : CommandMessage
        {
            var _loc_1:* = new CommandMessage();
            _loc_1.operation = CommandMessage.TRIGGER_CONNECT_OPERATION;
            _loc_1.clientId = clientId;
            _loc_1.destination = destination;
            return _loc_1;
        }// end function

        protected function startReconnectTimer() : void
        {
            if (_shouldBeConnected && _reconnectTimer == null)
            {
                if (_reconnectAttempts != 0 && _reconnectInterval > 0)
                {
                    if (Log.isDebug())
                    {
                        _log.debug("\'{0}\' {1} starting reconnect timer.", id, _agentType);
                    }
                    _reconnectTimer = new Timer(1);
                    _reconnectTimer.addEventListener(TimerEvent.TIMER, reconnect);
                    _reconnectTimer.start();
                    _currentAttempt = 0;
                }
            }
            return;
        }// end function

        public function set autoConnect(_autoConnect:Boolean) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_autoConnect != _autoConnect)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "autoConnect", _autoConnect, _autoConnect);
                _autoConnect = _autoConnect;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function set reconnectAttempts(_autoConnect:int) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_reconnectAttempts != _autoConnect)
            {
                if (_autoConnect == 0)
                {
                    stopReconnectTimer();
                }
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "reconnectAttempts", _reconnectAttempts, _autoConnect);
                _reconnectAttempts = _autoConnect;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function get autoConnect() : Boolean
        {
            return _autoConnect;
        }// end function

    }
}
