package mx.preloaders
{
    import flash.display.*;

    public interface IPreloaderDisplay extends IEventDispatcher
    {

        public function IPreloaderDisplay();

        function set backgroundAlpha(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\preloaders;IPreloaderDisplay.as:Number) : void;

        function get stageHeight() : Number;

        function get stageWidth() : Number;

        function set backgroundColor(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\preloaders;IPreloaderDisplay.as:uint) : void;

        function set preloader(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\preloaders;IPreloaderDisplay.as:Sprite) : void;

        function get backgroundImage() : Object;

        function get backgroundSize() : String;

        function get backgroundAlpha() : Number;

        function set stageHeight(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\preloaders;IPreloaderDisplay.as:Number) : void;

        function get backgroundColor() : uint;

        function set stageWidth(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\preloaders;IPreloaderDisplay.as:Number) : void;

        function set backgroundImage(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\preloaders;IPreloaderDisplay.as:Object) : void;

        function set backgroundSize(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\preloaders;IPreloaderDisplay.as:String) : void;

        function initialize() : void;

    }
}
