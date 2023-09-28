package mx.styles
{
    import StyleManagerImpl.as$709.*;
    import flash.events.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.modules.*;
    import mx.resources.*;

    public class StyleManagerImpl extends Object implements IStyleManager2
    {
        private var _stylesRoot:Object;
        private var _selectors:Object;
        private var styleModules:Object;
        private var _inheritingStyles:Object;
        private var resourceManager:IResourceManager;
        private var _typeSelectorCache:Object;
        private static var parentSizeInvalidatingStyles:Object = {bottom:true, horizontalCenter:true, left:true, right:true, top:true, verticalCenter:true, baseline:true};
        private static var colorNames:Object = {transparent:"transparent", black:0, blue:255, green:32768, gray:8421504, silver:12632256, lime:65280, olive:8421376, white:16777215, yellow:16776960, maroon:8388608, navy:128, red:16711680, purple:8388736, teal:32896, fuchsia:16711935, aqua:65535, magenta:16711935, cyan:65535, halogreen:8453965, haloblue:40447, haloorange:16758272, halosilver:11455193};
        private static var inheritingTextFormatStyles:Object = {align:true, bold:true, color:true, font:true, indent:true, italic:true, size:true};
        private static var instance:IStyleManager2;
        private static var parentDisplayListInvalidatingStyles:Object = {bottom:true, horizontalCenter:true, left:true, right:true, top:true, verticalCenter:true, baseline:true};
        static const VERSION:String = "3.2.0.3958";
        private static var sizeInvalidatingStyles:Object = {borderStyle:true, borderThickness:true, fontAntiAliasType:true, fontFamily:true, fontGridFitType:true, fontSharpness:true, fontSize:true, fontStyle:true, fontThickness:true, fontWeight:true, headerHeight:true, horizontalAlign:true, horizontalGap:true, kerning:true, leading:true, letterSpacing:true, paddingBottom:true, paddingLeft:true, paddingRight:true, paddingTop:true, strokeWidth:true, tabHeight:true, tabWidth:true, verticalAlign:true, verticalGap:true};

        public function StyleManagerImpl()
        {
            _selectors = {};
            styleModules = {};
            resourceManager = ResourceManager.getInstance();
            _inheritingStyles = {};
            _typeSelectorCache = {};
            return;
        }// end function

        public function setStyleDeclaration(IModuleInfo:String, IModuleInfo:CSSStyleDeclaration, IModuleInfo:Boolean) : void
        {
            var _loc_4:* = IModuleInfo;
            var _loc_5:* = IModuleInfo.selectorRefCount + 1;
            _loc_4.selectorRefCount = _loc_5;
            _selectors[IModuleInfo] = IModuleInfo;
            typeSelectorCache = {};
            if (IModuleInfo)
            {
                styleDeclarationsChanged();
            }
            return;
        }// end function

        public function registerParentDisplayListInvalidatingStyle(IModuleInfo:String) : void
        {
            parentDisplayListInvalidatingStyles[IModuleInfo] = true;
            return;
        }// end function

        public function getStyleDeclaration(StyleModuleInfo:String) : CSSStyleDeclaration
        {
            var _loc_2:int = 0;
            if (StyleModuleInfo.charAt(0) != ".")
            {
                _loc_2 = StyleModuleInfo.lastIndexOf(".");
                if (_loc_2 != -1)
                {
                    StyleModuleInfo = StyleModuleInfo.substr((_loc_2 + 1));
                }
            }
            return _selectors[StyleModuleInfo];
        }// end function

        public function set typeSelectorCache(IModuleInfo:Object) : void
        {
            _typeSelectorCache = IModuleInfo;
            return;
        }// end function

        public function isColorName(3.2.0.3958:String) : Boolean
        {
            return colorNames[3.2.0.3958.toLowerCase()] !== undefined;
        }// end function

        public function set inheritingStyles(IModuleInfo:Object) : void
        {
            _inheritingStyles = IModuleInfo;
            return;
        }// end function

        public function getColorNames(IModuleInfo:Array) : void
        {
            var _loc_4:uint = 0;
            if (!IModuleInfo)
            {
                return;
            }
            var _loc_2:* = IModuleInfo.length;
            var _loc_3:int = 0;
            while (_loc_3 < _loc_2)
            {
                
                if (IModuleInfo[_loc_3] != null && isNaN(IModuleInfo[_loc_3]))
                {
                    _loc_4 = getColorName(IModuleInfo[_loc_3]);
                    if (_loc_4 != StyleManager.NOT_A_COLOR)
                    {
                        IModuleInfo[_loc_3] = _loc_4;
                    }
                }
                _loc_3++;
            }
            return;
        }// end function

        public function isInheritingTextFormatStyle(3.2.0.3958:String) : Boolean
        {
            return inheritingTextFormatStyles[3.2.0.3958] == true;
        }// end function

        public function registerParentSizeInvalidatingStyle(IModuleInfo:String) : void
        {
            parentSizeInvalidatingStyles[IModuleInfo] = true;
            return;
        }// end function

        public function registerColorName(IModuleInfo:String, IModuleInfo:uint) : void
        {
            colorNames[IModuleInfo.toLowerCase()] = IModuleInfo;
            return;
        }// end function

        public function isParentSizeInvalidatingStyle(3.2.0.3958:String) : Boolean
        {
            return parentSizeInvalidatingStyles[3.2.0.3958] == true;
        }// end function

        public function registerInheritingStyle(IModuleInfo:String) : void
        {
            inheritingStyles[IModuleInfo] = true;
            return;
        }// end function

        public function set stylesRoot(IModuleInfo:Object) : void
        {
            _stylesRoot = IModuleInfo;
            return;
        }// end function

        public function get typeSelectorCache() : Object
        {
            return _typeSelectorCache;
        }// end function

        public function isParentDisplayListInvalidatingStyle(3.2.0.3958:String) : Boolean
        {
            return parentDisplayListInvalidatingStyles[3.2.0.3958] == true;
        }// end function

        public function isSizeInvalidatingStyle(3.2.0.3958:String) : Boolean
        {
            return sizeInvalidatingStyles[3.2.0.3958] == true;
        }// end function

        public function styleDeclarationsChanged() : void
        {
            var _loc_4:Object = null;
            var _loc_1:* = SystemManagerGlobals.topLevelSystemManagers;
            var _loc_2:* = _loc_1.length;
            var _loc_3:int = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = _loc_1[_loc_3];
                _loc_4.regenerateStyleCache(true);
                _loc_4.notifyStyleChangeInChildren(null, true);
                _loc_3++;
            }
            return;
        }// end function

        public function isValidStyleValue(3.2.0.3958) : Boolean
        {
            return 3.2.0.3958 !== undefined;
        }// end function

        public function loadStyleDeclarations(headerHeight:String, headerHeight:Boolean = true, headerHeight:Boolean = false) : IEventDispatcher
        {
            return loadStyleDeclarations2(headerHeight, headerHeight);
        }// end function

        public function get inheritingStyles() : Object
        {
            return _inheritingStyles;
        }// end function

        public function unloadStyleDeclarations(IModuleInfo:String, IModuleInfo:Boolean = true) : void
        {
            var _loc_4:IModuleInfo = null;
            var _loc_3:* = styleModules[IModuleInfo];
            if (_loc_3)
            {
                _loc_3.styleModule.unload();
                _loc_4 = _loc_3.module;
                _loc_4.unload();
                _loc_4.removeEventListener(ModuleEvent.READY, _loc_3.readyHandler);
                _loc_4.removeEventListener(ModuleEvent.ERROR, _loc_3.errorHandler);
                styleModules[IModuleInfo] = null;
            }
            if (IModuleInfo)
            {
                styleDeclarationsChanged();
            }
            return;
        }// end function

        public function getColorName(sizeInvalidatingStyles:Object) : uint
        {
            var _loc_2:Number = NaN;
            var _loc_3:* = undefined;
            if (sizeInvalidatingStyles is String)
            {
                if (sizeInvalidatingStyles.charAt(0) == "#")
                {
                    _loc_2 = Number("0x" + sizeInvalidatingStyles.slice(1));
                    return isNaN(_loc_2) ? (StyleManager.NOT_A_COLOR) : (uint(_loc_2));
                }
                if (sizeInvalidatingStyles.charAt(1) == "x" && sizeInvalidatingStyles.charAt(0) == "0")
                {
                    _loc_2 = Number(sizeInvalidatingStyles);
                    return isNaN(_loc_2) ? (StyleManager.NOT_A_COLOR) : (uint(_loc_2));
                }
                _loc_3 = colorNames[sizeInvalidatingStyles.toLowerCase()];
                if (_loc_3 === undefined)
                {
                    return StyleManager.NOT_A_COLOR;
                }
                return uint(_loc_3);
            }
            return uint(sizeInvalidatingStyles);
        }// end function

        public function isInheritingStyle(3.2.0.3958:String) : Boolean
        {
            return inheritingStyles[3.2.0.3958] == true;
        }// end function

        public function get stylesRoot() : Object
        {
            return _stylesRoot;
        }// end function

        public function initProtoChainRoots() : void
        {
            if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
            {
                delete _inheritingStyles["textDecoration"];
                delete _inheritingStyles["leading"];
            }
            if (!stylesRoot)
            {
                stylesRoot = _selectors["global"].addStyleToProtoChain({}, null);
            }
            return;
        }// end function

        public function loadStyleDeclarations2(headerHeight:String, headerHeight:Boolean = true, headerHeight:ApplicationDomain = null, headerHeight:SecurityDomain = null) : IEventDispatcher
        {
            var module:IModuleInfo;
            var styleEventDispatcher:StyleEventDispatcher;
            var timer:Timer;
            var timerHandler:Function;
            var url:* = headerHeight;
            var update:* = headerHeight;
            var applicationDomain:* = headerHeight;
            var securityDomain:* = headerHeight;
            module = ModuleManager.getModule(url);
            var readyHandler:* = function (event:ModuleEvent) : void
            {
                var _loc_2:* = IStyleModule(event.module.factory.create());
                styleModules[event.module.url].styleModule = _loc_2;
                if (update)
                {
                    styleDeclarationsChanged();
                }
                return;
            }// end function
            ;
            module.addEventListener(ModuleEvent.READY, readyHandler, false, 0, true);
            styleEventDispatcher = new StyleEventDispatcher(module);
            var errorHandler:* = function (event:ModuleEvent) : void
            {
                var _loc_3:StyleEvent = null;
                var _loc_2:* = resourceManager.getString("styles", "unableToLoad", [event.errorText, url]);
                if (styleEventDispatcher.willTrigger(StyleEvent.ERROR))
                {
                    _loc_3 = new StyleEvent(StyleEvent.ERROR, event.bubbles, event.cancelable);
                    _loc_3.bytesLoaded = 0;
                    _loc_3.bytesTotal = 0;
                    _loc_3.errorText = _loc_2;
                    styleEventDispatcher.dispatchEvent(_loc_3);
                }
                else
                {
                    throw new Error(_loc_2);
                }
                return;
            }// end function
            ;
            module.addEventListener(ModuleEvent.ERROR, errorHandler, false, 0, true);
            styleModules[url] = new StyleModuleInfo(module, readyHandler, errorHandler);
            timer = new Timer(0);
            timerHandler = function (event:TimerEvent) : void
            {
                timer.removeEventListener(TimerEvent.TIMER, timerHandler);
                timer.stop();
                module.load(applicationDomain, securityDomain);
                return;
            }// end function
            ;
            timer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
            timer.start();
            return styleEventDispatcher;
        }// end function

        public function registerSizeInvalidatingStyle(IModuleInfo:String) : void
        {
            sizeInvalidatingStyles[IModuleInfo] = true;
            return;
        }// end function

        public function clearStyleDeclaration(IModuleInfo:String, IModuleInfo:Boolean) : void
        {
            var _loc_3:* = getStyleDeclaration(IModuleInfo);
            if (_loc_3 && _loc_3.selectorRefCount > 0)
            {
                var _loc_4:* = _loc_3;
                var _loc_5:* = _loc_3.selectorRefCount - 1;
                _loc_4.selectorRefCount = _loc_5;
            }
            delete _selectors[IModuleInfo];
            if (IModuleInfo)
            {
                styleDeclarationsChanged();
            }
            return;
        }// end function

        public function get selectors() : Array
        {
            var _loc_2:String = null;
            var _loc_1:Array = [];
            for (_loc_2 in _selectors)
            {
                
                _loc_1.push(_loc_2);
            }
            return _loc_1;
        }// end function

        public static function getInstance() : IStyleManager2
        {
            if (!instance)
            {
                instance = new StyleManagerImpl;
            }
            return instance;
        }// end function

    }
}
