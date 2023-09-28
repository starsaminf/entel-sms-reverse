package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _dateFieldPopupStyle extends Object
    {

        public function _dateFieldPopupStyle()
        {
            return;
        }// end function

        public static function init(_dateFieldPopupStyle.as$3:IFlexModuleFactory) : void
        {
            var fbs:* = _dateFieldPopupStyle.as$3;
            var style:* = StyleManager.getStyleDeclaration(".dateFieldPopup");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".dateFieldPopup", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.dropShadowEnabled = true;
                this.backgroundColor = 16777215;
                this.borderThickness = 0;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
