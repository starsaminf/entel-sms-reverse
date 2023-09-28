package mx.messaging
{
    import mx.events.*;
    import mx.logging.*;
    import mx.messaging.messages.*;

    public class Producer extends AbstractProducer
    {
        private var _subtopic:String = "";

        public function Producer()
        {
            _log = Log.getLogger("mx.messaging.Producer");
            _agentType = "producer";
            return;
        }// end function

        override protected function internalSend(_agentType:IMessage, _agentType:Boolean = true) : void
        {
            if (subtopic.length > 0)
            {
                _agentType.headers[AsyncMessage.SUBTOPIC_HEADER] = subtopic;
            }
            super.internalSend(_agentType, _agentType);
            return;
        }// end function

        public function set subtopic(_agentType:String) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_subtopic != _agentType)
            {
                if (_agentType == null)
                {
                    _agentType = "";
                }
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "subtopic", _subtopic, _agentType);
                _subtopic = _agentType;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public function get subtopic() : String
        {
            return _subtopic;
        }// end function

    }
}
