package mx.core
{

    public interface IEmbeddedFontRegistry
    {

        public function IEmbeddedFontRegistry();

        function getAssociatedModuleFactory(font:EmbeddedFont, font:IFlexModuleFactory) : IFlexModuleFactory;

        function registerFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void;

        function deregisterFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void;

        function getFonts() : Array;

    }
}
