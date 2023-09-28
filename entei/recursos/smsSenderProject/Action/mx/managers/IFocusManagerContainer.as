package mx.managers
{
    import flash.display.*;

    public interface IFocusManagerContainer extends IEventDispatcher
    {

        public function IFocusManagerContainer();

        function set focusManager(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;IFocusManagerContainer.as:IFocusManager) : void;

        function get focusManager() : IFocusManager;

        function get systemManager() : ISystemManager;

        function contains(mx.managers:DisplayObject) : Boolean;

    }
}
