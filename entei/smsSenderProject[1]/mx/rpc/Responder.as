package mx.rpc
{

    public class Responder extends Object implements IResponder
    {
        private var _faultHandler:Function;
        private var _resultHandler:Function;

        public function Responder(param1:Function, param2:Function)
        {
            _resultHandler = param1;
            _faultHandler = param2;
            return;
        }// end function

        public function result(result:Object) : void
        {
            _resultHandler(result);
            return;
        }// end function

        public function fault(result:Object) : void
        {
            _faultHandler(result);
            return;
        }// end function

    }
}
