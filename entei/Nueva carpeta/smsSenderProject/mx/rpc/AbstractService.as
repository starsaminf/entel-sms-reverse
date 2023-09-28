package mx.rpc
{
    import flash.events.*;
    import flash.utils.*;
    import mx.messaging.*;
    import mx.resources.*;
    import mx.rpc.events.*;

    dynamic public class AbstractService extends Proxy implements IEventDispatcher
    {
        var asyncRequest:AsyncRequest;
        var _operations:Object;
        private var nextNameArray:Array;
        private var eventDispatcher:EventDispatcher;
        var _availableChannelIds:Array;
        private var resourceManager:IResourceManager;

        public function AbstractService(param1:String = null)
        {
            resourceManager = ResourceManager.getInstance();
            eventDispatcher = new EventDispatcher(this);
            asyncRequest = new AsyncRequest();
            if (param1)
            {
                this.destination = param1;
            }
            _operations = {};
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return eventDispatcher.dispatchEvent(event);
        }// end function

        public function setRemoteCredentials(http://www.adobe.com/2006/flex/mx/internal:String, http://www.adobe.com/2006/flex/mx/internal:String, http://www.adobe.com/2006/flex/mx/internal:String = null) : void
        {
            asyncRequest.setRemoteCredentials(http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal);
            return;
        }// end function

        public function set channelSet(http://www.adobe.com/2006/flex/mx/internal:ChannelSet) : void
        {
            if (channelSet != http://www.adobe.com/2006/flex/mx/internal)
            {
                asyncRequest.channelSet = http://www.adobe.com/2006/flex/mx/internal;
            }
            return;
        }// end function

        public function removeEventListener(http://www.adobe.com/2006/flex/mx/internal:String, http://www.adobe.com/2006/flex/mx/internal:Function, http://www.adobe.com/2006/flex/mx/internal:Boolean = false) : void
        {
            eventDispatcher.removeEventListener(http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal);
            return;
        }// end function

        public function addEventListener(http://www.adobe.com/2006/flex/mx/internal:String, http://www.adobe.com/2006/flex/mx/internal:Function, http://www.adobe.com/2006/flex/mx/internal:Boolean = false, http://www.adobe.com/2006/flex/mx/internal:int = 0, http://www.adobe.com/2006/flex/mx/internal:Boolean = false) : void
        {
            eventDispatcher.addEventListener(http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal);
            return;
        }// end function

        public function get destination() : String
        {
            return asyncRequest.destination;
        }// end function

        function hasTokenResponders(event:Event) : Boolean
        {
            var _loc_2:AbstractEvent = null;
            if (event is AbstractEvent)
            {
                _loc_2 = event as AbstractEvent;
                if (_loc_2.token != null && _loc_2.token.hasResponder())
                {
                    return true;
                }
            }
            return false;
        }// end function

        public function get requestTimeout() : int
        {
            return asyncRequest.requestTimeout;
        }// end function

        override function callProperty(param1, ... args)
        {
            return getOperation(getLocalName(param1)).send.apply(null, args);
        }// end function

        public function willTrigger(value:String) : Boolean
        {
            return eventDispatcher.willTrigger(value);
        }// end function

        override function setProperty(http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal) : void
        {
            var _loc_3:* = resourceManager.getString("rpc", "operationsNotAllowedInService", [getLocalName(http://www.adobe.com/2006/flex/mx/internal)]);
            throw new Error(_loc_3);
        }// end function

        public function set operations(http://www.adobe.com/2006/flex/mx/internal:Object) : void
        {
            var _loc_2:AbstractOperation = null;
            var _loc_3:String = null;
            for (_loc_3 in http://www.adobe.com/2006/flex/mx/internal)
            {
                
                _loc_2 = AbstractOperation(http://www.adobe.com/2006/flex/mx/internal[_loc_3]);
                _loc_2.setService(this);
                if (!_loc_2.name)
                {
                    _loc_2.name = _loc_3;
                }
                _loc_2.asyncRequest = asyncRequest;
            }
            _operations = http://www.adobe.com/2006/flex/mx/internal;
            return;
        }// end function

        public function logout() : void
        {
            asyncRequest.logout();
            return;
        }// end function

        override function getProperty(param1)
        {
            return getOperation(getLocalName(param1));
        }// end function

        public function set destination(http://www.adobe.com/2006/flex/mx/internal:String) : void
        {
            asyncRequest.destination = http://www.adobe.com/2006/flex/mx/internal;
            return;
        }// end function

        override function nextName(EventDispatcher:int) : String
        {
            return nextNameArray[(EventDispatcher - 1)];
        }// end function

        public function get channelSet() : ChannelSet
        {
            return asyncRequest.channelSet;
        }// end function

        override function nextValue(param1:int)
        {
            return _operations[nextNameArray[(param1 - 1)]];
        }// end function

        override function nextNameIndex(mx.rpc:AbstractService/channelSet/get:int) : int
        {
            var _loc_2:String = null;
            if (mx.rpc:AbstractService/channelSet/get == 0)
            {
                nextNameArray = [];
                for (_loc_2 in _operations)
                {
                    
                    nextNameArray.push(_loc_2);
                }
            }
            return mx.rpc:AbstractService/channelSet/get < nextNameArray.length ? ((mx.rpc:AbstractService/channelSet/get + 1)) : (0);
        }// end function

        public function set requestTimeout(http://www.adobe.com/2006/flex/mx/internal:int) : void
        {
            if (requestTimeout != http://www.adobe.com/2006/flex/mx/internal)
            {
                asyncRequest.requestTimeout = http://www.adobe.com/2006/flex/mx/internal;
            }
            return;
        }// end function

        function getLocalName(EventDispatcher:Object) : String
        {
            if (EventDispatcher is QName)
            {
                return QName(EventDispatcher).localName;
            }
            return String(EventDispatcher);
        }// end function

        public function valueOf() : Object
        {
            return this;
        }// end function

        public function disconnect() : void
        {
            asyncRequest.disconnect();
            return;
        }// end function

        public function get operations() : Object
        {
            return _operations;
        }// end function

        public function getOperation(mx.rpc:String) : AbstractOperation
        {
            var _loc_2:* = _operations[mx.rpc];
            var _loc_3:* = _loc_2 is AbstractOperation ? (AbstractOperation(_loc_2)) : (null);
            return _loc_3;
        }// end function

        public function setCredentials(http://www.adobe.com/2006/flex/mx/internal:String, http://www.adobe.com/2006/flex/mx/internal:String, http://www.adobe.com/2006/flex/mx/internal:String = null) : void
        {
            asyncRequest.setCredentials(http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal, http://www.adobe.com/2006/flex/mx/internal);
            return;
        }// end function

        public function hasEventListener(value:String) : Boolean
        {
            return eventDispatcher.hasEventListener(value);
        }// end function

    }
}
