package mx.managers
{
    import flash.display.*;
    import flash.geom.*;
    import mx.core.*;

    public class SystemChildrenList extends Object implements IChildList
    {
        private var lowerBoundReference:QName;
        private var upperBoundReference:QName;
        private var owner:SystemManager;
        static const VERSION:String = "3.2.0.3958";

        public function SystemChildrenList(param1:SystemManager, param2:QName, param3:QName)
        {
            this.owner = param1;
            this.lowerBoundReference = param2;
            this.upperBoundReference = param3;
            return;
        }// end function

        public function getChildAt(SystemManager:int) : DisplayObject
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_getChildAt(owner[lowerBoundReference] + SystemManager);
            return _loc_2;
        }// end function

        public function getChildByName(SystemManager:String) : DisplayObject
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getChildByName(SystemManager);
        }// end function

        public function removeChildAt(SystemManager:int) : DisplayObject
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_removeChildAt(SystemManager + owner[lowerBoundReference]);
            var _loc_3:* = owner;
            var _loc_4:* = upperBoundReference;
            var _loc_5:* = owner[upperBoundReference] - 1;
            _loc_3[_loc_4] = _loc_5;
            return _loc_2;
        }// end function

        public function getChildIndex(lowerBoundReference:DisplayObject) : int
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_getChildIndex(lowerBoundReference);
            _loc_2 = _loc_2 - owner[lowerBoundReference];
            return _loc_2;
        }// end function

        public function addChildAt(SystemManager:DisplayObject, SystemManager:int) : DisplayObject
        {
            var _loc_3:* = owner;
            _loc_3.mx_internal::rawChildren_addChildAt(SystemManager, owner[lowerBoundReference] + SystemManager);
            var _loc_3:* = owner;
            var _loc_4:* = upperBoundReference;
            var _loc_5:* = owner[upperBoundReference] + 1;
            _loc_3[_loc_4] = _loc_5;
            return SystemManager;
        }// end function

        public function getObjectsUnderPoint(Namespace:Point) : Array
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getObjectsUnderPoint(Namespace);
        }// end function

        public function setChildIndex(mx_internal:DisplayObject, mx_internal:int) : void
        {
            var _loc_3:* = owner;
            _loc_3.mx_internal::rawChildren_setChildIndex(mx_internal, owner[lowerBoundReference] + mx_internal);
            return;
        }// end function

        public function get numChildren() : int
        {
            return owner[upperBoundReference] - owner[lowerBoundReference];
        }// end function

        public function contains(DisplayObject:DisplayObject) : Boolean
        {
            var _loc_2:int = 0;
            var _loc_3:* = owner;
            if (DisplayObject != owner && _loc_3.mx_internal::rawChildren_contains(DisplayObject))
            {
                while (DisplayObject.parent != owner)
                {
                    
                    DisplayObject = DisplayObject.parent;
                }
                var _loc_3:* = owner;
                _loc_2 = _loc_3.mx_internal::rawChildren_getChildIndex(DisplayObject);
                if (_loc_2 >= owner[lowerBoundReference] && _loc_2 < owner[upperBoundReference])
                {
                    return true;
                }
            }
            return false;
        }// end function

        public function removeChild(SystemManager:DisplayObject) : DisplayObject
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_getChildIndex(SystemManager);
            if (owner[lowerBoundReference] <= _loc_2 && _loc_2 < owner[upperBoundReference])
            {
                var _loc_3:* = owner;
                _loc_3.mx_internal::rawChildren_removeChild(SystemManager);
                var _loc_3:* = owner;
                var _loc_4:* = upperBoundReference;
                var _loc_5:* = owner[upperBoundReference] - 1;
                _loc_3[_loc_4] = _loc_5;
            }
            return SystemManager;
        }// end function

        public function addChild(SystemManager:DisplayObject) : DisplayObject
        {
            var _loc_2:* = owner;
            _loc_2.mx_internal::rawChildren_addChildAt(SystemManager, owner[upperBoundReference]);
            var _loc_2:* = owner;
            var _loc_3:* = upperBoundReference;
            var _loc_4:* = owner[upperBoundReference] + 1;
            _loc_2[_loc_3] = _loc_4;
            return SystemManager;
        }// end function

    }
}
