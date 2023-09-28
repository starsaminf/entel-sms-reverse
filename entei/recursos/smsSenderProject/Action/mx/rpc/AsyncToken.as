package mx.rpc
{
    import flash.events.*;
    import mx.events.*;
    import mx.messaging.messages.*;
    import mx.rpc.events.*;

    dynamic public class AsyncToken extends EventDispatcher
    {
        private var _message:IMessage;
        private var _responders:Array;
        private var _result:Object;

        public function AsyncToken(param1:IMessage)
        {
            _message = param1;
            return;
        }// end function

        public function addResponder(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as:IResponder) : void
        {
            if (_responders == null)
            {
                _responders = [];
            }
            _responders.push(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as);
            return;
        }// end function

        function setMessage(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as:IMessage) : void
        {
            _message = C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as;
            return;
        }// end function

        public function get message() : IMessage
        {
            return _message;
        }// end function

        function applyResult(event:ResultEvent) : void
        {
            var _loc_2:uint = 0;
            var _loc_3:IResponder = null;
            setResult(event.result);
            if (_responders != null)
            {
                _loc_2 = 0;
                while (_loc_2 < _responders.length)
                {
                    
                    _loc_3 = _responders[_loc_2];
                    if (_loc_3 != null)
                    {
                        _loc_3.result(event);
                    }
                    _loc_2 = _loc_2 + 1;
                }
            }
            return;
        }// end function

        public function hasResponder() : Boolean
        {
            return _responders != null && _responders.length > 0;
        }// end function

        public function get responders() : Array
        {
            return _responders;
        }// end function

        function applyFault(event:FaultEvent) : void
        {
            var _loc_2:uint = 0;
            var _loc_3:IResponder = null;
            if (_responders != null)
            {
                _loc_2 = 0;
                while (_loc_2 < _responders.length)
                {
                    
                    _loc_3 = _responders[_loc_2];
                    if (_loc_3 != null)
                    {
                        _loc_3.fault(event);
                    }
                    _loc_2 = _loc_2 + 1;
                }
            }
            return;
        }// end function

        public function get result() : Object
        {
            return _result;
        }// end function

        function setResult(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as:Object) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_result !== C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "result", _result, C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as);
                _result = C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\rpc;AsyncToken.as;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

    }
}
