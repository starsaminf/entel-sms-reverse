package 
{
    import _CursorManagerStyle.*;
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _CursorManagerStyle extends Object
    {
        private static var _embed_css_Assets_swf_mx_skins_cursor_BusyCursor_1429604402:Class = _CursorManagerStyle__embed_css_Assets_swf_mx_skins_cursor_BusyCursor_1429604402;

        public function _CursorManagerStyle()
        {
            return;
        }// end function

        public static function init(mx.skins.halo:IFlexModuleFactory) : void
        {
            var fbs:* = mx.skins.halo;
            var style:* = StyleManager.getStyleDeclaration("CursorManager");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("CursorManager", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.busyCursor = BusyCursor;
                this.busyCursorBackground = _embed_css_Assets_swf_mx_skins_cursor_BusyCursor_1429604402;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
