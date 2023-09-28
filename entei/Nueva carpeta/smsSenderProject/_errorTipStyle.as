package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _errorTipStyle extends Object
    {

        public function _errorTipStyle()
        {
            return;
        }// end function

        public static function init(borderColor:IFlexModuleFactory) : void
        {
            var fbs:* = borderColor;
            var style:* = StyleManager.getStyleDeclaration(".errorTip");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".errorTip", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.fontWeight = "bold";
                this.borderStyle = "errorTipRight";
                this.paddingTop = 4;
                this.borderColor = 13510953;
                this.color = 16777215;
                this.fontSize = 9;
                this.shadowColor = 0;
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
