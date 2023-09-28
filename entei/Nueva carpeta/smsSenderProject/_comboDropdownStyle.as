package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _comboDropdownStyle extends Object
    {

        public function _comboDropdownStyle()
        {
            return;
        }// end function

        public static function init(leading:IFlexModuleFactory) : void
        {
            var fbs:* = leading;
            var style:* = StyleManager.getStyleDeclaration(".comboDropdown");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration(".comboDropdown", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.shadowDirection = "center";
                this.fontWeight = "normal";
                this.dropShadowEnabled = true;
                this.leading = 0;
                this.backgroundColor = 16777215;
                this.shadowDistance = 1;
                this.cornerRadius = 0;
                this.borderThickness = 0;
                this.paddingLeft = 5;
                this.paddingRight = 5;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
