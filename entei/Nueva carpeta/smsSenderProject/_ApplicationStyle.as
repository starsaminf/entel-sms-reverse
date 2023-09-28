package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _ApplicationStyle extends Object
    {

        public function _ApplicationStyle()
        {
            return;
        }// end function

        public static function init(mx.skins.halo:IFlexModuleFactory) : void
        {
            var fbs:* = mx.skins.halo;
            var style:* = StyleManager.getStyleDeclaration("Application");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("Application", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.backgroundSize = "100%";
                this.paddingTop = 24;
                this.backgroundColor = 8821927;
                this.backgroundImage = ApplicationBackground;
                this.horizontalAlign = "center";
                this.backgroundGradientAlphas = [1, 1];
                this.paddingLeft = 24;
                this.paddingBottom = 24;
                this.paddingRight = 24;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
