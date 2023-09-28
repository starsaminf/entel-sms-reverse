package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _todayStyleStyle extends Object
    {

        public function _todayStyleStyle()
        {
            return;
        }// end function

        public static function init(color:IFlexModuleFactory) : void
        {
            var fbs:* = color;
            var style:* = StyleManager.getStyleDeclaration(".todayStyle");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".todayStyle", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.color = 16777215;
                this.textAlign = "center";
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
