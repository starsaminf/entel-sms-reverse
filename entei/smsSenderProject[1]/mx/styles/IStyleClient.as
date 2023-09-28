package mx.styles
{

    public interface IStyleClient extends ISimpleStyleClient
    {

        public function IStyleClient();

        function regenerateStyleCache(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:Boolean) : void;

        function get className() : String;

        function clearStyle(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:String) : void;

        function getClassStyleDeclarations() : Array;

        function get inheritingStyles() : Object;

        function set nonInheritingStyles(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:Object) : void;

        function setStyle(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:String, mx.styles:IStyleClient/mx.styles:IStyleClient:className/get) : void;

        function get styleDeclaration() : CSSStyleDeclaration;

        function set styleDeclaration(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:CSSStyleDeclaration) : void;

        function get nonInheritingStyles() : Object;

        function set inheritingStyles(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:Object) : void;

        function getStyle(param1:String);

        function notifyStyleChangeInChildren(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:String, mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:Boolean) : void;

        function registerEffects(mx.styles:IStyleClient/mx.styles:IStyleClient:className/get:Array) : void;

    }
}
