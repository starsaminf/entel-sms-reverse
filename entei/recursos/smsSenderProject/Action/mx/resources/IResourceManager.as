package mx.resources
{
    import flash.events.*;
    import flash.system.*;

    public interface IResourceManager extends IEventDispatcher
    {

        public function IResourceManager();

        function loadResourceModule(mx.resources:IResourceManager/mx.resources:IResourceManager:localeChain/get:String, mx.resources:IResourceManager/mx.resources:IResourceManager:localeChain/get:Boolean = true, mx.resources:IResourceManager/mx.resources:IResourceManager:localeChain/get:ApplicationDomain = null, mx.resources:IResourceManager/mx.resources:IResourceManager:localeChain/get:SecurityDomain = null) : IEventDispatcher;

        function getBoolean(value:String, value:String, value:String = null) : Boolean;

        function getClass(mx.resources:IResourceManager/mx.resources:IResourceManager:loadResourceModule:String, mx.resources:IResourceManager/mx.resources:IResourceManager:loadResourceModule:String, mx.resources:IResourceManager/mx.resources:IResourceManager:loadResourceModule:String = null) : Class;

        function getLocales() : Array;

        function removeResourceBundlesForLocale(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:String) : void;

        function getResourceBundle(url:String, url:String) : IResourceBundle;

        function get localeChain() : Array;

        function getInt(applicationDomain:String, applicationDomain:String, applicationDomain:String = null) : int;

        function update() : void;

        function set localeChain(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:Array) : void;

        function getUint(securityDomain:String, securityDomain:String, securityDomain:String = null) : uint;

        function addResourceBundle(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:IResourceBundle) : void;

        function getStringArray(param1:String, param2:String, param3:String = null) : Array;

        function getBundleNamesForLocale(param1:String) : Array;

        function removeResourceBundle(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:String, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:String) : void;

        function getObject(param1:String, param2:String, param3:String = null);

        function getString(Array:String, Array:String, Array:Array = null, Array:String = null) : String;

        function installCompiledResourceBundles(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:ApplicationDomain, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:Array, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:Array) : void;

        function unloadResourceModule(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:String, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:Boolean = true) : void;

        function getPreferredLocaleChain() : Array;

        function findResourceBundleWithResource(url:String, url:String) : IResourceBundle;

        function initializeLocaleChain(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;IResourceManager.as:Array) : void;

        function getNumber(update:String, update:String, update:String = null) : Number;

    }
}
