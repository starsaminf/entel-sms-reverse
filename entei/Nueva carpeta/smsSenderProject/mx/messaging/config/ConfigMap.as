package mx.messaging.config
{
    import flash.utils.*;

    dynamic public class ConfigMap extends Proxy
    {
        private var _item:Object;
        var propertyList:Array;

        public function ConfigMap(param1:Object = null)
        {
            if (!param1)
            {
                param1 = {};
            }
            _item = param1;
            propertyList = [];
            return;
        }// end function

        override function deleteProperty(http://www.adobe.com/2006/actionscript/flash/objectproxy) : Boolean
        {
            var _loc_2:* = _item[http://www.adobe.com/2006/actionscript/flash/objectproxy];
            var _loc_3:* = delete _item[http://www.adobe.com/2006/actionscript/flash/objectproxy];
            var _loc_4:int = -1;
            var _loc_5:int = 0;
            while (_loc_5 < propertyList.length)
            {
                
                if (propertyList[_loc_5] == http://www.adobe.com/2006/actionscript/flash/objectproxy)
                {
                    _loc_4 = _loc_5;
                    break;
                }
                _loc_5++;
            }
            if (_loc_4 > -1)
            {
                propertyList.splice(_loc_4, 1);
            }
            return _loc_3;
        }// end function

        override function nextName(mx.messaging.config:ConfigMap/ConfigMap:int) : String
        {
            return propertyList[(mx.messaging.config:ConfigMap/ConfigMap - 1)];
        }// end function

        override function getProperty(param1)
        {
            var _loc_2:Object = null;
            _loc_2 = _item[param1];
            return _loc_2;
        }// end function

        override function hasProperty(http://www.adobe.com/2006/actionscript/flash/objectproxy) : Boolean
        {
            return http://www.adobe.com/2006/actionscript/flash/objectproxy in _item;
        }// end function

        override function nextNameIndex(name:int) : int
        {
            if (name < propertyList.length)
            {
                return (name + 1);
            }
            return 0;
        }// end function

        override function setProperty(ConfigMap.as$81, ConfigMap.as$81) : void
        {
            var _loc_4:int = 0;
            var _loc_3:* = _item[ConfigMap.as$81];
            if (_loc_3 !== ConfigMap.as$81)
            {
                _item[ConfigMap.as$81] = ConfigMap.as$81;
                _loc_4 = 0;
                while (_loc_4 < propertyList.length)
                {
                    
                    if (propertyList[_loc_4] == ConfigMap.as$81)
                    {
                        return;
                    }
                    _loc_4++;
                }
                propertyList.push(ConfigMap.as$81);
            }
            return;
        }// end function

        override function callProperty(param1, ... args)
        {
            return _item[param1].apply(_item, args);
        }// end function

        override function nextValue(param1:int)
        {
            return _item[propertyList[(param1 - 1)]];
        }// end function

    }
}
