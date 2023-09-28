package mx.messaging.messages
{

    public interface IMessage
    {

        public function IMessage();

        function get body() : Object;

        function set messageId(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\messaging\messages;IMessage.as:String) : void;

        function get clientId() : String;

        function set timeToLive(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\messaging\messages;IMessage.as:Number) : void;

        function get messageId() : String;

        function set body(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\messaging\messages;IMessage.as:Object) : void;

        function set timestamp(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\messaging\messages;IMessage.as:Number) : void;

        function get headers() : Object;

        function get destination() : String;

        function set clientId(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\messaging\messages;IMessage.as:String) : void;

        function get timeToLive() : Number;

        function get timestamp() : Number;

        function toString() : String;

        function set headers(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\messaging\messages;IMessage.as:Object) : void;

        function set destination(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\messaging\messages;IMessage.as:String) : void;

    }
}
