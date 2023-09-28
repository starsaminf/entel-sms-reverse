package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _richTextEditorTextAreaStyleStyle extends Object
    {

        public function _richTextEditorTextAreaStyleStyle()
        {
            return;
        }// end function

        public static function init(_richTextEditorTextAreaStyleStyle:IFlexModuleFactory) : void
        {
            var fbs:* = _richTextEditorTextAreaStyleStyle;
            var style:* = StyleManager.getStyleDeclaration(".richTextEditorTextAreaStyle");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".richTextEditorTextAreaStyle", style, false);
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
