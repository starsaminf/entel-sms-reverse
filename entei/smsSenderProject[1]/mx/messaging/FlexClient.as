package mx.messaging
{
    import flash.events.*;
    import mx.events.*;

    public class FlexClient extends EventDispatcher
    {
        private var _waitForFlexClientId:Boolean = false;
        private var _id:String;
        private static var _instance:FlexClient;
        static const NULL_FLEXCLIENT_ID:String = "nil";

        public function FlexClient()
        {
            return;
        }// end function

        public function get id() : String
        {
            return _id;
        }// end function

        function get waitForFlexClientId() : Boolean
        {
            return _waitForFlexClientId;
        }// end function

        public function set id(mx.messaging:String) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_id != mx.messaging)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "id", _id, mx.messaging);
                _id = mx.messaging;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        function set waitForFlexClientId(mx.messaging:Boolean) : void
        {
            var _loc_2:PropertyChangeEvent = null;
            if (_waitForFlexClientId != mx.messaging)
            {
                _loc_2 = PropertyChangeEvent.createUpdateEvent(this, "waitForFlexClientId", _waitForFlexClientId, mx.messaging);
                _waitForFlexClientId = mx.messaging;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        public static function getInstance() : FlexClient
        {
            if (_instance == null)
            {
                _instance = new FlexClient;
            }
            return _instance;
        }// end function

    }
}
