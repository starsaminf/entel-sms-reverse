package mx.core
{
    import flash.display.*;
    import mx.managers.*;

    public interface IUIComponent extends IFlexDisplayObject
    {

        public function IUIComponent();

        function set focusPane(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Sprite) : void;

        function get enabled() : Boolean;

        function set enabled(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Boolean) : void;

        function set isPopUp(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Boolean) : void;

        function get explicitMinHeight() : Number;

        function get percentWidth() : Number;

        function get isPopUp() : Boolean;

        function get owner() : DisplayObjectContainer;

        function get percentHeight() : Number;

        function get baselinePosition() : Number;

        function owns(Number:DisplayObject) : Boolean;

        function initialize() : void;

        function get maxWidth() : Number;

        function get minWidth() : Number;

        function getExplicitOrMeasuredWidth() : Number;

        function get explicitMaxWidth() : Number;

        function get explicitMaxHeight() : Number;

        function set percentHeight(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Number) : void;

        function get minHeight() : Number;

        function set percentWidth(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Number) : void;

        function get document() : Object;

        function get focusPane() : Sprite;

        function getExplicitOrMeasuredHeight() : Number;

        function set tweeningProperties(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Array) : void;

        function set explicitWidth(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Number) : void;

        function set measuredMinHeight(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Number) : void;

        function get explicitMinWidth() : Number;

        function get tweeningProperties() : Array;

        function get maxHeight() : Number;

        function set owner(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:DisplayObjectContainer) : void;

        function set includeInLayout(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Boolean) : void;

        function setVisible(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Boolean, mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Boolean = false) : void;

        function parentChanged(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:DisplayObjectContainer) : void;

        function get explicitWidth() : Number;

        function get measuredMinHeight() : Number;

        function set measuredMinWidth(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Number) : void;

        function set explicitHeight(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Number) : void;

        function get includeInLayout() : Boolean;

        function get measuredMinWidth() : Number;

        function get explicitHeight() : Number;

        function set systemManager(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:ISystemManager) : void;

        function set document(mx.core:IUIComponent/mx.core:IUIComponent:baselinePosition/get:Object) : void;

        function get systemManager() : ISystemManager;

    }
}
