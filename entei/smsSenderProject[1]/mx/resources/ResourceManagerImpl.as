package mx.resources
{
    import ResourceManagerImpl.as$91.*;
    import flash.events.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;
    import mx.modules.*;
    import mx.utils.*;

    public class ResourceManagerImpl extends EventDispatcher implements IResourceManager
    {
        private var resourceModules:Object;
        private var initializedForNonFrameworkApp:Boolean = false;
        private var localeMap:Object;
        private var _localeChain:Array;
        static const VERSION:String = "3.2.0.3958";
        private static var instance:IResourceManager;

        public function ResourceManagerImpl()
        {
            localeMap = {};
            resourceModules = {};
            return;
        }// end function

        public function get localeChain() : Array
        {
            return _localeChain;
        }// end function

        public function set localeChain(ResourceManagerImpl.as$91:ResourceEventDispatcher:Array) : void
        {
            _localeChain = ResourceManagerImpl.as$91:ResourceEventDispatcher;
            update();
            return;
        }// end function

        public function getStringArray(moduleInfo_readyHandler:String, moduleInfo_readyHandler:String, moduleInfo_readyHandler:String = null) : Array
        {
            var _loc_4:* = findBundle(moduleInfo_readyHandler, moduleInfo_readyHandler, moduleInfo_readyHandler);
            if (!_loc_4)
            {
                return null;
            }
            var _loc_5:* = _loc_4.content[moduleInfo_readyHandler];
            var _loc_6:* = String(_loc_5).split(",");
            var _loc_7:* = _loc_6.length;
            var _loc_8:int = 0;
            while (_loc_8 < _loc_7)
            {
                
                _loc_6[_loc_8] = StringUtil.trim(_loc_6[_loc_8]);
                _loc_8++;
            }
            return _loc_6;
        }// end function

        function installCompiledResourceBundle(ResourceManagerImpl.as$91:ResourceEventDispatcher:ApplicationDomain, ResourceManagerImpl.as$91:ResourceEventDispatcher:String, ResourceManagerImpl.as$91:ResourceEventDispatcher:String) : void
        {
            var _loc_4:String = null;
            var _loc_5:* = ResourceManagerImpl.as$91:ResourceEventDispatcher;
            var _loc_6:* = ResourceManagerImpl.as$91:ResourceEventDispatcher.indexOf(":");
            if (_loc_6 != -1)
            {
                _loc_4 = ResourceManagerImpl.as$91:ResourceEventDispatcher.substring(0, _loc_6);
                _loc_5 = ResourceManagerImpl.as$91:ResourceEventDispatcher.substring((_loc_6 + 1));
            }
            if (getResourceBundle(ResourceManagerImpl.as$91:ResourceEventDispatcher, ResourceManagerImpl.as$91:ResourceEventDispatcher))
            {
                return;
            }
            var _loc_7:* = ResourceManagerImpl.as$91:ResourceEventDispatcher + "$" + _loc_5 + "_properties";
            if (_loc_4 != null)
            {
                _loc_7 = _loc_4 + "." + _loc_7;
            }
            var _loc_8:Class = null;
            if (ResourceManagerImpl.as$91:ResourceEventDispatcher.hasDefinition(_loc_7))
            {
                _loc_8 = Class(ResourceManagerImpl.as$91:ResourceEventDispatcher.getDefinition(_loc_7));
            }
            if (!_loc_8)
            {
                _loc_7 = ResourceManagerImpl.as$91:ResourceEventDispatcher;
                if (ResourceManagerImpl.as$91:ResourceEventDispatcher.hasDefinition(_loc_7))
                {
                    _loc_8 = Class(ResourceManagerImpl.as$91:ResourceEventDispatcher.getDefinition(_loc_7));
                }
            }
            if (!_loc_8)
            {
                _loc_7 = ResourceManagerImpl.as$91:ResourceEventDispatcher + "_properties";
                if (ResourceManagerImpl.as$91:ResourceEventDispatcher.hasDefinition(_loc_7))
                {
                    _loc_8 = Class(ResourceManagerImpl.as$91:ResourceEventDispatcher.getDefinition(_loc_7));
                }
            }
            if (!_loc_8)
            {
                throw new Error("Could not find compiled resource bundle \'" + ResourceManagerImpl.as$91:ResourceEventDispatcher + "\' for locale \'" + ResourceManagerImpl.as$91:ResourceEventDispatcher + "\'.");
            }
            var _loc_9:* = ResourceBundle(new _loc_8);
            mx_internal::_locale = ResourceManagerImpl.as$91:ResourceEventDispatcher;
            mx_internal::_bundleName = ResourceManagerImpl.as$91:ResourceEventDispatcher;
            addResourceBundle(_loc_9);
            return;
        }// end function

        public function getString(ResourceEventDispatcher:String, ResourceEventDispatcher:String, ResourceEventDispatcher:Array = null, ResourceEventDispatcher:String = null) : String
        {
            var _loc_5:* = findBundle(ResourceEventDispatcher, ResourceEventDispatcher, ResourceEventDispatcher);
            if (!_loc_5)
            {
                return null;
            }
            var _loc_6:* = String(_loc_5.content[ResourceEventDispatcher]);
            if (ResourceEventDispatcher)
            {
                _loc_6 = StringUtil.substitute(_loc_6, ResourceEventDispatcher);
            }
            return _loc_6;
        }// end function

        public function loadResourceModule(Namespace:String, Namespace:Boolean = true, Namespace:ApplicationDomain = null, Namespace:SecurityDomain = null) : IEventDispatcher
        {
            var moduleInfo:IModuleInfo;
            var resourceEventDispatcher:ResourceEventDispatcher;
            var timer:Timer;
            var timerHandler:Function;
            var url:* = Namespace;
            var updateFlag:* = Namespace;
            var applicationDomain:* = Namespace;
            var securityDomain:* = Namespace;
            moduleInfo = ModuleManager.getModule(url);
            resourceEventDispatcher = new ResourceEventDispatcher(moduleInfo);
            var readyHandler:* = function (event:ModuleEvent) : void
            {
                var _loc_2:* = event.module.factory.create();
                resourceModules[event.module.url].resourceModule = _loc_2;
                if (updateFlag)
                {
                    update();
                }
                return;
            }// end function
            ;
            moduleInfo.addEventListener(ModuleEvent.READY, readyHandler, false, 0, true);
            var errorHandler:* = function (event:ModuleEvent) : void
            {
                var _loc_3:ResourceEvent = null;
                var _loc_2:* = "Unable to load resource module from " + url;
                if (resourceEventDispatcher.willTrigger(ResourceEvent.ERROR))
                {
                    _loc_3 = new ResourceEvent(ResourceEvent.ERROR, event.bubbles, event.cancelable);
                    _loc_3.bytesLoaded = 0;
                    _loc_3.bytesTotal = 0;
                    _loc_3.errorText = _loc_2;
                    resourceEventDispatcher.dispatchEvent(_loc_3);
                }
                else
                {
                    throw new Error(_loc_2);
                }
                return;
            }// end function
            ;
            moduleInfo.addEventListener(ModuleEvent.ERROR, errorHandler, false, 0, true);
            resourceModules[url] = new ResourceModuleInfo(moduleInfo, readyHandler, errorHandler);
            timer = new Timer(0);
            timerHandler = function (event:TimerEvent) : void
            {
                timer.removeEventListener(TimerEvent.TIMER, timerHandler);
                timer.stop();
                moduleInfo.load(applicationDomain, securityDomain);
                return;
            }// end function
            ;
            timer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
            timer.start();
            return resourceEventDispatcher;
        }// end function

        public function getLocales() : Array
        {
            var _loc_2:String = null;
            var _loc_1:Array = [];
            for (_loc_2 in localeMap)
            {
                
                _loc_1.push(_loc_2);
            }
            return _loc_1;
        }// end function

        public function removeResourceBundlesForLocale(ResourceManagerImpl.as$91:ResourceEventDispatcher:String) : void
        {
            delete localeMap[ResourceManagerImpl.as$91:ResourceEventDispatcher];
            return;
        }// end function

        public function getResourceBundle(flash.system:String, flash.system:String) : IResourceBundle
        {
            var _loc_3:* = localeMap[flash.system];
            if (!_loc_3)
            {
                return null;
            }
            return _loc_3[flash.system];
        }// end function

        private function dumpResourceModule(ResourceManagerImpl.as$91:ResourceEventDispatcher) : void
        {
            var _loc_2:ResourceBundle = null;
            var _loc_3:String = null;
            for each (_loc_2 in ResourceManagerImpl.as$91:ResourceEventDispatcher.resourceBundles)
            {
                
                trace(_loc_2.locale, _loc_2.bundleName);
                for (_loc_3 in _loc_2.content)
                {
                    
                }
            }
            return;
        }// end function

        public function addResourceBundle(ResourceManagerImpl.as$91:ResourceEventDispatcher:IResourceBundle) : void
        {
            var _loc_2:* = ResourceManagerImpl.as$91:ResourceEventDispatcher.locale;
            var _loc_3:* = ResourceManagerImpl.as$91:ResourceEventDispatcher.bundleName;
            if (!localeMap[_loc_2])
            {
                localeMap[_loc_2] = {};
            }
            localeMap[_loc_2][_loc_3] = ResourceManagerImpl.as$91:ResourceEventDispatcher;
            return;
        }// end function

        public function getObject(param1:String, param2:String, param3:String = null)
        {
            var _loc_4:* = findBundle(param1, param2, param3);
            if (!_loc_4)
            {
                return undefined;
            }
            return _loc_4.content[param2];
        }// end function

        public function getInt(hasDefinition:String, hasDefinition:String, hasDefinition:String = null) : int
        {
            var _loc_4:* = findBundle(hasDefinition, hasDefinition, hasDefinition);
            if (!_loc_4)
            {
                return 0;
            }
            var _loc_5:* = _loc_4.content[hasDefinition];
            return int(_loc_5);
        }// end function

        private function findBundle(flash.system:String, flash.system:String, flash.system:String) : IResourceBundle
        {
            supportNonFrameworkApps();
            return flash.system != null ? (getResourceBundle(flash.system, flash.system)) : (findResourceBundleWithResource(flash.system, flash.system));
        }// end function

        private function supportNonFrameworkApps() : void
        {
            if (initializedForNonFrameworkApp)
            {
                return;
            }
            initializedForNonFrameworkApp = true;
            if (getLocales().length > 0)
            {
                return;
            }
            var _loc_1:* = ApplicationDomain.currentDomain;
            if (!_loc_1.hasDefinition("_CompiledResourceBundleInfo"))
            {
                return;
            }
            var _loc_2:* = Class(_loc_1.getDefinition("_CompiledResourceBundleInfo"));
            var _loc_3:* = _loc_2.compiledLocales;
            var _loc_4:* = _loc_2.compiledResourceBundleNames;
            installCompiledResourceBundles(_loc_1, _loc_3, _loc_4);
            localeChain = _loc_3;
            return;
        }// end function

        public function getBundleNamesForLocale(moduleInfo_readyHandler:String) : Array
        {
            var _loc_3:String = null;
            var _loc_2:Array = [];
            for (_loc_3 in localeMap[moduleInfo_readyHandler])
            {
                
                _loc_2.push(_loc_3);
            }
            return _loc_2;
        }// end function

        public function getPreferredLocaleChain() : Array
        {
            return LocaleSorter.sortLocalesByPreference(getLocales(), getSystemPreferredLocales(), null, true);
        }// end function

        public function getNumber(Class:String, Class:String, Class:String = null) : Number
        {
            var _loc_4:* = findBundle(Class, Class, Class);
            if (!_loc_4)
            {
                return NaN;
            }
            var _loc_5:* = _loc_4.content[Class];
            return Number(_loc_5);
        }// end function

        public function update() : void
        {
            dispatchEvent(new Event(Event.CHANGE));
            return;
        }// end function

        public function getClass(ResourceManagerImpl.as$91:ResourceEventDispatcher/private:moduleInfo_errorHandler:String, ResourceManagerImpl.as$91:ResourceEventDispatcher/private:moduleInfo_errorHandler:String, ResourceManagerImpl.as$91:ResourceEventDispatcher/private:moduleInfo_errorHandler:String = null) : Class
        {
            var _loc_4:* = findBundle(ResourceManagerImpl.as$91:ResourceEventDispatcher/private:moduleInfo_errorHandler, ResourceManagerImpl.as$91:ResourceEventDispatcher/private:moduleInfo_errorHandler, ResourceManagerImpl.as$91:ResourceEventDispatcher/private:moduleInfo_errorHandler);
            if (!_loc_4)
            {
                return null;
            }
            var _loc_5:* = _loc_4.content[ResourceManagerImpl.as$91:ResourceEventDispatcher/private:moduleInfo_errorHandler];
            return _loc_5 as Class;
        }// end function

        public function removeResourceBundle(ResourceManagerImpl.as$91:ResourceEventDispatcher:String, ResourceManagerImpl.as$91:ResourceEventDispatcher:String) : void
        {
            delete localeMap[ResourceManagerImpl.as$91:ResourceEventDispatcher][ResourceManagerImpl.as$91:ResourceEventDispatcher];
            if (getBundleNamesForLocale(ResourceManagerImpl.as$91:ResourceEventDispatcher).length == 0)
            {
                delete localeMap[ResourceManagerImpl.as$91:ResourceEventDispatcher];
            }
            return;
        }// end function

        public function initializeLocaleChain(ResourceManagerImpl.as$91:ResourceEventDispatcher:Array) : void
        {
            localeChain = LocaleSorter.sortLocalesByPreference(ResourceManagerImpl.as$91:ResourceEventDispatcher, getSystemPreferredLocales(), null, true);
            return;
        }// end function

        public function findResourceBundleWithResource(flash.system:String, flash.system:String) : IResourceBundle
        {
            var _loc_5:String = null;
            var _loc_6:Object = null;
            var _loc_7:ResourceBundle = null;
            if (!_localeChain)
            {
                return null;
            }
            var _loc_3:* = _localeChain.length;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = localeChain[_loc_4];
                _loc_6 = localeMap[_loc_5];
                if (!_loc_6)
                {
                }
                else
                {
                    _loc_7 = _loc_6[flash.system];
                    if (!_loc_7)
                    {
                    }
                    else if (flash.system in _loc_7.content)
                    {
                        return _loc_7;
                    }
                }
                _loc_4++;
            }
            return null;
        }// end function

        public function getUint(getDefinition:String, getDefinition:String, getDefinition:String = null) : uint
        {
            var _loc_4:* = findBundle(getDefinition, getDefinition, getDefinition);
            if (!_loc_4)
            {
                return 0;
            }
            var _loc_5:* = _loc_4.content[getDefinition];
            return uint(_loc_5);
        }// end function

        private function getSystemPreferredLocales() : Array
        {
            var _loc_1:Array = null;
            if (Capabilities["languages"])
            {
                _loc_1 = Capabilities["languages"];
            }
            else
            {
                _loc_1 = [Capabilities.language];
            }
            return _loc_1;
        }// end function

        public function installCompiledResourceBundles(ResourceManagerImpl.as$91:ResourceEventDispatcher:ApplicationDomain, ResourceManagerImpl.as$91:ResourceEventDispatcher:Array, ResourceManagerImpl.as$91:ResourceEventDispatcher:Array) : void
        {
            var _loc_7:String = null;
            var _loc_8:int = 0;
            var _loc_9:String = null;
            var _loc_4:* = ResourceManagerImpl.as$91:ResourceEventDispatcher ? (ResourceManagerImpl.as$91:ResourceEventDispatcher.length) : (0);
            var _loc_5:* = ResourceManagerImpl.as$91:ResourceEventDispatcher ? (ResourceManagerImpl.as$91:ResourceEventDispatcher.length) : (0);
            var _loc_6:int = 0;
            while (_loc_6 < _loc_4)
            {
                
                _loc_7 = ResourceManagerImpl.as$91:ResourceEventDispatcher[_loc_6];
                _loc_8 = 0;
                while (_loc_8 < _loc_5)
                {
                    
                    _loc_9 = ResourceManagerImpl.as$91:ResourceEventDispatcher[_loc_8];
                    .mx_internal::installCompiledResourceBundle(ResourceManagerImpl.as$91:ResourceEventDispatcher, _loc_7, _loc_9);
                    _loc_8++;
                }
                _loc_6++;
            }
            return;
        }// end function

        public function getBoolean(mx.core:String, mx.core:String, mx.core:String = null) : Boolean
        {
            var _loc_4:* = findBundle(mx.core, mx.core, mx.core);
            if (!_loc_4)
            {
                return false;
            }
            var _loc_5:* = _loc_4.content[mx.core];
            return String(_loc_5).toLowerCase() == "true";
        }// end function

        public function unloadResourceModule(ResourceManagerImpl.as$91:ResourceEventDispatcher:String, ResourceManagerImpl.as$91:ResourceEventDispatcher:Boolean = true) : void
        {
            throw new Error("unloadResourceModule() is not yet implemented.");
        }// end function

        public static function getInstance() : IResourceManager
        {
            if (!instance)
            {
                instance = new ResourceManagerImpl;
            }
            return instance;
        }// end function

    }
}
