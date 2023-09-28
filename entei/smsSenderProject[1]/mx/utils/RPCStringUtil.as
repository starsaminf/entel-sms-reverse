package mx.utils
{

    public class RPCStringUtil extends Object
    {
        static const VERSION:String = "3.2.0.3958";

        public function RPCStringUtil()
        {
            return;
        }// end function

        public static function trim(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as:String) : String
        {
            if (C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as == null)
            {
                return "";
            }
            var _loc_2:int = 0;
            while (isWhitespace(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as.charAt(_loc_2)))
            {
                
                _loc_2++;
            }
            var _loc_3:* = C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as.length - 1;
            while (isWhitespace(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as.charAt(_loc_3)))
            {
                
                _loc_3 = _loc_3 - 1;
            }
            if (_loc_3 >= _loc_2)
            {
                return C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as.slice(_loc_2, (_loc_3 + 1));
            }
            return "";
        }// end function

        public static function isWhitespace(http://adobe.com/AS3/2006/builtin:String) : Boolean
        {
            switch(http://adobe.com/AS3/2006/builtin)
            {
                case " ":
                case "\t":
                case "\r":
                case "\n":
                case "\f":
                {
                    return true;
                }
                default:
                {
                    return false;
                    break;
                }
            }
        }// end function

        public static function substitute(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as:String, ... args) : String
        {
            var _loc_4:Array = null;
            if (C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as == null)
            {
                return "";
            }
            args = args.length;
            if (args == 1 && args[0] is Array)
            {
                _loc_4 = args[0] as Array;
                args = _loc_4.length;
            }
            else
            {
                _loc_4 = args;
            }
            var _loc_5:int = 0;
            while (_loc_5 < args)
            {
                
                C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as = C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as.replace(new RegExp("\\{" + _loc_5 + "\\}", "g"), _loc_4[_loc_5]);
                _loc_5++;
            }
            return C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as;
        }// end function

        public static function trimArrayElements(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as:String, C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as:String) : String
        {
            var _loc_3:Array = null;
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            if (C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as != "" && C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as != null)
            {
                _loc_3 = C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as.split(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as);
                _loc_4 = _loc_3.length;
                _loc_5 = 0;
                while (_loc_5 < _loc_4)
                {
                    
                    _loc_3[_loc_5] = trim(_loc_3[_loc_5]);
                    _loc_5++;
                }
                if (_loc_4 > 0)
                {
                    C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as = _loc_3.join(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as);
                }
            }
            return C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;RPCStringUtil.as;
        }// end function

    }
}
