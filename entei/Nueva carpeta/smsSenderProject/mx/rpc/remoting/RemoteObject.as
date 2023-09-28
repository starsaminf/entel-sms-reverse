package mx.rpc.remoting
{
    import mx.rpc.*;

    dynamic public class RemoteObject extends AbstractService
    {
        private var _source:String;
        private var _makeObjectsBindable:Boolean;

        public function RemoteObject(param1:String = null)
        {
            super(param1);
            makeObjectsBindable = true;
            return;
        }// end function

        public function set makeObjectsBindable(makeObjectsBindable:Boolean) : void
        {
            _makeObjectsBindable = makeObjectsBindable;
            return;
        }// end function

        public function set source(makeObjectsBindable:String) : void
        {
            _source = makeObjectsBindable;
            return;
        }// end function

        override public function setRemoteCredentials(makeObjectsBindable:String, makeObjectsBindable:String, makeObjectsBindable:String = null) : void
        {
            super.setRemoteCredentials(makeObjectsBindable, makeObjectsBindable, makeObjectsBindable);
            return;
        }// end function

        override public function getOperation(_makeObjectsBindable:String) : AbstractOperation
        {
            var _loc_2:* = super.getOperation(_makeObjectsBindable);
            if (_loc_2 == null)
            {
                _loc_2 = new Operation(this, _makeObjectsBindable);
                _operations[_makeObjectsBindable] = _loc_2;
                _loc_2.asyncRequest = asyncRequest;
            }
            return _loc_2;
        }// end function

        public function toString() : String
        {
            var _loc_1:String = "[RemoteObject ";
            _loc_1 = _loc_1 + (" destination=\"" + destination + "\"");
            if (source)
            {
                _loc_1 = _loc_1 + (" source=\"" + source + "\"");
            }
            _loc_1 = _loc_1 + (" channelSet=\"" + channelSet + "\"]");
            return _loc_1;
        }// end function

        public function get source() : String
        {
            return _source;
        }// end function

        public function get makeObjectsBindable() : Boolean
        {
            return _makeObjectsBindable;
        }// end function

    }
}
