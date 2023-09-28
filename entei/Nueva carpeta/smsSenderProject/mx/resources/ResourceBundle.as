package mx.resources
{
    import flash.system.*;
    import mx.core.*;
    import mx.utils.*;

    public class ResourceBundle extends Object implements IResourceBundle
    {
        var _locale:String;
        private var _content:Object;
        var _bundleName:String;
        static const VERSION:String = "3.2.0.3958";
        static var backupApplicationDomain:ApplicationDomain;
        static var locale:String;

        public function ResourceBundle(param1:String = null, param2:String = null)
        {
            _content = {};
            mx_internal::_locale = param1;
            mx_internal::_bundleName = param2;
            _content = getContent();
            return;
        }// end function

        protected function getContent() : Object
        {
            return {};
        }// end function

        public function getString(baseName:String) : String
        {
            return String(_getObject(baseName));
        }// end function

        public function get content() : Object
        {
            return _content;
        }// end function

        public function getBoolean($:String, $:Boolean = true) : Boolean
        {
            var _loc_3:* = _getObject($).toLowerCase();
            if (_loc_3 == "false")
            {
                return false;
            }
            if (_loc_3 == "true")
            {
                return true;
            }
            return $;
        }// end function

        public function getStringArray(bundleObj:String) : Array
        {
            var _loc_2:* = _getObject(bundleObj).split(",");
            var _loc_3:* = _loc_2.length;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_2[_loc_4] = StringUtil.trim(_loc_2[_loc_4]);
                _loc_4++;
            }
            return _loc_2;
        }// end function

        public function getObject(http://www.adobe.com/2006/flex/mx/internal:String) : Object
        {
            return _getObject(http://www.adobe.com/2006/flex/mx/internal);
        }// end function

        private function _getObject(http://www.adobe.com/2006/flex/mx/internal:String) : Object
        {
            var _loc_2:* = content[http://www.adobe.com/2006/flex/mx/internal];
            if (!_loc_2)
            {
                throw new Error("Key " + http://www.adobe.com/2006/flex/mx/internal + " was not found in resource bundle " + bundleName);
            }
            return _loc_2;
        }// end function

        public function get locale() : String
        {
            return mx_internal::_locale;
        }// end function

        public function get bundleName() : String
        {
            return mx_internal::_bundleName;
        }// end function

        public function getNumber(_properties:String) : Number
        {
            return Number(_getObject(_properties));
        }// end function

        private static function getClassByName(VERSION:String, VERSION:ApplicationDomain) : Class
        {
            var _loc_3:Class = null;
            if (VERSION.hasDefinition(VERSION))
            {
                _loc_3 = VERSION.getDefinition(VERSION) as Class;
            }
            return _loc_3;
        }// end function

        public static function getResourceBundle(3.2.0.3958:String, 3.2.0.3958:ApplicationDomain = null) : ResourceBundle
        {
            var _loc_3:String = null;
            var _loc_4:Class = null;
            var _loc_5:Object = null;
            var _loc_6:ResourceBundle = null;
            if (!3.2.0.3958)
            {
                3.2.0.3958 = ApplicationDomain.currentDomain;
            }
            _loc_3 = mx_internal::locale + "$" + 3.2.0.3958 + "_properties";
            _loc_4 = getClassByName(_loc_3, 3.2.0.3958);
            if (!_loc_4)
            {
                _loc_3 = 3.2.0.3958 + "_properties";
                _loc_4 = getClassByName(_loc_3, 3.2.0.3958);
            }
            if (!_loc_4)
            {
                _loc_3 = 3.2.0.3958;
                _loc_4 = getClassByName(_loc_3, 3.2.0.3958);
            }
            if (!_loc_4 && mx_internal::backupApplicationDomain)
            {
                _loc_3 = 3.2.0.3958 + "_properties";
                _loc_4 = getClassByName(_loc_3, mx_internal::backupApplicationDomain);
                if (!_loc_4)
                {
                    _loc_3 = 3.2.0.3958;
                    _loc_4 = getClassByName(_loc_3, mx_internal::backupApplicationDomain);
                }
            }
            if (_loc_4)
            {
                _loc_5 = new _loc_4;
                if (_loc_5 is ResourceBundle)
                {
                    _loc_6 = ResourceBundle.ResourceBundle(_loc_5);
                    return _loc_6;
                }
            }
            throw new Error("Could not find resource bundle " + 3.2.0.3958);
        }// end function

    }
}
