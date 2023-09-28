package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _ListBaseStyle extends Object
    {

        public function _ListBaseStyle()
        {
            return;
        }// end function

        public static function init(backgroundDisabledColor:IFlexModuleFactory) : void
        {
            var fbs:* = backgroundDisabledColor;
            var style:* = StyleManager.getStyleDeclaration("ListBase");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("ListBase", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderStyle = "solid";
                this.paddingTop = 2;
                this.backgroundColor = 16777215;
                this.backgroundDisabledColor = 14540253;
                this.dropIndicatorSkin = ListDropIndicator;
                this.paddingLeft = 2;
                this.paddingBottom = 2;
                this.paddingRight = 0;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
