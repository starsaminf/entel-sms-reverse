package mx.managers
{

    public interface ILayoutManagerClient extends IEventDispatcher
    {

        public function ILayoutManagerClient();

        function get updateCompletePendingFlag() : Boolean;

        function set updateCompletePendingFlag(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;ILayoutManagerClient.as:Boolean) : void;

        function set initialized(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;ILayoutManagerClient.as:Boolean) : void;

        function validateProperties() : void;

        function validateDisplayList() : void;

        function get nestLevel() : int;

        function get initialized() : Boolean;

        function get processedDescriptors() : Boolean;

        function validateSize(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;ILayoutManagerClient.as:Boolean = false) : void;

        function set nestLevel(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;ILayoutManagerClient.as:int) : void;

        function set processedDescriptors(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\managers;ILayoutManagerClient.as:Boolean) : void;

    }
}
