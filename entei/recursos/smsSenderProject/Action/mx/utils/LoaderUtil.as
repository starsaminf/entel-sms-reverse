package mx.utils
{
    import flash.display.*;

    public class LoaderUtil extends Object
    {

        public function LoaderUtil()
        {
            return;
        }// end function

        public static function normalizeURL(url:LoaderInfo) : String
        {
            var _loc_2:* = url.url;
            var _loc_3:* = _loc_2.split("/[[DYNAMIC]]/");
            return _loc_3[0];
        }// end function

        public static function createAbsoluteURL(url:String, url:String) : String
        {
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_3:* = url;
            if (!(url.indexOf(":") > -1 || url.indexOf("/") == 0 || url.indexOf("\\") == 0))
            {
                if (url)
                {
                    _loc_4 = Math.max(url.lastIndexOf("\\"), url.lastIndexOf("/"));
                    if (_loc_4 <= 8)
                    {
                        url = url + "/";
                        _loc_4 = url.length - 1;
                    }
                    if (url.indexOf("./") == 0)
                    {
                        url = url.substring(2);
                    }
                    else
                    {
                        while (url.indexOf("../") == 0)
                        {
                            
                            url = url.substring(3);
                            _loc_5 = Math.max(url.lastIndexOf("\\", (_loc_4 - 1)), url.lastIndexOf("/", (_loc_4 - 1)));
                            if (_loc_5 <= 8)
                            {
                                _loc_5 = _loc_4;
                            }
                            _loc_4 = _loc_5;
                        }
                    }
                    if (_loc_4 != -1)
                    {
                        _loc_3 = url.substr(0, (_loc_4 + 1)) + url;
                    }
                }
            }
            return _loc_3;
        }// end function

    }
}
