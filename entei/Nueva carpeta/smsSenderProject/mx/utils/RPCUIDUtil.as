package mx.utils
{
    import flash.utils.*;

    public class RPCUIDUtil extends Object
    {
        static const VERSION:String = "3.2.0.3958";
        private static const ALPHA_CHAR_CODES:Array = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70];

        public function RPCUIDUtil()
        {
            return;
        }// end function

        public static function createUID() : String
        {
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_1:* = new Array(36);
            var _loc_2:int = 0;
            _loc_3 = 0;
            while (_loc_3 < 8)
            {
                
                _loc_1[++_loc_2] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
                _loc_3++;
            }
            _loc_3 = 0;
            while (_loc_3 < 3)
            {
                
                _loc_1[++_loc_2] = 45;
                _loc_4 = 0;
                while (_loc_4 < 4)
                {
                    
                    _loc_1[++_loc_2] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
                    _loc_4++;
                }
                _loc_3++;
            }
            _loc_1[++_loc_2] = 45;
            var _loc_5:* = new Date().getTime();
            var _loc_6:* = ("0000000" + _loc_5.toString(16).toUpperCase()).substr(-8);
            _loc_3 = 0;
            while (_loc_3 < 8)
            {
                
                _loc_1[++_loc_2] = _loc_6.charCodeAt(_loc_3);
                _loc_3++;
            }
            _loc_3 = 0;
            while (_loc_3 < 4)
            {
                
                _loc_1[++_loc_2] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
                _loc_3++;
            }
            return String.fromCharCode.apply(null, _loc_1);
        }// end function

        public static function isUID(Object:String) : Boolean
        {
            var _loc_2:uint = 0;
            var _loc_3:Number = NaN;
            if (Object != null && Object.length == 36)
            {
                _loc_2 = 0;
                while (_loc_2 < 36)
                {
                    
                    _loc_3 = Object.charCodeAt(_loc_2);
                    if (_loc_2 == 8 || _loc_2 == 13 || _loc_2 == 18 || _loc_2 == 23)
                    {
                        if (_loc_3 != 45)
                        {
                            return false;
                        }
                    }
                    else if (_loc_3 < 48 || _loc_3 > 70 || _loc_3 > 57 && _loc_3 < 65)
                    {
                        return false;
                    }
                    _loc_2 = _loc_2 + 1;
                }
                return true;
            }
            return false;
        }// end function

        public static function fromByteArray(Array:ByteArray) : String
        {
            var _loc_2:Array = null;
            var _loc_3:uint = 0;
            var _loc_4:uint = 0;
            var _loc_5:int = 0;
            if (Array != null && Array.length >= 16 && Array.bytesAvailable >= 16)
            {
                _loc_2 = new Array(36);
                _loc_3 = 0;
                _loc_4 = 0;
                while (_loc_4 < 16)
                {
                    
                    if (_loc_4 == 4 || _loc_4 == 6 || _loc_4 == 8 || _loc_4 == 10)
                    {
                        _loc_2[++_loc_3] = 45;
                    }
                    _loc_5 = Array.readByte();
                    _loc_2[++_loc_3] = ALPHA_CHAR_CODES[(_loc_5 & 240) >>> 4];
                    _loc_2[++_loc_3] = ALPHA_CHAR_CODES[_loc_5 & 15];
                    _loc_4 = _loc_4 + 1;
                }
                return String.fromCharCode.apply(null, _loc_2);
            }
            return null;
        }// end function

        public static function toByteArray(http://adobe.com/AS3/2006/builtin:String) : ByteArray
        {
            var _loc_2:ByteArray = null;
            var _loc_3:uint = 0;
            var _loc_4:String = null;
            var _loc_5:uint = 0;
            var _loc_6:uint = 0;
            if (isUID(http://adobe.com/AS3/2006/builtin))
            {
                _loc_2 = new ByteArray();
                _loc_3 = 0;
                while (_loc_3 < http://adobe.com/AS3/2006/builtin.length)
                {
                    
                    _loc_4 = http://adobe.com/AS3/2006/builtin.charAt(_loc_3);
                    if (_loc_4 == "-")
                    {
                    }
                    else
                    {
                        _loc_5 = getDigit(_loc_4);
                        _loc_3 = _loc_3 + 1;
                        _loc_6 = getDigit(http://adobe.com/AS3/2006/builtin.charAt(_loc_3));
                        _loc_2.writeByte((_loc_5 << 4 | _loc_6) & 255);
                    }
                    _loc_3 = _loc_3 + 1;
                }
                _loc_2.position = 0;
                return _loc_2;
            }
            return null;
        }// end function

        private static function getDigit(substr:String) : uint
        {
            switch(substr)
            {
                case "A":
                case "a":
                {
                    return 10;
                }
                case "B":
                case "b":
                {
                    return 11;
                }
                case "C":
                case "c":
                {
                    return 12;
                }
                case "D":
                case "d":
                {
                    return 13;
                }
                case "E":
                case "e":
                {
                    return 14;
                }
                case "F":
                case "f":
                {
                    return 15;
                }
                default:
                {
                    return new uint(substr);
                    break;
                }
            }
        }// end function

    }
}
