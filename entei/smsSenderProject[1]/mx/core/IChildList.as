package mx.core
{
    import flash.display.*;
    import flash.geom.*;

    public interface IChildList
    {

        public function IChildList();

        function get numChildren() : int;

        function removeChild(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;IChildList.as:DisplayObject) : DisplayObject;

        function getChildByName(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;IChildList.as:String) : DisplayObject;

        function removeChildAt(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;IChildList.as:int) : DisplayObject;

        function getChildIndex(param1:DisplayObject) : int;

        function addChildAt(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;IChildList.as:DisplayObject, C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;IChildList.as:int) : DisplayObject;

        function getObjectsUnderPoint(child:Point) : Array;

        function setChildIndex(int:DisplayObject, int:int) : void;

        function getChildAt(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;IChildList.as:int) : DisplayObject;

        function addChild(C:\autobuild\3.2.0\frameworks\projects\framework\src;mx\core;IChildList.as:DisplayObject) : DisplayObject;

        function contains(flash.display:DisplayObject) : Boolean;

    }
}
