package mx.core
{
    import flash.geom.*;

    public interface ISWFLoader extends ISWFBridgeProvider
    {

        public function ISWFLoader();

        function getVisibleApplicationRect(mx.core:ISWFLoader/mx.core:ISWFLoader:loadForCompatibility/get:Boolean = false) : Rectangle;

        function set loadForCompatibility(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;ISWFLoader.as:Boolean) : void;

        function get loadForCompatibility() : Boolean;

    }
}
