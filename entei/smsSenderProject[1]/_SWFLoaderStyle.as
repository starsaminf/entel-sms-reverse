package 
{
    import _SWFLoaderStyle.*;
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _SWFLoaderStyle extends Object
    {
        private static var _embed_css_Assets_swf___brokenImage_1849258724:Class = _SWFLoaderStyle__embed_css_Assets_swf___brokenImage_1849258724;

        public function _SWFLoaderStyle()
        {
            return;
        }// end function

        public static function init(_SWFLoaderStyle.as$31:IFlexModuleFactory) : void
        {
            var fbs:* = _SWFLoaderStyle.as$31;
            var style:* = StyleManager.getStyleDeclaration("SWFLoader");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("SWFLoader", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderStyle = "none";
                this.brokenImageSkin = _embed_css_Assets_swf___brokenImage_1849258724;
                this.brokenImageBorderSkin = BrokenImageBorderSkin;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
