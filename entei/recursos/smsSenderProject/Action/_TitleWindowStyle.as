package 
{
    import _TitleWindowStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _TitleWindowStyle extends Object
    {
        private static var _embed_css_Assets_swf_CloseButtonUp_1356795101:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonUp_1356795101;
        private static var _embed_css_Assets_swf_CloseButtonDisabled_1578076100:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonDisabled_1578076100;
        private static var _embed_css_Assets_swf_CloseButtonOver_279056452:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonOver_279056452;
        private static var _embed_css_Assets_swf_CloseButtonDown_446372178:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonDown_446372178;

        public function _TitleWindowStyle()
        {
            return;
        }// end function

        public static function init(closeButtonDownSkin:IFlexModuleFactory) : void
        {
            var fbs:* = closeButtonDownSkin;
            var style:* = StyleManager.getStyleDeclaration("TitleWindow");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("TitleWindow", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.closeButtonDisabledSkin = _embed_css_Assets_swf_CloseButtonDisabled_1578076100;
                this.paddingTop = 4;
                this.dropShadowEnabled = true;
                this.backgroundColor = 16777215;
                this.closeButtonOverSkin = _embed_css_Assets_swf_CloseButtonOver_279056452;
                this.closeButtonUpSkin = _embed_css_Assets_swf_CloseButtonUp_1356795101;
                this.closeButtonDownSkin = _embed_css_Assets_swf_CloseButtonDown_446372178;
                this.cornerRadius = 8;
                this.paddingLeft = 4;
                this.paddingBottom = 4;
                this.paddingRight = 4;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
