package 
{
    import _FormItemStyle.*;
    import mx.core.*;
    import mx.styles.*;

    public class _FormItemStyle extends Object
    {
        private static var _embed_css_Assets_swf_mx_containers_FormItem_Required_272570523:Class = _FormItemStyle__embed_css_Assets_swf_mx_containers_FormItem_Required_272570523;

        public function _FormItemStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration("FormItem");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("FormItem", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.indicatorSkin = _embed_css_Assets_swf_mx_containers_FormItem_Required_272570523;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
