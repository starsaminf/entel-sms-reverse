package mx.utils
{

    public class StringUtil extends Object
    {
        static const VERSION:String = "3.2.0.3958";

        public function StringUtil()
        {
            return;
        }// end function

        public static function trim(C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as:String) : String
        {
            if (C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as == null)
            {
                return "";
            }
            var _loc_2:int = 0;
            while (isWhitespace(C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as.charAt(_loc_2)))
            {
                
                _loc_2++;
            }
            var _loc_3:* = C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as.length - 1;
            while (isWhitespace(C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as.charAt(_loc_3)))
            {
                
                _loc_3 = _loc_3 - 1;
            }
            if (_loc_3 >= _loc_2)
            {
                return C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as.slice(_loc_2, (_loc_3 + 1));
            }
            return "";
        }// end function

        public static function isWhitespace(length:String) : Boolean
        {
            switch(length)
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

        public static function substitute(C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as:String, ... args) : String
        {
            var _loc_4:Array = null;
            if (C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as == null)
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
                
                C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as = C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as.replace(new RegExp("\\{" + _loc_5 + "\\}", "g"), _loc_4[_loc_5]);
                _loc_5++;
            }
            return C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as;
        }// end function

        public static function trimArrayElements(C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as:String, C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as:String) : String
        {
            var _loc_3:Array = null;
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            if (C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as != "" && C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as != null)
            {
                _loc_3 = C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as.split(C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as);
                _loc_4 = _loc_3.length;
                _loc_5 = 0;
                while (_loc_5 < _loc_4)
                {
                    
                    _loc_3[_loc_5] = StringUtil.trim(_loc_3[_loc_5]);
                    _loc_5++;
                }
                if (_loc_4 > 0)
                {
                    C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as = _loc_3.join(C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as);
                }
            }
            return C:\work\flex\sdk\frameworks\projects\framework\src;mx\utils;StringUtil.as;
        }// end function

    }
}
