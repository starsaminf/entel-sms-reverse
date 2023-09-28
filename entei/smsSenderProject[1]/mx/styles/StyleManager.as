package mx.styles
{
    import flash.events.*;
    import flash.system.*;
    import mx.core.*;

    public class StyleManager extends Object
    {
        private static var _impl:IStyleManager2;
        private static var implClassDependency:StyleManagerImpl;
        static const VERSION:String = "3.2.0.3958";
        public static const NOT_A_COLOR:uint = 4.29497e+009;

        public function StyleManager()
        {
            return;
        }// end function

        public static function isParentSizeInvalidatingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get:String) : Boolean
        {
            return impl.isParentSizeInvalidatingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get);
        }// end function

        public static function registerInheritingStyle(IStyleManager2:String) : void
        {
            impl.registerInheritingStyle(IStyleManager2);
            return;
        }// end function

        static function set stylesRoot(IStyleManager2:Object) : void
        {
            impl.stylesRoot = IStyleManager2;
            return;
        }// end function

        static function get inheritingStyles() : Object
        {
            return impl.inheritingStyles;
        }// end function

        static function styleDeclarationsChanged() : void
        {
            impl.styleDeclarationsChanged();
            return;
        }// end function

        public static function setStyleDeclaration(IStyleManager2:String, IStyleManager2:CSSStyleDeclaration, IStyleManager2:Boolean) : void
        {
            impl.setStyleDeclaration(IStyleManager2, IStyleManager2, IStyleManager2);
            return;
        }// end function

        public static function registerParentDisplayListInvalidatingStyle(IStyleManager2:String) : void
        {
            impl.registerParentDisplayListInvalidatingStyle(IStyleManager2);
            return;
        }// end function

        static function get typeSelectorCache() : Object
        {
            return impl.typeSelectorCache;
        }// end function

        static function set inheritingStyles(IStyleManager2:Object) : void
        {
            impl.inheritingStyles = IStyleManager2;
            return;
        }// end function

        public static function isColorName(mx.styles:StyleManager/mx_internal:stylesRoot/get:String) : Boolean
        {
            return impl.isColorName(mx.styles:StyleManager/mx_internal:stylesRoot/get);
        }// end function

        public static function isParentDisplayListInvalidatingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get:String) : Boolean
        {
            return impl.isParentDisplayListInvalidatingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get);
        }// end function

        public static function isSizeInvalidatingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get:String) : Boolean
        {
            return impl.isSizeInvalidatingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get);
        }// end function

        public static function getColorName(selectors:Object) : uint
        {
            return impl.getColorName(selectors);
        }// end function

        static function set typeSelectorCache(IStyleManager2:Object) : void
        {
            impl.typeSelectorCache = IStyleManager2;
            return;
        }// end function

        public static function unloadStyleDeclarations(IStyleManager2:String, IStyleManager2:Boolean = true) : void
        {
            impl.unloadStyleDeclarations(IStyleManager2, IStyleManager2);
            return;
        }// end function

        public static function getColorNames(IStyleManager2:Array) : void
        {
            impl.getColorNames(IStyleManager2);
            return;
        }// end function

        public static function loadStyleDeclarations(mx.styles:StyleManager/getStyleDeclaration:String, mx.styles:StyleManager/getStyleDeclaration:Boolean = true, mx.styles:StyleManager/getStyleDeclaration:Boolean = false, mx.styles:StyleManager/getStyleDeclaration:ApplicationDomain = null, mx.styles:StyleManager/getStyleDeclaration:SecurityDomain = null) : IEventDispatcher
        {
            return impl.loadStyleDeclarations2(mx.styles:StyleManager/getStyleDeclaration, mx.styles:StyleManager/getStyleDeclaration, mx.styles:StyleManager/getStyleDeclaration, mx.styles:StyleManager/getStyleDeclaration);
        }// end function

        private static function get impl() : IStyleManager2
        {
            if (!_impl)
            {
                _impl = IStyleManager2(Singleton.getInstance("mx.styles::IStyleManager2"));
            }
            return _impl;
        }// end function

        public static function isValidStyleValue(mx.styles:StyleManager/mx_internal:stylesRoot/get) : Boolean
        {
            return impl.isValidStyleValue(mx.styles:StyleManager/mx_internal:stylesRoot/get);
        }// end function

        static function get stylesRoot() : Object
        {
            return impl.stylesRoot;
        }// end function

        public static function isInheritingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get:String) : Boolean
        {
            return impl.isInheritingStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get);
        }// end function

        static function initProtoChainRoots() : void
        {
            impl.initProtoChainRoots();
            return;
        }// end function

        public static function registerParentSizeInvalidatingStyle(IStyleManager2:String) : void
        {
            impl.registerParentSizeInvalidatingStyle(IStyleManager2);
            return;
        }// end function

        public static function get selectors() : Array
        {
            return impl.selectors;
        }// end function

        public static function registerSizeInvalidatingStyle(IStyleManager2:String) : void
        {
            impl.registerSizeInvalidatingStyle(IStyleManager2);
            return;
        }// end function

        public static function clearStyleDeclaration(IStyleManager2:String, IStyleManager2:Boolean) : void
        {
            impl.clearStyleDeclaration(IStyleManager2, IStyleManager2);
            return;
        }// end function

        public static function registerColorName(IStyleManager2:String, IStyleManager2:uint) : void
        {
            impl.registerColorName(IStyleManager2, IStyleManager2);
            return;
        }// end function

        public static function isInheritingTextFormatStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get:String) : Boolean
        {
            return impl.isInheritingTextFormatStyle(mx.styles:StyleManager/mx_internal:stylesRoot/get);
        }// end function

        public static function getStyleDeclaration(impl:String) : CSSStyleDeclaration
        {
            return impl.getStyleDeclaration(impl);
        }// end function

    }
}
