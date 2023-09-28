package mx.managers
{
    import flash.display.*;
    import flash.events.*;
    import mx.core.*;

    public interface IFocusManager
    {

        public function IFocusManager();

        function get focusPane() : Sprite;

        function getFocus() : IFocusManagerComponent;

        function deactivate() : void;

        function set defaultButton(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:IButton) : void;

        function set focusPane(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:Sprite) : void;

        function set showFocusIndicator(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:Boolean) : void;

        function moveFocus(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:String, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:DisplayObject = null) : void;

        function addSWFBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:IEventDispatcher, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:DisplayObject) : void;

        function removeSWFBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:IEventDispatcher) : void;

        function get defaultButtonEnabled() : Boolean;

        function findFocusManagerComponent(value:InteractiveObject) : IFocusManagerComponent;

        function get nextTabIndex() : int;

        function get defaultButton() : IButton;

        function get showFocusIndicator() : Boolean;

        function setFocus(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:IFocusManagerComponent) : void;

        function activate() : void;

        function showFocus() : void;

        function set defaultButtonEnabled(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManager.as:Boolean) : void;

        function hideFocus() : void;

        function getNextFocusManagerComponent(value:Boolean = false) : IFocusManagerComponent;

    }
}
