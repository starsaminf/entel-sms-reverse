package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _ButtonStyle extends Object
    {

        public function _ButtonStyle()
        {
            return;
        }// end function

        public static function init(verticalGap:IFlexModuleFactory) : void
        {
            var fbs:* = verticalGap;
            var style:* = StyleManager.getStyleDeclaration("Button");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("Button", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.fontWeight = "bold";
                this.paddingTop = 2;
                this.cornerRadius = 4;
                this.textAlign = "center";
                this.verticalGap = 2;
                this.horizontalGap = 2;
                this.skin = ButtonSkin;
                this.paddingLeft = 10;
                this.paddingBottom = 2;
                this.paddingRight = 10;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
