package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _headerDateTextStyle extends Object
    {

        public function _headerDateTextStyle()
        {
            return;
        }// end function

        public static function init(bold:IFlexModuleFactory) : void
        {
            var fbs:* = bold;
            var style:* = StyleManager.getStyleDeclaration(".headerDateText");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".headerDateText", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.fontWeight = "bold";
                this.textAlign = "center";
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
