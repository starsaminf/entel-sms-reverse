package mx.messaging.channels
{
    import PollingChannel.as$139.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.logging.*;
    import mx.messaging.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;
    import mx.resources.*;

    public class PollingChannel extends Channel
    {
        var _timer:Timer;
        private var _pollingEnabled:Boolean;
        private var _piggybackingEnabled:Boolean;
        var _pollingInterval:int;
        var pollOutstanding:Boolean;
        private var _pollingRef:int = -1;
        var _shouldPoll:Boolean;
        private var resourceManager:IResourceManager;
        private static const DEFAULT_POLLING_INTERVAL:int = 3000;

        public function PollingChannel(param1:String = null, param2:String = null)
        {
            resourceManager = ResourceManager.getInstance();
            super(param1, param2);
            _pollingEnabled = true;
            _shouldPoll = false;
            if (timerRequired())
            {
                _pollingInterval = DEFAULT_POLLING_INTERVAL;
                _timer = new Timer(_pollingInterval, 1);
                _timer.addEventListener(TimerEvent.TIMER, internalPoll);
            }
            return;
        }// end function

        public function enablePolling() : void
        {
            var _loc_2:* = _pollingRef + 1;
            _pollingRef = _loc_2;
            if (_pollingRef == 0)
            {
                startPolling();
            }
            return;
        }// end function

        protected function timerRequired() : Boolean
        {
            return true;
        }// end function

        override protected function connectFailed(event:ChannelFaultEvent) : void
        {
            stopPolling();
            super.connectFailed(event);
            return;
        }// end function

        override public function send(flash.utils:MessageAgent, flash.utils:IMessage) : void
        {
            var consumerDispatcher:ConsumerMessageDispatcher;
            var msg:CommandMessage;
            var agent:* = flash.utils;
            var message:* = flash.utils;
            var piggyback:Boolean;
            if (!pollOutstanding && _piggybackingEnabled && !(message is CommandMessage))
            {
                if (_shouldPoll)
                {
                    piggyback;
                }
                else
                {
                    consumerDispatcher = ConsumerMessageDispatcher.getInstance();
                    if (consumerDispatcher.isChannelUsedForSubscriptions(this))
                    {
                        piggyback;
                    }
                }
            }
            if (piggyback)
            {
                internalPoll();
            }
            super.send(agent, message);
            if (piggyback)
            {
                msg = new CommandMessage();
                msg.operation = CommandMessage.POLL_OPERATION;
                if (Log.isDebug())
                {
                    _log.debug("\'{0}\' channel sending poll message\n{1}\n", id, msg.toString());
                }
                try
                {
                    internalSend(new PollCommandMessageResponder(null, msg, this, _log));
                }
                catch (e:Error)
                {
                    stopPolling();
                    throw e;
                }
            }
            return;
        }// end function

        protected function getPollSyncMessageResponder(mx.messaging.messages:MessageAgent, mx.messaging.messages:CommandMessage) : MessageResponder
        {
            return null;
        }// end function

        protected function applyPollingSettings(flash.utils:XML) : void
        {
            var _loc_2:XML = null;
            if (flash.utils.properties.length())
            {
                _loc_2 = flash.utils.properties[0];
                if (_loc_2["polling-enabled"].length())
                {
                    internalPollingEnabled = _loc_2["polling-enabled"].toString() == "true";
                }
                if (_loc_2["polling-interval-millis"].length())
                {
                    internalPollingInterval = parseInt(_loc_2["polling-interval-millis"].toString());
                }
                else if (_loc_2["polling-interval-seconds"].length())
                {
                    internalPollingInterval = parseInt(_loc_2["polling-interval-seconds"].toString()) * 1000;
                }
                if (_loc_2["piggybacking-enabled"].length())
                {
                    internalPiggybackingEnabled = _loc_2["piggybacking-enabled"].toString() == "true";
                }
                if (_loc_2["login-after-disconnect"].length())
                {
                    _loginAfterDisconnect = _loc_2["login-after-disconnect"].toString() == "true";
                }
            }
            return;
        }// end function

        function set internalPollingInterval(flash.utils:Number) : void
        {
            var _loc_2:String = null;
            if (flash.utils == 0)
            {
                _pollingInterval = flash.utils;
                if (_timer != null)
                {
                    _timer.stop();
                }
                if (_shouldPoll)
                {
                    startPolling();
                }
            }
            else if (flash.utils > 0)
            {
                if (_timer != null)
                {
                    var _loc_3:* = flash.utils;
                    _pollingInterval = flash.utils;
                    _timer.delay = _loc_3;
                    if (!timerRunning && _shouldPoll)
                    {
                        startPolling();
                    }
                }
            }
            else
            {
                _loc_2 = resourceManager.getString("messaging", "pollingIntervalNonPositive");
                throw new ArgumentError(_loc_2);
            }
            return;
        }// end function

        public function poll() : void
        {
            internalPoll();
            return;
        }// end function

        protected function set internalPiggybackingEnabled(flash.utils:Boolean) : void
        {
            _piggybackingEnabled = flash.utils;
            return;
        }// end function

        protected function get internalPollingEnabled() : Boolean
        {
            return _pollingEnabled;
        }// end function

        function pollFailed(flash.utils:Boolean = false) : void
        {
            internalDisconnect(flash.utils);
            return;
        }// end function

        function stopPolling() : void
        {
            if (Log.isInfo())
            {
                _log.info("\'{0}\' channel polling stopped.", id);
            }
            if (_timer != null)
            {
                _timer.stop();
            }
            _pollingRef = -1;
            _shouldPoll = false;
            pollOutstanding = false;
            return;
        }// end function

        protected function internalPoll(event:Event = null) : void
        {
            var msg:CommandMessage;
            var event:* = event;
            if (!pollOutstanding)
            {
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' channel requesting queued messages.", id);
                }
                if (timerRunning)
                {
                    _timer.stop();
                }
                msg = new CommandMessage();
                msg.operation = CommandMessage.POLL_OPERATION;
                if (Log.isDebug())
                {
                    _log.debug("\'{0}\' channel sending poll message\n{1}\n", id, msg.toString());
                }
                try
                {
                    internalSend(new PollCommandMessageResponder(null, msg, this, _log));
                    pollOutstanding = true;
                }
                catch (e:Error)
                {
                    stopPolling();
                    throw e;
                }
            }
            else if (Log.isInfo())
            {
                _log.info("\'{0}\' channel waiting for poll response.", id);
            }
            return;
        }// end function

        protected function getDefaultMessageResponder(mx.messaging.messages:MessageAgent, mx.messaging.messages:IMessage) : MessageResponder
        {
            return super.getMessageResponder(mx.messaging.messages, mx.messaging.messages);
        }// end function

        function get internalPollingInterval() : Number
        {
            return _timer == null ? (0) : (_pollingInterval);
        }// end function

        protected function startPolling() : void
        {
            if (_pollingEnabled)
            {
                if (Log.isInfo())
                {
                    _log.info("\'{0}\' channel polling started.", id);
                }
                _shouldPoll = true;
                poll();
            }
            return;
        }// end function

        protected function get internalPiggybackingEnabled() : Boolean
        {
            return _piggybackingEnabled;
        }// end function

        override function get realtime() : Boolean
        {
            return _pollingEnabled;
        }// end function

        final override protected function getMessageResponder(mx.messaging.messages:MessageAgent, mx.messaging.messages:IMessage) : MessageResponder
        {
            var _loc_4:CommandMessage = null;
            var _loc_3:MessageResponder = null;
            if (mx.messaging.messages is CommandMessage)
            {
                _loc_4 = CommandMessage(mx.messaging.messages);
                if (_loc_4.operation == CommandMessage.SUBSCRIBE_OPERATION || _loc_4.operation == CommandMessage.UNSUBSCRIBE_OPERATION)
                {
                    _loc_3 = getPollSyncMessageResponder(mx.messaging.messages, _loc_4);
                }
                else if (_loc_4.operation == CommandMessage.POLL_OPERATION)
                {
                    _loc_3 = new PollCommandMessageResponder(mx.messaging.messages, mx.messaging.messages, this, _log);
                }
            }
            return _loc_3 == null ? (getDefaultMessageResponder(mx.messaging.messages, mx.messaging.messages)) : (_loc_3);
        }// end function

        override protected function internalDisconnect(flash.utils:Boolean = false) : void
        {
            stopPolling();
            super.internalDisconnect(flash.utils);
            return;
        }// end function

        function get timerRunning() : Boolean
        {
            return _timer != null && _timer.running;
        }// end function

        public function disablePolling() : void
        {
            var _loc_2:* = _pollingRef - 1;
            _pollingRef = _loc_2;
            if (_pollingRef < 0)
            {
                stopPolling();
            }
            return;
        }// end function

        protected function set internalPollingEnabled(flash.utils:Boolean) : void
        {
            _pollingEnabled = flash.utils;
            if (!flash.utils && (timerRunning || !timerRunning && _pollingInterval == 0))
            {
                stopPolling();
            }
            else if (flash.utils && _shouldPoll && !timerRunning)
            {
                startPolling();
            }
            return;
        }// end function

    }
}
