package mx.managers
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import mx.core.*;
    import mx.events.*;
    import mx.utils.*;

    public class SystemManagerProxy extends SystemManager
    {
        private var _systemManager:ISystemManager;
        static const VERSION:String = "3.2.0.3958";

        public function SystemManagerProxy(param1:ISystemManager)
        {
            _systemManager = param1;
            topLevel = true;
            super.addEventListener(MouseEvent.MOUSE_DOWN, proxyMouseDownHandler, true);
            return;
        }// end function

        override public function create(... args) : Object
        {
            return IFlexModuleFactory(_systemManager).create.apply(this, args);
        }// end function

        public function get systemManager() : ISystemManager
        {
            return _systemManager;
        }// end function

        override public function activate(proxyMouseDownHandler:IFocusManagerContainer) : void
        {
            var _loc_3:Boolean = false;
            var _loc_4:SWFBridgeEvent = null;
            var _loc_2:* = _systemManager.swfBridgeGroup ? (_systemManager.swfBridgeGroup.parentBridge) : (null);
            if (_loc_2)
            {
                _loc_3 = SecurityUtil.hasMutualTrustBetweenParentAndChild(ISWFBridgeProvider(_systemManager));
                _loc_4 = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_WINDOW_ACTIVATE, false, false, {notifier:_loc_2, window:_loc_3 ? (this) : (NameUtil.displayObjectToString(this))});
                _systemManager.getSandboxRoot().dispatchEvent(_loc_4);
            }
            return;
        }// end function

        override public function addEventListener(proxyMouseDownHandler:String, proxyMouseDownHandler:Function, proxyMouseDownHandler:Boolean = false, proxyMouseDownHandler:int = 0, proxyMouseDownHandler:Boolean = false) : void
        {
            super.addEventListener(proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler);
            _systemManager.addEventListener(proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler);
            return;
        }// end function

        public function deactivateByProxy(proxyMouseDownHandler:IFocusManagerContainer) : void
        {
            if (proxyMouseDownHandler)
            {
                proxyMouseDownHandler.focusManager.deactivate();
            }
            return;
        }// end function

        override public function removeEventListener(proxyMouseDownHandler:String, proxyMouseDownHandler:Function, proxyMouseDownHandler:Boolean = false) : void
        {
            super.removeEventListener(proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler);
            _systemManager.removeEventListener(proxyMouseDownHandler, proxyMouseDownHandler, proxyMouseDownHandler);
            return;
        }// end function

        override public function get document() : Object
        {
            return findFocusManagerContainer(this);
        }// end function

        public function activateByProxy(proxyMouseDownHandler:IFocusManagerContainer) : void
        {
            super.activate(proxyMouseDownHandler);
            return;
        }// end function

        override public function removeChildBridge(proxyMouseDownHandler:IEventDispatcher) : void
        {
            _systemManager.removeChildBridge(proxyMouseDownHandler);
            return;
        }// end function

        override public function get swfBridgeGroup() : ISWFBridgeGroup
        {
            return _systemManager.swfBridgeGroup;
        }// end function

        override public function addChildBridge(proxyMouseDownHandler:IEventDispatcher, proxyMouseDownHandler:DisplayObject) : void
        {
            _systemManager.addChildBridge(proxyMouseDownHandler, proxyMouseDownHandler);
            return;
        }// end function

        override public function useSWFBridge() : Boolean
        {
            return _systemManager.useSWFBridge();
        }// end function

        override public function get screen() : Rectangle
        {
            return _systemManager.screen;
        }// end function

        override public function set swfBridgeGroup(proxyMouseDownHandler:ISWFBridgeGroup) : void
        {
            return;
        }// end function

        private function proxyMouseDownHandler(event:MouseEvent) : void
        {
            if (findFocusManagerContainer(this))
            {
                SystemManager(_systemManager).dispatchActivatedWindowEvent(this);
            }
            return;
        }// end function

        override public function deactivate(proxyMouseDownHandler:IFocusManagerContainer) : void
        {
            var _loc_4:Boolean = false;
            var _loc_5:SWFBridgeEvent = null;
            var _loc_2:* = _systemManager;
            var _loc_3:* = _loc_2.swfBridgeGroup ? (_loc_2.swfBridgeGroup.parentBridge) : (null);
            if (_loc_3)
            {
                _loc_4 = SecurityUtil.hasMutualTrustBetweenParentAndChild(ISWFBridgeProvider(_systemManager));
                _loc_5 = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_WINDOW_DEACTIVATE, false, false, {notifier:_loc_3, window:_loc_4 ? (this) : (NameUtil.displayObjectToString(this))});
                _systemManager.getSandboxRoot().dispatchEvent(_loc_5);
            }
            return;
        }// end function

        override public function set document(proxyMouseDownHandler:Object) : void
        {
            return;
        }// end function

        override public function getVisibleApplicationRect(MouseEvent:Rectangle = null) : Rectangle
        {
            return _systemManager.getVisibleApplicationRect(MouseEvent);
        }// end function

        override public function getDefinitionByName(MOUSE_DOWN:String) : Object
        {
            return _systemManager.getDefinitionByName(MOUSE_DOWN);
        }// end function

    }
}
