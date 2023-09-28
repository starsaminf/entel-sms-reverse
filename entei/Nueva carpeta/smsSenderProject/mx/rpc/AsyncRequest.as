package mx.rpc
{
    import mx.messaging.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;

    public class AsyncRequest extends Producer
    {
        private var _pendingRequests:Object;

        public function AsyncRequest()
        {
            _pendingRequests = {};
            return;
        }// end function

        override public function hasPendingRequestForMessage(flash.events:EventDispatcher:IMessage) : Boolean
        {
            var _loc_2:* = flash.events:EventDispatcher.messageId;
            return _pendingRequests[_loc_2];
        }// end function

        override public function fault(mx.messaging.messages:ErrorMessage, mx.messaging.messages:IMessage) : void
        {
            super.fault(mx.messaging.messages, mx.messaging.messages);
            if (_ignoreFault)
            {
                return;
            }
            var _loc_3:* = mx.messaging.messages.messageId;
            var _loc_4:* = IResponder(_pendingRequests[_loc_3]);
            if (_loc_4)
            {
                delete _pendingRequests[_loc_3];
                _loc_4.fault(MessageFaultEvent.createEvent(mx.messaging.messages));
            }
            return;
        }// end function

        public function invoke(mx.messaging.messages:IMessage, mx.messaging.messages:IResponder) : void
        {
            _pendingRequests[mx.messaging.messages.messageId] = mx.messaging.messages;
            send(mx.messaging.messages);
            return;
        }// end function

        override public function acknowledge(mx.messaging.messages:AcknowledgeMessage, mx.messaging.messages:IMessage) : void
        {
            var _loc_4:String = null;
            var _loc_5:IResponder = null;
            var _loc_3:* = mx.messaging.messages.headers[AcknowledgeMessage.ERROR_HINT_HEADER];
            super.acknowledge(mx.messaging.messages, mx.messaging.messages);
            if (!_loc_3)
            {
                _loc_4 = mx.messaging.messages.correlationId;
                _loc_5 = IResponder(_pendingRequests[_loc_4]);
                if (_loc_5)
                {
                    delete _pendingRequests[_loc_4];
                    _loc_5.result(MessageEvent.createEvent(MessageEvent.RESULT, mx.messaging.messages));
                }
            }
            return;
        }// end function

    }
}
