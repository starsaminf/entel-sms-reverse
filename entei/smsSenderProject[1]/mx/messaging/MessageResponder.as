package mx.messaging
{
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import mx.messaging.messages.*;
    import mx.resources.*;

    public class MessageResponder extends Responder
    {
        private var _channel:Channel;
        private var _agent:MessageAgent;
        private var _requestTimedOut:Boolean;
        private var _message:IMessage;
        private var _requestTimer:Timer;
        private var resourceManager:IResourceManager;

        public function MessageResponder(param1:MessageAgent, param2:IMessage, param3:Channel = null)
        {
            resourceManager = ResourceManager.getInstance();
            super(result, status);
            _agent = param1;
            _channel = param3;
            _message = param2;
            _requestTimedOut = false;
            return;
        }// end function

        public function get channel() : Channel
        {
            return _channel;
        }// end function

        public function get agent() : MessageAgent
        {
            return _agent;
        }// end function

        protected function requestTimedOut() : void
        {
            return;
        }// end function

        final public function startRequestTimeout(_agent:int) : void
        {
            _requestTimer = new Timer(_agent * 1000, 1);
            _requestTimer.addEventListener(TimerEvent.TIMER, timeoutRequest);
            _requestTimer.start();
            return;
        }// end function

        public function get message() : IMessage
        {
            return _message;
        }// end function

        final public function result(_agent:IMessage) : void
        {
            if (!_requestTimedOut)
            {
                if (_requestTimer != null)
                {
                    releaseTimer();
                }
                resultHandler(_agent);
            }
            return;
        }// end function

        private function releaseTimer() : void
        {
            _requestTimer.stop();
            _requestTimer.removeEventListener(TimerEvent.TIMER, timeoutRequest);
            _requestTimer = null;
            return;
        }// end function

        public function set message(_agent:IMessage) : void
        {
            _message = _agent;
            return;
        }// end function

        protected function createRequestTimeoutErrorMessage() : ErrorMessage
        {
            var _loc_1:* = new ErrorMessage();
            _loc_1.correlationId = message.messageId;
            _loc_1.faultCode = "Client.Error.RequestTimeout";
            _loc_1.faultString = resourceManager.getString("messaging", "requestTimedOut");
            _loc_1.faultDetail = resourceManager.getString("messaging", "requestTimedOut.details");
            return _loc_1;
        }// end function

        private function timeoutRequest(event:TimerEvent) : void
        {
            _requestTimedOut = true;
            releaseTimer();
            requestTimedOut();
            return;
        }// end function

        final public function status(_agent:IMessage) : void
        {
            if (!_requestTimedOut)
            {
                if (_requestTimer != null)
                {
                    releaseTimer();
                }
                statusHandler(_agent);
            }
            return;
        }// end function

        protected function resultHandler(_agent:IMessage) : void
        {
            return;
        }// end function

        protected function statusHandler(_agent:IMessage) : void
        {
            return;
        }// end function

    }
}
