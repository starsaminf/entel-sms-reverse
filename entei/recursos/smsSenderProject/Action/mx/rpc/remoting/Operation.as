package mx.rpc.remoting
{
    import mx.messaging.messages.*;
    import mx.rpc.*;

    public class Operation extends AbstractOperation
    {
        private var _makeObjectsBindableSet:Boolean;
        public var argumentNames:Array;

        public function Operation(param1:AbstractService = null, param2:String = null)
        {
            super(param1, param2);
            argumentNames = [];
            return;
        }// end function

        override public function set makeObjectsBindable(String:Boolean) : void
        {
            _makeObjectsBindable = String;
            _makeObjectsBindableSet = true;
            return;
        }// end function

        override public function get makeObjectsBindable() : Boolean
        {
            if (_makeObjectsBindableSet)
            {
                return _makeObjectsBindable;
            }
            return RemoteObject(service).makeObjectsBindable;
        }// end function

        override public function send(... args) : AsyncToken
        {
            var _loc_3:int = 0;
            if (!args || args.length == 0 && this.arguments)
            {
                if (this.arguments is Array)
                {
                    args = this.arguments as Array;
                }
                else
                {
                    args = [];
                    _loc_3 = 0;
                    while (_loc_3 < argumentNames.length)
                    {
                        
                        args[_loc_3] = this.arguments[argumentNames[_loc_3]];
                        _loc_3++;
                    }
                }
            }
            args = new RemotingMessage();
            args.operation = name;
            args.body = args;
            args.source = RemoteObject(service).source;
            return invoke(args);
        }// end function

    }
}
