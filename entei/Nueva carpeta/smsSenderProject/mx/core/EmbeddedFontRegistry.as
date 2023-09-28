package mx.core
{
    import flash.text.*;
    import flash.utils.*;

    public class EmbeddedFontRegistry extends Object implements IEmbeddedFontRegistry
    {
        private static var fonts:Object = {};
        private static var instance:IEmbeddedFontRegistry;
        static const VERSION:String = "3.2.0.3958";

        public function EmbeddedFontRegistry()
        {
            return;
        }// end function

        public function getAssociatedModuleFactory(REGULAR:EmbeddedFont, REGULAR:IFlexModuleFactory) : IFlexModuleFactory
        {
            var _loc_4:int = 0;
            var _loc_5:Object = null;
            var _loc_3:* = fonts[createFontKey(REGULAR)];
            if (_loc_3)
            {
                _loc_4 = _loc_3[REGULAR];
                if (_loc_4)
                {
                    return REGULAR;
                }
                for (_loc_5 in _loc_3)
                {
                    
                    return _loc_5 as IFlexModuleFactory;
                }
            }
            return null;
        }// end function

        public function deregisterFont(flash.text:EmbeddedFont, flash.text:IFlexModuleFactory) : void
        {
            var _loc_5:int = 0;
            var _loc_6:Object = null;
            var _loc_3:* = createFontKey(flash.text);
            var _loc_4:* = fonts[_loc_3];
            if (_loc_4 != null)
            {
                delete _loc_4[flash.text];
                _loc_5 = 0;
                for (_loc_6 in _loc_4)
                {
                    
                    _loc_5++;
                }
                if (_loc_5 == 0)
                {
                    delete fonts[_loc_3];
                }
            }
            return;
        }// end function

        public function getFonts() : Array
        {
            var _loc_2:String = null;
            var _loc_1:Array = [];
            for (_loc_2 in fonts)
            {
                
                _loc_1.push(createEmbeddedFont(_loc_2));
            }
            return _loc_1;
        }// end function

        public function registerFont(flash.text:EmbeddedFont, flash.text:IFlexModuleFactory) : void
        {
            var _loc_3:* = createFontKey(flash.text);
            var _loc_4:* = fonts[_loc_3];
            if (!_loc_4)
            {
                _loc_4 = new Dictionary(true);
                fonts[_loc_3] = _loc_4;
            }
            _loc_4[flash.text] = 1;
            return;
        }// end function

        public static function registerFonts(flash.text:Object, flash.text:IFlexModuleFactory) : void
        {
            var _loc_4:Object = null;
            var _loc_5:Object = null;
            var _loc_6:String = null;
            var _loc_7:Boolean = false;
            var _loc_8:Boolean = false;
            var _loc_3:* = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
            for (_loc_4 in flash.text)
            {
                
                _loc_5 = flash.text[_loc_4];
                for (_loc_6 in _loc_5)
                {
                    
                    if (_loc_5[_loc_6] == false)
                    {
                        continue;
                    }
                    if (_loc_6 == "regular")
                    {
                        _loc_7 = false;
                        _loc_8 = false;
                    }
                    else if (_loc_6 == "boldItalic")
                    {
                        _loc_7 = true;
                        _loc_8 = true;
                    }
                    else if (_loc_6 == "bold")
                    {
                        _loc_7 = true;
                        _loc_8 = false;
                    }
                    else if (_loc_6 == "italic")
                    {
                        _loc_7 = false;
                        _loc_8 = true;
                    }
                    _loc_3.registerFont(new EmbeddedFont(String(_loc_4), _loc_7, _loc_8), flash.text);
                }
            }
            return;
        }// end function

        public static function getInstance() : IEmbeddedFontRegistry
        {
            if (!instance)
            {
                instance = new EmbeddedFontRegistry;
            }
            return instance;
        }// end function

        public static function getFontStyle(param1:Boolean, param2:Boolean) : String
        {
            var _loc_3:* = FontStyle.REGULAR;
            if (param1 && param2)
            {
                _loc_3 = FontStyle.BOLD_ITALIC;
            }
            else if (param1)
            {
                _loc_3 = FontStyle.BOLD;
            }
            else if (param2)
            {
                _loc_3 = FontStyle.ITALIC;
            }
            return _loc_3;
        }// end function

        private static function createFontKey(param1:EmbeddedFont) : String
        {
            return param1.fontName + param1.fontStyle;
        }// end function

        private static function createEmbeddedFont(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as:String) : EmbeddedFont
        {
            var _loc_2:String = null;
            var _loc_3:Boolean = false;
            var _loc_4:Boolean = false;
            var _loc_5:* = endsWith(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as, FontStyle.REGULAR);
            if (_loc_5 > 0)
            {
                _loc_2 = C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, false, false);
            }
            _loc_5 = endsWith(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as, FontStyle.BOLD);
            if (_loc_5 > 0)
            {
                _loc_2 = C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, true, false);
            }
            _loc_5 = endsWith(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as, FontStyle.BOLD_ITALIC);
            if (_loc_5 > 0)
            {
                _loc_2 = C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, true, true);
            }
            _loc_5 = endsWith(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as, FontStyle.ITALIC);
            if (_loc_5 > 0)
            {
                _loc_2 = C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;EmbeddedFontRegistry.as.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, false, true);
            }
            return new EmbeddedFont("", false, false);
        }// end function

        private static function endsWith(key:String, key:String) : int
        {
            var _loc_3:* = key.lastIndexOf(key);
            if (_loc_3 > 0 && _loc_3 + key.length == key.length)
            {
                return _loc_3;
            }
            return -1;
        }// end function

    }
}
