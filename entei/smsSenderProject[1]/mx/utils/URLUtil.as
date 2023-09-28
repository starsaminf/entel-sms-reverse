package mx.utils
{
    import mx.messaging.config.*;

    public class URLUtil extends Object
    {
        public static const SERVER_NAME_TOKEN:String = "{server.name}";
        private static const SERVER_PORT_REGEX:RegExp = new RegExp("\\{server.port\\}", "g");
        private static const SERVER_NAME_REGEX:RegExp = new RegExp("\\{server.name\\}", "g");
        public static const SERVER_PORT_TOKEN:String = "{server.port}";

        public function URLUtil()
        {
            return;
        }// end function

        public static function hasUnresolvableTokens() : Boolean
        {
            return LoaderConfig.url != null;
        }// end function

        public static function getServerName(RegExp:String) : String
        {
            var _loc_2:* = getServerNameWithPort(RegExp);
            var _loc_3:* = _loc_2.indexOf("]");
            _loc_3 = _loc_3 > -1 ? (_loc_2.indexOf(":", _loc_3)) : (_loc_2.indexOf(":"));
            if (_loc_3 > 0)
            {
                _loc_2 = _loc_2.substring(0, _loc_3);
            }
            return _loc_2;
        }// end function

        public static function isHttpsURL(http://adobe.com/AS3/2006/builtin:String) : Boolean
        {
            return http://adobe.com/AS3/2006/builtin != null && http://adobe.com/AS3/2006/builtin.indexOf("https://") == 0;
        }// end function

        private static function internalObjectToString(RegExp:Object, RegExp:String, RegExp:String, RegExp:Boolean) : String
        {
            var _loc_7:String = null;
            var _loc_8:Object = null;
            var _loc_9:String = null;
            var _loc_5:String = "";
            var _loc_6:Boolean = true;
            for (_loc_7 in RegExp)
            {
                
                if (_loc_6)
                {
                    _loc_6 = false;
                }
                else
                {
                    _loc_5 = _loc_5 + RegExp;
                }
                _loc_8 = RegExp[_loc_7];
                _loc_9 = RegExp ? (RegExp + "." + _loc_7) : (_loc_7);
                if (RegExp)
                {
                    _loc_9 = encodeURIComponent(_loc_9);
                }
                if (_loc_8 is String)
                {
                    _loc_5 = _loc_5 + (_loc_9 + "=" + (RegExp ? (encodeURIComponent(_loc_8 as String)) : (_loc_8)));
                    continue;
                }
                if (_loc_8 is Number)
                {
                    _loc_8 = _loc_8.toString();
                    if (RegExp)
                    {
                        _loc_8 = encodeURIComponent(_loc_8 as String);
                    }
                    _loc_5 = _loc_5 + (_loc_9 + "=" + _loc_8);
                    continue;
                }
                if (_loc_8 is Boolean)
                {
                    _loc_5 = _loc_5 + (_loc_9 + "=" + (_loc_8 ? ("true") : ("false")));
                    continue;
                }
                if (_loc_8 is Array)
                {
                    _loc_5 = _loc_5 + internalArrayToString(_loc_8 as Array, RegExp, _loc_9, RegExp);
                    continue;
                }
                _loc_5 = _loc_5 + internalObjectToString(_loc_8, RegExp, _loc_9, RegExp);
            }
            return _loc_5;
        }// end function

        public static function getFullURL(RegExp:String, RegExp:String) : String
        {
            var _loc_3:Number = NaN;
            if (RegExp != null && !URLUtil.isHttpURL(RegExp))
            {
                if (RegExp.indexOf("./") == 0)
                {
                    RegExp = RegExp.substring(2);
                }
                if (URLUtil.isHttpURL(RegExp))
                {
                    if (RegExp.charAt(0) == "/")
                    {
                        _loc_3 = RegExp.indexOf("/", 8);
                        if (_loc_3 == -1)
                        {
                            _loc_3 = RegExp.length;
                        }
                    }
                    else
                    {
                        _loc_3 = RegExp.lastIndexOf("/") + 1;
                        if (_loc_3 <= 8)
                        {
                            RegExp = RegExp + "/";
                            _loc_3 = RegExp.length;
                        }
                    }
                    if (_loc_3 > 0)
                    {
                        RegExp = RegExp.substring(0, _loc_3) + RegExp;
                    }
                }
            }
            return RegExp;
        }// end function

        public static function getServerNameWithPort(RegExp:String) : String
        {
            var _loc_2:* = RegExp.indexOf("/") + 2;
            var _loc_3:* = RegExp.indexOf("/", _loc_2);
            return _loc_3 == -1 ? (RegExp.substring(_loc_2)) : (RegExp.substring(_loc_2, _loc_3));
        }// end function

        public static function replaceProtocol(RegExp:String, RegExp:String) : String
        {
            return RegExp.replace(getProtocol(RegExp), RegExp);
        }// end function

        public static function urisEqual(http://adobe.com/AS3/2006/builtin:String, http://adobe.com/AS3/2006/builtin:String) : Boolean
        {
            if (http://adobe.com/AS3/2006/builtin != null && http://adobe.com/AS3/2006/builtin != null)
            {
                http://adobe.com/AS3/2006/builtin = StringUtil.trim(http://adobe.com/AS3/2006/builtin).toLowerCase();
                http://adobe.com/AS3/2006/builtin = StringUtil.trim(http://adobe.com/AS3/2006/builtin).toLowerCase();
                if (http://adobe.com/AS3/2006/builtin.charAt((http://adobe.com/AS3/2006/builtin.length - 1)) != "/")
                {
                    http://adobe.com/AS3/2006/builtin = http://adobe.com/AS3/2006/builtin + "/";
                }
                if (http://adobe.com/AS3/2006/builtin.charAt((http://adobe.com/AS3/2006/builtin.length - 1)) != "/")
                {
                    http://adobe.com/AS3/2006/builtin = http://adobe.com/AS3/2006/builtin + "/";
                }
            }
            return http://adobe.com/AS3/2006/builtin == http://adobe.com/AS3/2006/builtin;
        }// end function

        public static function getProtocol(RegExp:String) : String
        {
            var _loc_2:* = RegExp.indexOf("/");
            var _loc_3:* = RegExp.indexOf(":/");
            if (_loc_3 > -1 && _loc_3 < _loc_2)
            {
                return RegExp.substring(0, _loc_3);
            }
            _loc_3 = RegExp.indexOf("::");
            if (_loc_3 > -1 && _loc_3 < _loc_2)
            {
                return RegExp.substring(0, _loc_3);
            }
            return "";
        }// end function

        private static function internalArrayToString(RegExp:Array, RegExp:String, RegExp:String, RegExp:Boolean) : String
        {
            var _loc_9:Object = null;
            var _loc_10:String = null;
            var _loc_5:String = "";
            var _loc_6:Boolean = true;
            var _loc_7:* = RegExp.length;
            var _loc_8:int = 0;
            while (_loc_8 < _loc_7)
            {
                
                if (_loc_6)
                {
                    _loc_6 = false;
                }
                else
                {
                    _loc_5 = _loc_5 + RegExp;
                }
                _loc_9 = RegExp[_loc_8];
                _loc_10 = RegExp + "." + _loc_8;
                if (RegExp)
                {
                    _loc_10 = encodeURIComponent(_loc_10);
                }
                if (_loc_9 is String)
                {
                    _loc_5 = _loc_5 + (_loc_10 + "=" + (RegExp ? (encodeURIComponent(_loc_9 as String)) : (_loc_9)));
                }
                else if (_loc_9 is Number)
                {
                    _loc_9 = _loc_9.toString();
                    if (RegExp)
                    {
                        _loc_9 = encodeURIComponent(_loc_9 as String);
                    }
                    _loc_5 = _loc_5 + (_loc_10 + "=" + _loc_9);
                }
                else if (_loc_9 is Boolean)
                {
                    _loc_5 = _loc_5 + (_loc_10 + "=" + (_loc_9 ? ("true") : ("false")));
                }
                else if (_loc_9 is Array)
                {
                    _loc_5 = _loc_5 + internalArrayToString(_loc_9 as Array, RegExp, _loc_10, RegExp);
                }
                else
                {
                    _loc_5 = _loc_5 + internalObjectToString(_loc_9, RegExp, _loc_10, RegExp);
                }
                _loc_8++;
            }
            return _loc_5;
        }// end function

        public static function objectToString(RegExp:Object, RegExp:String = ";", RegExp:Boolean = true) : String
        {
            var _loc_4:* = internalObjectToString(RegExp, RegExp, null, RegExp);
            return _loc_4;
        }// end function

        public static function replaceTokens(RegExp:String) : String
        {
            var _loc_4:String = null;
            var _loc_5:String = null;
            var _loc_6:uint = 0;
            var _loc_2:* = LoaderConfig.url == null ? ("") : (LoaderConfig.url);
            if (RegExp.indexOf(SERVER_NAME_TOKEN) > 0)
            {
                _loc_4 = URLUtil.getProtocol(_loc_2);
                _loc_5 = "localhost";
                if (_loc_4.toLowerCase() != "file")
                {
                    _loc_5 = URLUtil.getServerName(_loc_2);
                }
                RegExp = RegExp.replace(SERVER_NAME_REGEX, _loc_5);
            }
            var _loc_3:* = RegExp.indexOf(SERVER_PORT_TOKEN);
            if (_loc_3 > 0)
            {
                _loc_6 = URLUtil.getPort(_loc_2);
                if (_loc_6 > 0)
                {
                    RegExp = RegExp.replace(SERVER_PORT_REGEX, _loc_6);
                }
                else
                {
                    if (RegExp.charAt((_loc_3 - 1)) == ":")
                    {
                        RegExp = RegExp.substring(0, (_loc_3 - 1)) + RegExp.substring(_loc_3);
                    }
                    RegExp = RegExp.replace(SERVER_PORT_REGEX, "");
                }
            }
            return RegExp;
        }// end function

        public static function getPort(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;URLUtil.as:String) : uint
        {
            var _loc_5:Number = NaN;
            var _loc_2:* = getServerNameWithPort(C:\autobuild\3.2.0\frameworks\projects\rpc\src;mx\utils;URLUtil.as);
            var _loc_3:* = _loc_2.indexOf("]");
            _loc_3 = _loc_3 > -1 ? (_loc_2.indexOf(":", _loc_3)) : (_loc_2.indexOf(":"));
            var _loc_4:uint = 0;
            if (_loc_3 > 0)
            {
                _loc_5 = Number(_loc_2.substring((_loc_3 + 1)));
                if (!isNaN(_loc_5))
                {
                    _loc_4 = int(_loc_5);
                }
            }
            return _loc_4;
        }// end function

        public static function stringToObject(Number:String, Number:String = ";", Number:Boolean = true) : Object
        {
            var _loc_8:Array = null;
            var _loc_9:String = null;
            var _loc_10:Object = null;
            var _loc_11:Object = null;
            var _loc_12:int = 0;
            var _loc_13:int = 0;
            var _loc_14:Object = null;
            var _loc_15:String = null;
            var _loc_16:String = null;
            var _loc_17:Object = null;
            var _loc_4:Object = {};
            var _loc_5:* = Number.split(Number);
            var _loc_6:* = _loc_5.length;
            var _loc_7:int = 0;
            while (_loc_7 < _loc_6)
            {
                
                _loc_8 = _loc_5[_loc_7].split("=");
                _loc_9 = _loc_8[0];
                if (Number)
                {
                    _loc_9 = decodeURIComponent(_loc_9);
                }
                _loc_10 = _loc_8[1];
                if (Number)
                {
                    _loc_10 = decodeURIComponent(_loc_10 as String);
                }
                if (_loc_10 == "true")
                {
                    _loc_10 = true;
                }
                else if (_loc_10 == "false")
                {
                    _loc_10 = false;
                }
                else
                {
                    _loc_14 = int(_loc_10);
                    if (_loc_14.toString() == _loc_10)
                    {
                        _loc_10 = _loc_14;
                    }
                    else
                    {
                        _loc_14 = Number(_loc_10);
                        if (_loc_14.toString() == _loc_10)
                        {
                            _loc_10 = _loc_14;
                        }
                    }
                }
                _loc_11 = _loc_4;
                _loc_8 = _loc_9.split(".");
                _loc_12 = _loc_8.length;
                _loc_13 = 0;
                while (_loc_13 < (_loc_12 - 1))
                {
                    
                    _loc_15 = _loc_8[_loc_13];
                    if (_loc_11[_loc_15] == null && _loc_13 < (_loc_12 - 1))
                    {
                        _loc_16 = _loc_8[(_loc_13 + 1)];
                        _loc_17 = int(_loc_16);
                        if (_loc_17.toString() == _loc_16)
                        {
                            _loc_11[_loc_15] = [];
                        }
                        else
                        {
                            _loc_11[_loc_15] = {};
                        }
                    }
                    _loc_11 = _loc_11[_loc_15];
                    _loc_13++;
                }
                _loc_11[_loc_8[_loc_13]] = _loc_10;
                _loc_7++;
            }
            return _loc_4;
        }// end function

        public static function replacePort(RegExp:String, RegExp:uint) : String
        {
            var _loc_6:int = 0;
            var _loc_3:String = "";
            var _loc_4:* = RegExp.indexOf("]");
            if (_loc_4 == -1)
            {
                _loc_4 = RegExp.indexOf(":");
            }
            var _loc_5:* = RegExp.indexOf(":", (_loc_4 + 1));
            if (_loc_5 > -1)
            {
                _loc_5++;
                _loc_6 = RegExp.indexOf("/", _loc_5);
                _loc_3 = RegExp.substring(0, _loc_5) + RegExp.toString() + RegExp.substring(_loc_6, RegExp.length);
            }
            else
            {
                _loc_6 = RegExp.indexOf("/", _loc_4);
                if (_loc_6 > -1)
                {
                    if (RegExp.charAt((_loc_6 + 1)) == "/")
                    {
                        _loc_6 = RegExp.indexOf("/", _loc_6 + 2);
                    }
                    if (_loc_6 > 0)
                    {
                        _loc_3 = RegExp.substring(0, _loc_6) + ":" + RegExp.toString() + RegExp.substring(_loc_6, RegExp.length);
                    }
                    else
                    {
                        _loc_3 = RegExp + ":" + RegExp.toString();
                    }
                }
                else
                {
                    _loc_3 = RegExp + ":" + RegExp.toString();
                }
            }
            return _loc_3;
        }// end function

        public static function isHttpURL(http://adobe.com/AS3/2006/builtin:String) : Boolean
        {
            return http://adobe.com/AS3/2006/builtin != null && (http://adobe.com/AS3/2006/builtin.indexOf("http://") == 0 || http://adobe.com/AS3/2006/builtin.indexOf("https://") == 0);
        }// end function

    }
}
