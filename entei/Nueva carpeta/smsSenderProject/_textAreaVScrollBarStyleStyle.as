package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _textAreaVScrollBarStyleStyle extends Object
    {

        public function _textAreaVScrollBarStyleStyle()
        {
            return;
        }// end function

        public static function init(_textAreaVScrollBarStyleStyle:IFlexModuleFactory) : void
        {
            var fbs:* = _textAreaVScrollBarStyleStyle;
            var style:* = StyleManager.getStyleDeclaration(".textAreaVScrollBarStyle");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".textAreaVScrollBarStyle", style, false);
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
