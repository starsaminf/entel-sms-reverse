package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _weekDayStyleStyle extends Object
    {

        public function _weekDayStyleStyle()
        {
            return;
        }// end function

        public static function init(bold:IFlexModuleFactory) : void
        {
            var fbs:* = bold;
            var style:* = StyleManager.getStyleDeclaration(".weekDayStyle");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".weekDayStyle", style, false);
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
