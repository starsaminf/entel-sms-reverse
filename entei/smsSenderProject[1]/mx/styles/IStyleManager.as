package mx.styles
{
    import flash.events.*;

    public interface IStyleManager
    {

        public function IStyleManager();

        function isColorName(value:String) : Boolean;

        function registerParentDisplayListInvalidatingStyle(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String) : void;

        function registerInheritingStyle(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String) : void;

        function set stylesRoot(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:Object) : void;

        function get typeSelectorCache() : Object;

        function styleDeclarationsChanged() : void;

        function setStyleDeclaration(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:CSSStyleDeclaration, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:Boolean) : void;

        function isParentDisplayListInvalidatingStyle(value:String) : Boolean;

        function isSizeInvalidatingStyle(value:String) : Boolean;

        function get inheritingStyles() : Object;

        function isValidStyleValue(value) : Boolean;

        function isParentSizeInvalidatingStyle(value:String) : Boolean;

        function getColorName(mx.styles:IStyleManager/mx.styles:IStyleManager:inheritingStyles/set:Object) : uint;

        function set typeSelectorCache(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:Object) : void;

        function unloadStyleDeclarations(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:Boolean = true) : void;

        function getColorNames(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:Array) : void;

        function loadStyleDeclarations(mx.styles:IStyleManager/mx.styles:IStyleManager:stylesRoot/get:String, mx.styles:IStyleManager/mx.styles:IStyleManager:stylesRoot/get:Boolean = true, mx.styles:IStyleManager/mx.styles:IStyleManager:stylesRoot/get:Boolean = false) : IEventDispatcher;

        function isInheritingStyle(value:String) : Boolean;

        function set inheritingStyles(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:Object) : void;

        function get stylesRoot() : Object;

        function initProtoChainRoots() : void;

        function registerColorName(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:uint) : void;

        function registerParentSizeInvalidatingStyle(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String) : void;

        function registerSizeInvalidatingStyle(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String) : void;

        function clearStyleDeclaration(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:String, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\styles;IStyleManager.as:Boolean) : void;

        function isInheritingTextFormatStyle(value:String) : Boolean;

        function getStyleDeclaration(mx.styles:IStyleManager/mx.styles:IStyleManager:inheritingStyles/get:String) : CSSStyleDeclaration;

    }
}
