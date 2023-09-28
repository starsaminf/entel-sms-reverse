package mx.modules
{
    import flash.system.*;
    import flash.utils.*;
    import mx.core.*;

    public interface IModuleInfo extends IEventDispatcher
    {

        public function IModuleInfo();

        function get ready() : Boolean;

        function get loaded() : Boolean;

        function load(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\modules;IModuleInfo.as:ApplicationDomain = null, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\modules;IModuleInfo.as:SecurityDomain = null, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\modules;IModuleInfo.as:ByteArray = null) : void;

        function release() : void;

        function get error() : Boolean;

        function get data() : Object;

        function publish(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\modules;IModuleInfo.as:IFlexModuleFactory) : void;

        function get factory() : IFlexModuleFactory;

        function set data(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\modules;IModuleInfo.as:Object) : void;

        function get url() : String;

        function get setup() : Boolean;

        function unload() : void;

    }
}
