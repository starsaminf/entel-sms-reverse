package mx.styles
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.managers.*;

    public class CSSStyleDeclaration extends EventDispatcher
    {
        var effects:Array;
        protected var overrides:Object;
        public var defaultFactory:Function;
        public var factory:Function;
        var selectorRefCount:int = 0;
        private var styleManager:IStyleManager2;
        private var clones:Dictionary;
        static const VERSION:String = "3.2.0.3958";
        private static const NOT_A_COLOR:uint = 4.29497e+009;
        private static const FILTERMAP_PROP:String = "__reserved__filterMap";

        public function CSSStyleDeclaration(param1:String = null)
        {
            clones = new Dictionary(true);
            if (param1)
            {
                styleManager = Singleton.getInstance("mx.styles::IStyleManager2") as IStyleManager2;
                styleManager.setStyleDeclaration(param1, this, false);
            }
            return;
        }// end function

        function addStyleToProtoChain(getInstance:Object, getInstance:DisplayObject, getInstance:Object = null) : Object
        {
            var p:String;
            var emptyObjectFactory:Function;
            var filteredChain:Object;
            var filterObjectFactory:Function;
            var i:String;
            var chain:* = getInstance;
            var target:* = getInstance;
            var filterMap:* = getInstance;
            var nodeAddedToChain:Boolean;
            var originalChain:* = chain;
            if (filterMap)
            {
                chain;
            }
            if (defaultFactory != null)
            {
                defaultFactory.prototype = chain;
                chain = new defaultFactory();
                nodeAddedToChain;
            }
            if (factory != null)
            {
                factory.prototype = chain;
                chain = new factory();
                nodeAddedToChain;
            }
            if (overrides)
            {
                if (defaultFactory == null && factory == null)
                {
                    emptyObjectFactory = function () : void
            {
                return;
            }// end function
            ;
                    emptyObjectFactory.prototype = chain;
                    chain = new emptyObjectFactory;
                    nodeAddedToChain;
                }
                var _loc_5:int = 0;
                var _loc_6:* = overrides;
                while (_loc_6 in _loc_5)
                {
                    
                    p = _loc_6[_loc_5];
                    if (overrides[p] === undefined)
                    {
                        delete chain[p];
                        continue;
                    }
                    chain[p] = overrides[p];
                }
            }
            if (filterMap)
            {
                if (nodeAddedToChain)
                {
                    filteredChain;
                    filterObjectFactory = function () : void
            {
                return;
            }// end function
            ;
                    filterObjectFactory.prototype = originalChain;
                    filteredChain = new filterObjectFactory;
                    var _loc_5:int = 0;
                    var _loc_6:* = chain;
                    while (_loc_6 in _loc_5)
                    {
                        
                        i = _loc_6[_loc_5];
                        if (filterMap[i] != null)
                        {
                            filteredChain[filterMap[i]] = chain[i];
                        }
                    }
                    chain = filteredChain;
                    chain[FILTERMAP_PROP] = filterMap;
                }
                else
                {
                    chain = originalChain;
                }
            }
            if (nodeAddedToChain)
            {
                clones[chain] = 1;
            }
            return chain;
        }// end function

        public function getStyle(param1:String)
        {
            var _loc_2:* = undefined;
            var _loc_3:* = undefined;
            if (overrides)
            {
                if (param1 in overrides && overrides[param1] === undefined)
                {
                    return undefined;
                }
                _loc_3 = overrides[param1];
                if (_loc_3 !== undefined)
                {
                    return _loc_3;
                }
            }
            if (factory != null)
            {
                factory.prototype = {};
                _loc_2 = new factory();
                _loc_3 = _loc_2[param1];
                if (_loc_3 !== undefined)
                {
                    return _loc_3;
                }
            }
            if (defaultFactory != null)
            {
                defaultFactory.prototype = {};
                _loc_2 = new defaultFactory();
                _loc_3 = _loc_2[param1];
                if (_loc_3 !== undefined)
                {
                    return _loc_3;
                }
            }
            return undefined;
        }// end function

        public function clearStyle(overrides:String) : void
        {
            setStyle(overrides, undefined);
            return;
        }// end function

        public function setStyle(overrides:String, overrides) : void
        {
            var _loc_7:int = 0;
            var _loc_8:Object = null;
            var _loc_3:* = getStyle(overrides);
            var _loc_4:Boolean = false;
            if (selectorRefCount > 0 && factory == null && defaultFactory == null && !overrides && _loc_3 !== overrides)
            {
                _loc_4 = true;
            }
            if (overrides !== undefined)
            {
                setStyle(overrides, overrides);
            }
            else
            {
                if (overrides == _loc_3)
                {
                    return;
                }
                setStyle(overrides, overrides);
            }
            var _loc_5:* = SystemManagerGlobals.topLevelSystemManagers;
            var _loc_6:* = _loc_5.length;
            if (_loc_4)
            {
                _loc_7 = 0;
                while (_loc_7 < _loc_6)
                {
                    
                    _loc_8 = _loc_5[_loc_7];
                    _loc_8.regenerateStyleCache(true);
                    _loc_7++;
                }
            }
            _loc_7 = 0;
            while (_loc_7 < _loc_6)
            {
                
                _loc_8 = _loc_5[_loc_7];
                _loc_8.notifyStyleChangeInChildren(overrides, true);
                _loc_7++;
            }
            return;
        }// end function

        private function clearStyleAttr(overrides:String) : void
        {
            var _loc_2:* = undefined;
            if (!overrides)
            {
                overrides = {};
            }
            overrides[overrides] = undefined;
            for (_loc_2 in clones)
            {
                
                delete _loc_2[overrides];
            }
            return;
        }// end function

        function createProtoChainRoot() : Object
        {
            var _loc_1:Object = {};
            if (defaultFactory != null)
            {
                defaultFactory.prototype = _loc_1;
                _loc_1 = new defaultFactory();
            }
            if (factory != null)
            {
                factory.prototype = _loc_1;
                _loc_1 = new factory();
            }
            clones[_loc_1] = 1;
            return _loc_1;
        }// end function

        function clearOverride(overrides:String) : void
        {
            if (overrides && overrides[overrides])
            {
                delete overrides[overrides];
            }
            return;
        }// end function

        function setStyle(overrides:String, overrides) : void
        {
            var _loc_3:Object = null;
            var _loc_4:* = undefined;
            var _loc_5:Number = NaN;
            var _loc_6:Object = null;
            if (overrides === undefined)
            {
                clearStyleAttr(overrides);
                return;
            }
            if (overrides is String)
            {
                if (!styleManager)
                {
                    styleManager = Singleton.getInstance("mx.styles::IStyleManager2") as IStyleManager2;
                }
                _loc_5 = styleManager.getColorName(overrides);
                if (_loc_5 != NOT_A_COLOR)
                {
                    overrides = _loc_5;
                }
            }
            if (defaultFactory != null)
            {
                _loc_3 = new defaultFactory();
                if (_loc_3[overrides] !== overrides)
                {
                    if (!overrides)
                    {
                        overrides = {};
                    }
                    overrides[overrides] = overrides;
                }
                else if (overrides)
                {
                    delete overrides[overrides];
                }
            }
            if (factory != null)
            {
                _loc_3 = new factory();
                if (_loc_3[overrides] !== overrides)
                {
                    if (!overrides)
                    {
                        overrides = {};
                    }
                    overrides[overrides] = overrides;
                }
                else if (overrides)
                {
                    delete overrides[overrides];
                }
            }
            if (defaultFactory == null && factory == null)
            {
                if (!overrides)
                {
                    overrides = {};
                }
                overrides[overrides] = overrides;
            }
            for (_loc_4 in clones)
            {
                
                _loc_6 = _loc_4[FILTERMAP_PROP];
                if (_loc_6)
                {
                    if (_loc_6[overrides] != null)
                    {
                        _loc_4[_loc_6[overrides]] = overrides;
                    }
                    continue;
                }
                _loc_4[overrides] = overrides;
            }
            return;
        }// end function

    }
}
