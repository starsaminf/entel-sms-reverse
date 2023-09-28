package mx.messaging
{
    import flash.utils.*;
    import mx.logging.*;
    import mx.messaging.events.*;

    public class ConsumerMessageDispatcher extends Object
    {
        private const _consumerDuplicateMessageBarrier:Object;
        private const _channelSetRefCounts:Dictionary;
        private const _consumers:Object;
        private static var _instance:ConsumerMessageDispatcher;

        public function ConsumerMessageDispatcher()
        {
            _consumers = {};
            _channelSetRefCounts = new Dictionary();
            _consumerDuplicateMessageBarrier = {};
            return;
        }// end function

        public function registerSubscription(ChannelSet:AbstractConsumer) : void
        {
            _consumers[ChannelSet.clientId] = ChannelSet;
            if (_channelSetRefCounts[ChannelSet.channelSet] == null)
            {
                ChannelSet.channelSet.addEventListener(MessageEvent.MESSAGE, messageHandler);
                _channelSetRefCounts[ChannelSet.channelSet] = 1;
            }
            else
            {
                var _loc_2:* = _channelSetRefCounts;
                var _loc_3:* = ChannelSet.channelSet;
                var _loc_4:* = _channelSetRefCounts[ChannelSet.channelSet] + 1;
                _loc_2[_loc_3] = _loc_4;
            }
            return;
        }// end function

        private function messageHandler(event:MessageEvent) : void
        {
            var _loc_3:String = null;
            var _loc_4:String = null;
            var _loc_2:* = _consumers[event.message.clientId];
            if (_loc_2 == null)
            {
                if (Log.isDebug())
                {
                    Log.getLogger("mx.messaging.Consumer").debug("\'{0}\' received pushed message for consumer but no longer subscribed: {1}", event.message.clientId, event.message);
                }
                return;
            }
            if (event.target.currentChannel.channelSets.length > 1)
            {
                _loc_3 = _loc_2.id;
                if (_consumerDuplicateMessageBarrier[_loc_3] == null)
                {
                    _consumerDuplicateMessageBarrier[_loc_3] = {};
                }
                _loc_4 = event.target.currentChannel.id;
                if (_consumerDuplicateMessageBarrier[_loc_3][_loc_4] != event.messageId)
                {
                    _consumerDuplicateMessageBarrier[_loc_3][_loc_4] = event.messageId;
                    _loc_2.messageHandler(event);
                }
            }
            else
            {
                _loc_2.messageHandler(event);
            }
            return;
        }// end function

        public function unregisterSubscription(ChannelSet:AbstractConsumer) : void
        {
            delete _consumers[ChannelSet.clientId];
            var _loc_2:* = _channelSetRefCounts[ChannelSet.channelSet];
            if (--_loc_2 == 0)
            {
                ChannelSet.channelSet.removeEventListener(MessageEvent.MESSAGE, messageHandler);
                _channelSetRefCounts[ChannelSet.channelSet] = null;
                if (_consumerDuplicateMessageBarrier[ChannelSet.id] != null)
                {
                    delete _consumerDuplicateMessageBarrier[ChannelSet.id];
                }
            }
            else
            {
                _channelSetRefCounts[ChannelSet.channelSet] = _loc_2 - 1;
            }
            return;
        }// end function

        public function isChannelUsedForSubscriptions(mx.messaging:ConsumerMessageDispatcher/ConsumerMessageDispatcher:Channel) : Boolean
        {
            var _loc_2:* = mx.messaging:ConsumerMessageDispatcher/ConsumerMessageDispatcher.channelSets;
            var _loc_3:ChannelSet = null;
            var _loc_4:* = _loc_2.length;
            var _loc_5:int = 0;
            while (_loc_5 < _loc_4)
            {
                
                _loc_3 = _loc_2[_loc_5];
                if (_channelSetRefCounts[_loc_3] != null && _loc_3.currentChannel == mx.messaging:ConsumerMessageDispatcher/ConsumerMessageDispatcher)
                {
                    return true;
                }
                _loc_5++;
            }
            return false;
        }// end function

        public static function getInstance() : ConsumerMessageDispatcher
        {
            if (!_instance)
            {
                _instance = new ConsumerMessageDispatcher;
            }
            return _instance;
        }// end function

    }
}
