package mx.rpc.remoting.mxml
{
    import flash.events.*;
    import mx.messaging.*;
    import mx.messaging.channels.*;
    import mx.resources.*;
    import mx.rpc.*;
    import mx.rpc.events.*;
    import mx.rpc.mxml.*;

    dynamic public class RemoteObject extends mx.rpc.remoting::RemoteObject implements IMXMLSupport, IMXMLObject
    {
        var document:Object;
        private var _concurrency:String;
        var id:String;
        private var _showBusyCursor:Boolean;
        private var _endpoint:String;
        private var resourceManager:IResourceManager;

        public function RemoteObject(param1:String = null)
        {
            resourceManager = ResourceManager.getInstance();
            super(param1);
            concurrency = Concurrency.MULTIPLE;
            showBusyCursor = false;
            return;
        }// end function

        override public function dispatchEvent(event:Event) : Boolean
        {
            var _loc_2:String = null;
            var _loc_3:ErrorEvent = null;
            var _loc_4:String = null;
            if (hasEventListener(event.type))
            {
                return super.dispatchEvent(event);
            }
            if (event is FaultEvent && !hasTokenResponders(event) || event is ErrorEvent)
            {
                _loc_2 = event is FaultEvent ? (FaultEvent(event).fault.faultString) : (ErrorEvent(event).text);
                if (document && document.willTrigger(ErrorEvent.ERROR))
                {
                    _loc_3 = new ErrorEvent(ErrorEvent.ERROR, true, true);
                    _loc_3.text = _loc_2;
                    return document.dispatchEvent(_loc_3);
                }
                if (event is FaultEvent)
                {
                    throw FaultEvent(event).fault;
                }
                _loc_4 = resourceManager.getString("rpc", "noListenerForEvent", [_loc_2]);
                throw new Error(_loc_4);
            }
            return false;
        }// end function

        function initEndpoint() : void
        {
            var _loc_1:Channel = null;
            if (endpoint != null)
            {
                if (endpoint.indexOf("https") == 0)
                {
                    _loc_1 = new SecureAMFChannel(null, endpoint);
                }
                else
                {
                    _loc_1 = new AMFChannel(null, endpoint);
                }
                channelSet = new ChannelSet();
                channelSet.addChannel(_loc_1);
            }
            return;
        }// end function

        public function get endpoint() : String
        {
            return _endpoint;
        }// end function

        public function get concurrency() : String
        {
            return _concurrency;
        }// end function

        public function set showBusyCursor(Concurrency:Boolean) : void
        {
            _showBusyCursor = Concurrency;
            return;
        }// end function

        public function initialized(Concurrency:Object, Concurrency:String) : void
        {
            this.document = Concurrency;
            this.id = Concurrency;
            return;
        }// end function

        public function get showBusyCursor() : Boolean
        {
            return _showBusyCursor;
        }// end function

        public function set concurrency(Concurrency:String) : void
        {
            _concurrency = Concurrency;
            return;
        }// end function

        public function set endpoint(Concurrency:String) : void
        {
            if (_endpoint != Concurrency || Concurrency == null)
            {
                _endpoint = Concurrency;
                channelSet = null;
            }
            return;
        }// end function

        override public function getOperation(hasEventListener:String) : AbstractOperation
        {
            var _loc_2:* = _operations[hasEventListener];
            var _loc_3:* = _loc_2 is AbstractOperation ? (AbstractOperation(_loc_2)) : (null);
            if (_loc_3 == null)
            {
                _loc_3 = new Operation(this, hasEventListener);
                _operations[hasEventListener] = _loc_3;
                _loc_3.asyncRequest = asyncRequest;
            }
            return _loc_3;
        }// end function

    }
}
