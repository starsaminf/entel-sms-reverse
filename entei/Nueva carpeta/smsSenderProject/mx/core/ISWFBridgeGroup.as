package mx.core
{
    import flash.events.*;

    public interface ISWFBridgeGroup
    {

        public function ISWFBridgeGroup();

        function getChildBridgeProvider(mx.core:ISWFBridgeGroup/mx.core:ISWFBridgeGroup:parentBridge/get:IEventDispatcher) : ISWFBridgeProvider;

        function removeChildBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;ISWFBridgeGroup.as:IEventDispatcher) : void;

        function get parentBridge() : IEventDispatcher;

        function addChildBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;ISWFBridgeGroup.as:IEventDispatcher, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;ISWFBridgeGroup.as:ISWFBridgeProvider) : void;

        function set parentBridge(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;ISWFBridgeGroup.as:IEventDispatcher) : void;

        function containsBridge(IEventDispatcher:IEventDispatcher) : Boolean;

        function getChildBridges() : Array;

    }
}
