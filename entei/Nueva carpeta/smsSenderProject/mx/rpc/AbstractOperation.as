package mx.rpc
{
    import mx.resources.*;
    import mx.rpc.events.*;

    public class AbstractOperation extends AbstractInvoker
    {
        private var _name:String;
        public var arguments:Object;
        var _service:AbstractService;
        private var resourceManager:IResourceManager;

        public function AbstractOperation(param1:AbstractService = null, param2:String = null)
        {
            resourceManager = ResourceManager.getInstance();
            _service = param1;
            _name = param2;
            this.arguments = {};
            return;
        }// end function

        public function set name(http://www.adobe.com/2006/flex/mx/internal:String) : void
        {
            var _loc_2:String = null;
            if (!_name)
            {
                _name = http://www.adobe.com/2006/flex/mx/internal;
            }
            else
            {
                _loc_2 = resourceManager.getString("rpc", "cannotResetOperationName");
                throw new Error(_loc_2);
            }
            return;
        }// end function

        public function send(... args) : AsyncToken
        {
            return null;
        }// end function

        public function get name() : String
        {
            return _name;
        }// end function

        override function dispatchRpcEvent(event:AbstractEvent) : void
        {
            event.callTokenResponders();
            if (!event.isDefaultPrevented())
            {
                if (hasEventListener(event.type))
                {
                    dispatchEvent(event);
                }
                else
                {
                    _service.dispatchEvent(event);
                }
            }
            return;
        }// end function

        public function get service() : AbstractService
        {
            return _service;
        }// end function

        function setService(http://www.adobe.com/2006/flex/mx/internal:AbstractService) : void
        {
            var _loc_2:String = null;
            if (!_service)
            {
                _service = http://www.adobe.com/2006/flex/mx/internal;
            }
            else
            {
                _loc_2 = resourceManager.getString("rpc", "cannotResetService");
                throw new Error(_loc_2);
            }
            return;
        }// end function

    }
}
