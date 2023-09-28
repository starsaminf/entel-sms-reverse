package 
{
    import _DragManagerStyle.*;
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _DragManagerStyle extends Object
    {
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragMove_1177654264:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragMove_1177654264;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragLink_1177645075:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragLink_1177645075;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragCopy_1178431644:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragCopy_1178431644;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragReject_1352160186:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragReject_1352160186;

        public function _DragManagerStyle()
        {
            return;
        }// end function

        public static function init(moveCursor:IFlexModuleFactory) : void
        {
            var fbs:* = moveCursor;
            var style:* = StyleManager.getStyleDeclaration("DragManager");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("DragManager", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.copyCursor = _embed_css_Assets_swf_mx_skins_cursor_DragCopy_1178431644;
                this.moveCursor = _embed_css_Assets_swf_mx_skins_cursor_DragMove_1177654264;
                this.rejectCursor = _embed_css_Assets_swf_mx_skins_cursor_DragReject_1352160186;
                this.linkCursor = _embed_css_Assets_swf_mx_skins_cursor_DragLink_1177645075;
                this.defaultDragImageSkin = DefaultDragImage;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
