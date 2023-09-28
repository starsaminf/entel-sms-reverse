package mx.resources
{
    import LocaleSorter.as$107.*;

    public class LocaleSorter extends Object
    {
        static const VERSION:String = "3.2.0.3958";

        public function LocaleSorter()
        {
            return;
        }// end function

        private static function normalizeLocale(hasLocale:String) : String
        {
            return hasLocale.toLowerCase().replace(/-/g, "_");
        }// end function

        public static function sortLocalesByPreference(mx.resources:Array, mx.resources:Array, mx.resources:String = null, mx.resources:Boolean = false) : Array
        {
            var result:Array;
            var hasLocale:Object;
            var i:int;
            var j:int;
            var k:int;
            var l:int;
            var locale:String;
            var plocale:LocaleID;
            var appLocales:* = mx.resources;
            var systemPreferences:* = mx.resources;
            var ultimateFallbackLocale:* = mx.resources;
            var addAll:* = mx.resources;
            var promote:* = function (C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as:String) : void
            {
                if (typeof(hasLocale[C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as]) != "undefined")
                {
                    result.push(appLocales[hasLocale[C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as]]);
                    delete hasLocale[C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as];
                }
                return;
            }// end function
            ;
            result;
            hasLocale;
            var locales:* = trimAndNormalize(appLocales);
            var preferenceLocales:* = trimAndNormalize(systemPreferences);
            addUltimateFallbackLocale(preferenceLocales, ultimateFallbackLocale);
            j;
            while (j < locales.length)
            {
                
                hasLocale[locales[j]] = j;
                j = (j + 1);
            }
            i;
            l = preferenceLocales.length;
            while (i < l)
            {
                
                plocale = LocaleID.fromString(preferenceLocales[i]);
                LocaleSorter.promote(preferenceLocales[i]);
                LocaleSorter.promote(plocale.toString());
                while (plocale.transformToParent())
                {
                    
                    LocaleSorter.promote(plocale.toString());
                }
                plocale = LocaleID.fromString(preferenceLocales[i]);
                j;
                while (j < l)
                {
                    
                    locale = preferenceLocales[j];
                    if (plocale.isSiblingOf(LocaleID.fromString(locale)))
                    {
                        LocaleSorter.promote(locale);
                    }
                    j = (j + 1);
                }
                j;
                k = locales.length;
                while (j < k)
                {
                    
                    locale = locales[j];
                    if (plocale.isSiblingOf(LocaleID.fromString(locale)))
                    {
                        LocaleSorter.promote(locale);
                    }
                    j = (j + 1);
                }
                i = (i + 1);
            }
            if (addAll)
            {
                j;
                k = locales.length;
                while (j < k)
                {
                    
                    LocaleSorter.promote(locales[j]);
                    j = (j + 1);
                }
            }
            return result;
        }// end function

        private static function addUltimateFallbackLocale(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as:Array, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as:String) : void
        {
            var _loc_3:String = null;
            if (C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as != null && C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as != "")
            {
                _loc_3 = normalizeLocale(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as);
                if (C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as.indexOf(_loc_3) == -1)
                {
                    C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\resources;LocaleSorter.as.push(_loc_3);
                }
            }
            return;
        }// end function

        private static function trimAndNormalize(mx.resources:Array) : Array
        {
            var _loc_2:Array = [];
            var _loc_3:int = 0;
            while (_loc_3 < mx.resources.length)
            {
                
                _loc_2.push(normalizeLocale(mx.resources[_loc_3]));
                _loc_3++;
            }
            return _loc_2;
        }// end function

    }
}
