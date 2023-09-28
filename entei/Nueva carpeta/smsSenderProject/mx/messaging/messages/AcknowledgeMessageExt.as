package mx.messaging.messages
{
    import flash.utils.*;

    public class AcknowledgeMessageExt extends AcknowledgeMessage implements IExternalizable
    {
        private var _message:AcknowledgeMessage;

        public function AcknowledgeMessageExt(param1:AcknowledgeMessage = null)
        {
            _message = param1;
            return;
        }// end function

        override public function get messageId() : String
        {
            if (_message != null)
            {
                return _message.messageId;
            }
            return super.messageId;
        }// end function

        override public function writeExternal(message:IDataOutput) : void
        {
            if (_message != null)
            {
                _message.writeExternal(message);
            }
            else
            {
                super.writeExternal(message);
            }
            return;
        }// end function

    }
}
