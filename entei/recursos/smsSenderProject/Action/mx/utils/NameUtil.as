package mx.utils
{
    import flash.display.*;
    import flash.utils.*;
    import mx.core.*;

    public class NameUtil extends Object
    {
        static const VERSION:String = "3.2.0.3958";
        private static var counter:int = 0;

        public function NameUtil()
        {
            return;
        }// end function

        public static function displayObjectToString(object:DisplayObject) : String
        {
            var result:String;
            var o:DisplayObject;
            var s:String;
            var indices:Array;
            var displayObject:* = object;
            try
            {
                o = displayObject;
                while (o != null)
                {
                    
                    if (o.parent && o.stage && o.parent == o.stage)
                    {
                        break;
                    }
                    s = o.name;
                    if (o is IRepeaterClient)
                    {
                        indices = IRepeaterClient(o).instanceIndices;
                        if (indices)
                        {
                            s = s + ("[" + indices.join("][") + "]");
                        }
                    }
                    result = result == null ? (s) : (s + "." + result);
                    o = o.parent;
                }
            }
            catch (e:SecurityError)
            {
            }
            return result;
        }// end function

        public static function createUniqueName(object:Object) : String
        {
            if (!object)
            {
                return null;
            }
            var _loc_2:* = getQualifiedClassName(object);
            var _loc_3:* = _loc_2.indexOf("::");
            if (_loc_3 != -1)
            {
                _loc_2 = _loc_2.substr(_loc_3 + 2);
            }
            var _loc_4:* = _loc_2.charCodeAt((_loc_2.length - 1));
            if (_loc_4 >= 48 && _loc_4 <= 57)
            {
                _loc_2 = _loc_2 + "_";
            }
            return _loc_2 + counter++;
        }// end function

    }
}
