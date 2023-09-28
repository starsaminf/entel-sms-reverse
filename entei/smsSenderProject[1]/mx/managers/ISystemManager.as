package mx.managers
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import mx.core.*;

    public interface ISystemManager extends IEventDispatcher, IChildList, IFlexModuleFactory
    {

        public function ISystemManager();

        function set focusPane(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:Sprite) : void;

        function get toolTipChildren() : IChildList;

        function useSWFBridge() : Boolean;

        function isFontFaceEmbedded(flash.display:TextFormat) : Boolean;

        function deployMouseShields(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:Boolean) : void;

        function get rawChildren() : IChildList;

        function get topLevelSystemManager() : ISystemManager;

        function dispatchEventFromSWFBridges(event:Event, mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:IEventDispatcher = null, mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:Boolean = false, mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:Boolean = false) : void;

        function getSandboxRoot() : DisplayObject;

        function get swfBridgeGroup() : ISWFBridgeGroup;

        function removeFocusManager(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:IFocusManagerContainer) : void;

        function addChildToSandboxRoot(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:String, mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:DisplayObject) : void;

        function get document() : Object;

        function get focusPane() : Sprite;

        function get loaderInfo() : LoaderInfo;

        function addChildBridge(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:IEventDispatcher, mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:DisplayObject) : void;

        function getTopLevelRoot() : DisplayObject;

        function removeChildBridge(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:IEventDispatcher) : void;

        function isDisplayObjectInABridgedApplication(flash.display:DisplayObject) : Boolean;

        function get popUpChildren() : IChildList;

        function get screen() : Rectangle;

        function removeChildFromSandboxRoot(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:String, mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:DisplayObject) : void;

        function getDefinitionByName(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;ISystemManager.as:String) : Object;

        function activate(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:IFocusManagerContainer) : void;

        function deactivate(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:IFocusManagerContainer) : void;

        function get cursorChildren() : IChildList;

        function set document(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:Object) : void;

        function get embeddedFontList() : Object;

        function set numModalWindows(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:int) : void;

        function isTopLevel() : Boolean;

        function isTopLevelRoot() : Boolean;

        function get numModalWindows() : int;

        function addFocusManager(mx.managers:ISystemManager/mx.managers:ISystemManager:cursorChildren/get:IFocusManagerContainer) : void;

        function get stage() : Stage;

        function getVisibleApplicationRect(value:Rectangle = null) : Rectangle;

    }
}
