package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _linkButtonStyleStyle extends Object
    {

        public function _linkButtonStyleStyle()
        {
            return;
        }// end function

        public static function init(http://adobe.com/AS3/2006/builtin:IFlexModuleFactory) : void
        {
            var fbs:* = http://adobe.com/AS3/2006/builtin;
            var style:* = StyleManager.getStyleDeclaration(".linkButtonStyle");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".linkButtonStyle", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.paddingTop = 2;
                this.paddingLeft = 2;
                this.paddingBottom = 2;
                this.paddingRight = 2;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}