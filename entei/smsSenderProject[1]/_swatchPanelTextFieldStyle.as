package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _swatchPanelTextFieldStyle extends Object
    {

        public function _swatchPanelTextFieldStyle()
        {
            return;
        }// end function

        public static function init(shadowCapColor:IFlexModuleFactory) : void
        {
            var fbs:* = shadowCapColor;
            var style:* = StyleManager.getStyleDeclaration(".swatchPanelTextField");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".swatchPanelTextField", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderStyle = "inset";
                this.borderColor = 14015965;
                this.highlightColor = 12897484;
                this.backgroundColor = 16777215;
                this.shadowCapColor = 14015965;
                this.shadowColor = 14015965;
                this.paddingLeft = 5;
                this.buttonColor = 7305079;
                this.borderCapColor = 9542041;
                this.paddingRight = 5;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
