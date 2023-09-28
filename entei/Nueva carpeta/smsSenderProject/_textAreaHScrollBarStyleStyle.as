package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _textAreaHScrollBarStyleStyle extends Object
    {

        public function _textAreaHScrollBarStyleStyle()
        {
            return;
        }// end function

        public static function init(_textAreaHScrollBarStyleStyle:IFlexModuleFactory) : void
        {
            var fbs:* = _textAreaHScrollBarStyleStyle;
            var style:* = StyleManager.getStyleDeclaration(".textAreaHScrollBarStyle");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".textAreaHScrollBarStyle", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
