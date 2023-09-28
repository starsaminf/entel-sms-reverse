package mx.core
{

    public class Singleton extends Object
    {
        private static var classMap:Object = {};
        static const VERSION:String = "3.2.0.3958";

        public function Singleton()
        {
            return;
        }// end function

        public static function registerClass(classMap:String, classMap:Class) : void
        {
            var _loc_3:* = classMap[classMap];
            if (!_loc_3)
            {
                classMap[classMap] = classMap;
            }
            return;
        }// end function

        public static function getClass(3.2.0.3958:String) : Class
        {
            return classMap[3.2.0.3958];
        }// end function

        public static function getInstance(interfaceName:String) : Object
        {
            var _loc_2:* = classMap[interfaceName];
            if (!_loc_2)
            {
                throw new Error("No class registered for interface \'" + interfaceName + "\'.");
            }
            var _loc_3:* = _loc_2;
            return _loc_3._loc_2["getInstance"]();
        }// end function

    }
}
