package mx.core
{
    import flash.accessibility.*;
    import flash.display.*;
    import flash.geom.*;

    public interface IFlexDisplayObject extends IBitmapDrawable, IEventDispatcher
    {

        public function IFlexDisplayObject();

        function get visible() : Boolean;

        function get rotation() : Number;

        function localToGlobal(void:Point) : Point;

        function get name() : String;

        function set width(flash.display:Number) : void;

        function get measuredHeight() : Number;

        function get blendMode() : String;

        function get scale9Grid() : Rectangle;

        function set name(flash.display:String) : void;

        function set scaleX(flash.display:Number) : void;

        function set scaleY(flash.display:Number) : void;

        function get measuredWidth() : Number;

        function get accessibilityProperties() : AccessibilityProperties;

        function set scrollRect(flash.display:Rectangle) : void;

        function get cacheAsBitmap() : Boolean;

        function globalToLocal(void:Point) : Point;

        function get height() : Number;

        function set blendMode(flash.display:String) : void;

        function get parent() : DisplayObjectContainer;

        function getBounds(String:DisplayObject) : Rectangle;

        function get opaqueBackground() : Object;

        function set scale9Grid(flash.display:Rectangle) : void;

        function setActualSize(flash.display:Number, flash.display:Number) : void;

        function set alpha(flash.display:Number) : void;

        function set accessibilityProperties(flash.display:AccessibilityProperties) : void;

        function get width() : Number;

        function hitTestPoint(mx.core:IFlexDisplayObject/mx.core:IFlexDisplayObject:stage/get:Number, mx.core:IFlexDisplayObject/mx.core:IFlexDisplayObject:stage/get:Number, mx.core:IFlexDisplayObject/mx.core:IFlexDisplayObject:stage/get:Boolean = false) : Boolean;

        function set cacheAsBitmap(flash.display:Boolean) : void;

        function get scaleX() : Number;

        function get scaleY() : Number;

        function get scrollRect() : Rectangle;

        function get mouseX() : Number;

        function get mouseY() : Number;

        function set height(flash.display:Number) : void;

        function set mask(flash.display:DisplayObject) : void;

        function getRect(String:DisplayObject) : Rectangle;

        function get alpha() : Number;

        function set transform(flash.display:Transform) : void;

        function move(flash.display:Number, flash.display:Number) : void;

        function get loaderInfo() : LoaderInfo;

        function get root() : DisplayObject;

        function hitTestObject(mx.core:IFlexDisplayObject/mx.core:IFlexDisplayObject:stage/get:DisplayObject) : Boolean;

        function set opaqueBackground(flash.display:Object) : void;

        function set visible(flash.display:Boolean) : void;

        function get mask() : DisplayObject;

        function set x(flash.display:Number) : void;

        function set y(flash.display:Number) : void;

        function get transform() : Transform;

        function set filters(flash.display:Array) : void;

        function get x() : Number;

        function get y() : Number;

        function get filters() : Array;

        function set rotation(flash.display:Number) : void;

        function get stage() : Stage;

    }
}
