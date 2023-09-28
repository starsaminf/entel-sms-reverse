package mx.messaging.messages
{
    import flash.utils.*;
    import mx.utils.*;

    public class AsyncMessage extends AbstractMessage implements ISmallMessage
    {
        private var _correlationId:String;
        private var correlationIdBytes:ByteArray;
        private static const CORRELATION_ID_FLAG:uint = 1;
        private static const CORRELATION_ID_BYTES_FLAG:uint = 2;
        public static const SUBTOPIC_HEADER:String = "DSSubtopic";

        public function AsyncMessage(param1:Object = null, param2:Object = null)
        {
            correlationId = "";
            if (param1 != null)
            {
                this.body = param1;
            }
            if (param2 != null)
            {
                this.headers = param2;
            }
            return;
        }// end function

        override protected function addDebugAttributes(mx.messaging.messages:AsyncMessage/AsyncMessage:Object) : void
        {
            super.addDebugAttributes(mx.messaging.messages:AsyncMessage/AsyncMessage);
            mx.messaging.messages:AsyncMessage/AsyncMessage["correlationId"] = correlationId;
            return;
        }// end function

        override public function readExternal(mx.messaging.messages:AsyncMessage/AsyncMessage:IDataInput) : void
        {
            var _loc_4:uint = 0;
            var _loc_5:uint = 0;
            var _loc_6:uint = 0;
            super.readExternal(mx.messaging.messages:AsyncMessage/AsyncMessage);
            var _loc_2:* = readFlags(mx.messaging.messages:AsyncMessage/AsyncMessage);
            var _loc_3:uint = 0;
            while (_loc_3 < _loc_2.length)
            {
                
                _loc_4 = _loc_2[_loc_3] as uint;
                _loc_5 = 0;
                if (_loc_3 == 0)
                {
                    if ((_loc_4 & CORRELATION_ID_FLAG) != 0)
                    {
                        correlationId = mx.messaging.messages:AsyncMessage/AsyncMessage.readObject() as String;
                    }
                    if ((_loc_4 & CORRELATION_ID_BYTES_FLAG) != 0)
                    {
                        correlationIdBytes = mx.messaging.messages:AsyncMessage/AsyncMessage.readObject() as ByteArray;
                        correlationId = RPCUIDUtil.fromByteArray(correlationIdBytes);
                    }
                    _loc_5 = 2;
                }
                if (_loc_4 >> _loc_5 != 0)
                {
                    _loc_6 = _loc_5;
                    while (_loc_6 < 6)
                    {
                        
                        if ((_loc_4 >> _loc_6 & 1) != 0)
                        {
                            mx.messaging.messages:AsyncMessage/AsyncMessage.readObject();
                        }
                        _loc_6 = _loc_6 + 1;
                    }
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        public function getSmallMessage() : IMessage
        {
            var _loc_1:Object = this;
            if (_loc_1.constructor == AsyncMessage)
            {
                return new AsyncMessageExt(this);
            }
            return null;
        }// end function

        override public function writeExternal(mx.messaging.messages:AsyncMessage/AsyncMessage:IDataOutput) : void
        {
            super.writeExternal(mx.messaging.messages:AsyncMessage/AsyncMessage);
            if (correlationIdBytes == null)
            {
                correlationIdBytes = RPCUIDUtil.toByteArray(_correlationId);
            }
            var _loc_2:uint = 0;
            if (correlationId != null && correlationIdBytes == null)
            {
                _loc_2 = _loc_2 | CORRELATION_ID_FLAG;
            }
            if (correlationIdBytes != null)
            {
                _loc_2 = _loc_2 | CORRELATION_ID_BYTES_FLAG;
            }
            mx.messaging.messages:AsyncMessage/AsyncMessage.writeByte(_loc_2);
            if (correlationId != null && correlationIdBytes == null)
            {
                mx.messaging.messages:AsyncMessage/AsyncMessage.writeObject(correlationId);
            }
            if (correlationIdBytes != null)
            {
                mx.messaging.messages:AsyncMessage/AsyncMessage.writeObject(correlationIdBytes);
            }
            return;
        }// end function

        public function set correlationId(mx.messaging.messages:AsyncMessage/AsyncMessage:String) : void
        {
            _correlationId = mx.messaging.messages:AsyncMessage/AsyncMessage;
            correlationIdBytes = null;
            return;
        }// end function

        public function get correlationId() : String
        {
            return _correlationId;
        }// end function

    }
}
