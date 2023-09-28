package mx.rpc
{

    public class ActiveCalls extends Object
    {
        private var callOrder:Array;
        private var calls:Object;

        public function ActiveCalls()
        {
            calls = {};
            callOrder = [];
            return;
        }// end function

        public function removeCall(id:String) : AsyncToken
        {
            var _loc_2:* = calls[id];
            if (_loc_2 != null)
            {
                delete calls[id];
                callOrder.splice(callOrder.lastIndexOf(id), 1);
            }
            return _loc_2;
        }// end function

        public function cancelLast() : AsyncToken
        {
            if (callOrder.length > 0)
            {
                return removeCall(callOrder[(callOrder.length - 1)] as String);
            }
            return null;
        }// end function

        public function hasActiveCalls() : Boolean
        {
            return callOrder.length > 0;
        }// end function

        public function wasLastCall(http://adobe.com/AS3/2006/builtin:String) : Boolean
        {
            if (callOrder.length > 0)
            {
                return callOrder[(callOrder.length - 1)] == http://adobe.com/AS3/2006/builtin;
            }
            return false;
        }// end function

        public function getAllMessages() : Array
        {
            var _loc_2:String = null;
            var _loc_1:Array = [];
            for (_loc_2 in calls)
            {
                
                _loc_1.push(calls[_loc_2]);
            }
            return _loc_1;
        }// end function

        public function addCall(callOrder:String, callOrder:AsyncToken) : void
        {
            calls[callOrder] = callOrder;
            callOrder.push(callOrder);
            return;
        }// end function

    }
}
