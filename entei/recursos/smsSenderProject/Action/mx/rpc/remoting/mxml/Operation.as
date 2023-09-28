package mx.rpc.remoting.mxml
{
    import mx.managers.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;
    import mx.resources.*;
    import mx.rpc.*;
    import mx.rpc.events.*;
    import mx.rpc.mxml.*;

    public class Operation extends mx.rpc.remoting::Operation implements IMXMLSupport
    {
        private var _concurrency:String;
        private var remoteObject:RemoteObject;
        private var _showBusyCursor:Boolean;
        private var _concurrencySet:Boolean;
        private var _showBusyCursorSet:Boolean;
        private var resourceManager:IResourceManager;

        public function Operation(param1:mx.rpc.remoting::RemoteObject = null, param2:String = null)
        {
            resourceManager = ResourceManager.getInstance();
            super(param1, param2);
            this.remoteObject = RemoteObject(param1);
            return;
        }// end function

        override function getNetmonId() : String
        {
            return remoteObject.id;
        }// end function

        override function setService(mx.rpc.remoting.mxml:AbstractService) : void
        {
            super.setService(mx.rpc.remoting.mxml);
            remoteObject = RemoteObject(mx.rpc.remoting.mxml);
            return;
        }// end function

        override public function send(... args) : AsyncToken
        {
            args = null;
            var _loc_3:String = null;
            var _loc_4:Fault = null;
            var _loc_5:FaultEvent = null;
            if (Concurrency.SINGLE == concurrency && activeCalls.hasActiveCalls())
            {
                args = new AsyncToken(null);
                _loc_3 = resourceManager.getString("rpc", "pendingCallExists");
                _loc_4 = new Fault("ConcurrencyError", _loc_3);
                _loc_5 = FaultEvent.createEvent(_loc_4, args);
                new AsyncDispatcher(dispatchRpcEvent, [_loc_5], 10);
                return args;
            }
            if (asyncRequest.channelSet == null && remoteObject.endpoint != null)
            {
                remoteObject.initEndpoint();
            }
            return super.send.apply(null, args);
        }// end function

        public function get concurrency() : String
        {
            if (_concurrencySet)
            {
                return _concurrency;
            }
            return remoteObject.concurrency;
        }// end function

        public function get showBusyCursor() : Boolean
        {
            if (_showBusyCursorSet)
            {
                return _showBusyCursor;
            }
            return remoteObject.showBusyCursor;
        }// end function

        public function set showBusyCursor(mx.rpc.remoting.mxml:Boolean) : void
        {
            _showBusyCursor = mx.rpc.remoting.mxml;
            _showBusyCursorSet = true;
            return;
        }// end function

        public function set concurrency(mx.rpc.remoting.mxml:String) : void
        {
            _concurrency = mx.rpc.remoting.mxml;
            _concurrencySet = true;
            return;
        }// end function

        override function preHandle(event:MessageEvent) : AsyncToken
        {
            if (showBusyCursor)
            {
                CursorManager.removeBusyCursor();
            }
            var _loc_2:* = activeCalls.wasLastCall(AsyncMessage(event.message).correlationId);
            var _loc_3:* = super.preHandle(event);
            if (Concurrency.LAST == concurrency && !_loc_2)
            {
                return null;
            }
            return _loc_3;
        }// end function

        override function invoke(void:IMessage, void:AsyncToken = null) : AsyncToken
        {
            if (showBusyCursor)
            {
                CursorManager.setBusyCursor();
            }
            return super.invoke(void, void);
        }// end function

        override public function cancel(void:String = null) : AsyncToken
        {
            if (showBusyCursor)
            {
                CursorManager.removeBusyCursor();
            }
            return super.cancel(void);
        }// end function

    }
}
