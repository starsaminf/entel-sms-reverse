package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _popUpMenuStyle extends Object
    {

        public function _popUpMenuStyle()
        {
            return;
        }// end function

        public static function init(normal:IFlexModuleFactory) : void
        {
            var fbs:* = normal;
            var style:* = StyleManager.getStyleDeclaration(".popUpMenu");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".popUpMenu", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.fontWeight = "normal";
                this.textAlign = "left";
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
