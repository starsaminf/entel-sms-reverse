package 
{
    import flash.system.*;
    import mx.core.*;
    import mx.managers.*;

    public class _smsSenderProject_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory
    {

        public function _smsSenderProject_mx_managers_SystemManager()
        {
            return;
        }// end function

        override public function create(... args) : Object
        {
            if (args.length > 0 && !(args[0] is String))
            {
                return super.create.apply(this, args);
            }
            args = args.length == 0 ? ("smsSenderProject") : (String(args[0]));
            var _loc_3:* = Class(getDefinitionByName(args));
            if (!_loc_3)
            {
                return null;
            }
            var _loc_4:* = new _loc_3;
            if (new _loc_3 is IFlexModule)
            {
                IFlexModule(_loc_4).moduleFactory = this;
            }
            return _loc_4;
        }// end function

        override public function info() : Object
        {
            return {backgroundAlpha:"0", borderColor:"#014E96", borderStyle:"none", cdRsls:[{rsls:["framework_3.2.0.3958.swz", "framework_3.2.0.3958.swf"], policyFiles:["", ""], digests:["1c04c61346a1fa3139a37d860ed92632aa13decf4c17903367141677aac966f4", "1c04c61346a1fa3139a37d860ed92632aa13decf4c17903367141677aac966f4"], types:["SHA-256", "SHA-256"], isSigned:[true, false]}], compiledLocales:["en_US"], compiledResourceBundleNames:["collections", "containers", "controls", "core", "effects", "logging", "messaging", "rpc", "skins", "styles", "validators"], cornerRadius:"20", creationComplete:"intUserId=int(Application.application.parameters.userId);init();   roSmsService.selectRanges();sw=0;roSmsService.countMessages(intUserId);", currentDomain:ApplicationDomain.currentDomain, height:"600", layout:"absolute", mainClassName:"smsSenderProject", mixins:["_smsSenderProject_FlexInit", "_richTextEditorTextAreaStyleStyle", "_LinkButtonStyle", "_ControlBarStyle", "_alertButtonStyleStyle", "_SWFLoaderStyle", "_FormStyle", "_textAreaVScrollBarStyleStyle", "_headerDateTextStyle", "_TitleWindowStyle", "_globalStyle", "_ListBaseStyle", "_todayStyleStyle", "_AlertStyle", "_windowStylesStyle", "_ApplicationStyle", "_ToolTipStyle", "_FormItemLabelStyle", "_CursorManagerStyle", "_opaquePanelStyle", "_TextInputStyle", "_errorTipStyle", "_dateFieldPopupStyle", "_FormItemStyle", "_ComboBoxStyle", "_dataGridStylesStyle", "_DataGridStyle", "_popUpMenuStyle", "_headerDragProxyStyleStyle", "_activeTabStyleStyle", "_PanelStyle", "_DragManagerStyle", "_ContainerStyle", "_windowStatusStyle", "_ScrollBarStyle", "_TextAreaStyle", "_swatchPanelTextFieldStyle", "_textAreaHScrollBarStyleStyle", "_plainStyle", "_activeButtonStyleStyle", "_advancedDataGridStylesStyle", "_comboDropdownStyle", "_ButtonStyle", "_DataGridItemRendererStyle", "_weekDayStyleStyle", "_linkButtonStyleStyle", "_popupActivationWatcherSetupUtil", "_smsSenderProjectWatcherSetupUtil"], paddingBottom:"0", paddingLeft:"0", paddingRight:"0", paddingTop:"0", width:"232"};
        }// end function

    }
}
