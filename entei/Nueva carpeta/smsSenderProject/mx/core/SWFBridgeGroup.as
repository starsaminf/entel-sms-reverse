package mx.core
{
    import flash.events.*;
    import flash.utils.*;
    import mx.managers.*;

    public class SWFBridgeGroup extends Object implements ISWFBridgeGroup
    {
        private var _parentBridge:IEventDispatcher;
        private var _childBridges:Dictionary;
        private var _groupOwner:ISystemManager;
        static const VERSION:String = "3.2.0.3958";

        public function SWFBridgeGroup(param1:ISystemManager)
        {
            _groupOwner = param1;
            return;
        }// end function

        public function getChildBridgeProvider(mx.managers:IEventDispatcher) : ISWFBridgeProvider
        {
            if (!_childBridges)
            {
                return null;
            }
            return ISWFBridgeProvider(_childBridges[mx.managers]);
        }// end function

        public function removeChildBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as:IEventDispatcher) : void
        {
            var _loc_2:Object = null;
            if (!_childBridges || !C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as)
            {
                return;
            }
            for (_loc_2 in _childBridges)
            {
                
                if (_loc_2 == C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as)
                {
                    delete _childBridges[_loc_2];
                }
            }
            return;
        }// end function

        public function get parentBridge() : IEventDispatcher
        {
            return _parentBridge;
        }// end function

        public function containsBridge(IEventDispatcher:IEventDispatcher) : Boolean
        {
            var _loc_2:Object = null;
            if (parentBridge && parentBridge == IEventDispatcher)
            {
                return true;
            }
            for (_loc_2 in _childBridges)
            {
                
                if (IEventDispatcher == _loc_2)
                {
                    return true;
                }
            }
            return false;
        }// end function

        public function set parentBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as:IEventDispatcher) : void
        {
            _parentBridge = C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as;
            return;
        }// end function

        public function addChildBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as:IEventDispatcher, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as:ISWFBridgeProvider) : void
        {
            if (!_childBridges)
            {
                _childBridges = new Dictionary();
            }
            _childBridges[C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as] = C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;SWFBridgeGroup.as;
            return;
        }// end function

        public function getChildBridges() : Array
        {
            var _loc_2:Object = null;
            var _loc_1:Array = [];
            for (_loc_2 in _childBridges)
            {
                
                _loc_1.push(_loc_2);
            }
            return _loc_1;
        }// end function

    }
}
