package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _LinkButtonStyle extends Object
    {

        public function _LinkButtonStyle()
        {
            return;
        }// end function

        public static function init(LinkButtonSkin:IFlexModuleFactory) : void
        {
            var fbs:* = LinkButtonSkin;
            var style:* = StyleManager.getStyleDeclaration("LinkButton");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("LinkButton", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.upSkin = null;
                this.selectedDownSkin = null;
                this.overSkin = null;
                this.downSkin = null;
                this.selectedDisabledSkin = null;
                this.selectedUpSkin = null;
                this.disabledSkin = null;
                this.skin = LinkButtonSkin;
                this.paddingLeft = 7;
                this.selectedOverSkin = null;
                this.paddingRight = 7;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
