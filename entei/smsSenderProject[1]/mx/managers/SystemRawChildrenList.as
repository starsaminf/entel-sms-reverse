package mx.managers
{
    import flash.display.*;
    import flash.geom.*;
    import mx.core.*;

    public class SystemRawChildrenList extends Object implements IChildList
    {
        private var owner:SystemManager;
        static const VERSION:String = "3.2.0.3958";

        public function SystemRawChildrenList(param1:SystemManager)
        {
            this.owner = param1;
            return;
        }// end function

        public function getChildAt(mx.managers:int) : DisplayObject
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getChildAt(mx.managers);
        }// end function

        public function addChild(mx.managers:DisplayObject) : DisplayObject
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_addChild(mx.managers);
        }// end function

        public function getChildIndex(owner:DisplayObject) : int
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getChildIndex(owner);
        }// end function

        public function setChildIndex(rawChildren_getChildAt:DisplayObject, rawChildren_getChildAt:int) : void
        {
            var _loc_3:* = owner;
            _loc_3.mx_internal::rawChildren_setChildIndex(rawChildren_getChildAt, rawChildren_getChildAt);
            return;
        }// end function

        public function getChildByName(mx.managers:String) : DisplayObject
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getChildByName(mx.managers);
        }// end function

        public function removeChildAt(mx.managers:int) : DisplayObject
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_removeChildAt(mx.managers);
        }// end function

        public function get numChildren() : int
        {
            return mx_internal::$numChildren;
        }// end function

        public function addChildAt(mx.managers:DisplayObject, mx.managers:int) : DisplayObject
        {
            var _loc_3:* = owner;
            return _loc_3.mx_internal::rawChildren_addChildAt(mx.managers, mx.managers);
        }// end function

        public function getObjectsUnderPoint(flash.display:Point) : Array
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getObjectsUnderPoint(flash.display);
        }// end function

        public function contains(rawChildren_addChild:DisplayObject) : Boolean
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_contains(rawChildren_addChild);
        }// end function

        public function removeChild(mx.managers:DisplayObject) : DisplayObject
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_removeChild(mx.managers);
        }// end function

    }
}
