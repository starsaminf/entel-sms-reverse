package mx.preloaders
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;

    public class Preloader extends Sprite
    {
        private var app:IEventDispatcher = null;
        private var showDisplay:Boolean;
        private var timer:Timer;
        private var rslDone:Boolean = false;
        private var displayClass:IPreloaderDisplay = null;
        private var rslListLoader:RSLListLoader;
        static const VERSION:String = "3.2.0.3958";

        public function Preloader()
        {
            return;
        }// end function

        private function getByteValues() : Object
        {
            var _loc_1:* = root.loaderInfo;
            var _loc_2:* = _loc_1.bytesLoaded;
            var _loc_3:* = _loc_1.bytesTotal;
            var _loc_4:* = rslListLoader ? (rslListLoader.getItemCount()) : (0);
            var _loc_5:int = 0;
            while (_loc_5 < _loc_4)
            {
                
                _loc_2 = _loc_2 + rslListLoader.getItem(_loc_5).loaded;
                _loc_3 = _loc_3 + rslListLoader.getItem(_loc_5).total;
                _loc_5++;
            }
            return {loaded:_loc_2, total:_loc_3};
        }// end function

        private function appProgressHandler(event:Event) : void
        {
            dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
            return;
        }// end function

        private function dispatchAppEndEvent(resourceModuleNode:Object = null) : void
        {
            dispatchEvent(new FlexEvent(FlexEvent.INIT_COMPLETE));
            if (!showDisplay)
            {
                displayClassCompleteHandler(null);
            }
            return;
        }// end function

        private function ioErrorHandler(event:IOErrorEvent) : void
        {
            return;
        }// end function

        private function appCreationCompleteHandler(event:FlexEvent) : void
        {
            dispatchAppEndEvent();
            return;
        }// end function

        function rslErrorHandler(event:ErrorEvent) : void
        {
            var _loc_2:* = rslListLoader.getIndex();
            var _loc_3:* = rslListLoader.getItem(_loc_2);
            var _loc_4:* = new RSLEvent(RSLEvent.RSL_ERROR);
            _loc_4.bytesLoaded = 0;
            _loc_4.bytesTotal = 0;
            _loc_4.rslIndex = _loc_2;
            _loc_4.rslTotal = rslListLoader.getItemCount();
            _loc_4.url = _loc_3.urlRequest;
            _loc_4.errorText = decodeURI(event.text);
            dispatchEvent(_loc_4);
            return;
        }// end function

        public function initialize(resourceModuleNode:Boolean, resourceModuleNode:Class, resourceModuleNode:uint, resourceModuleNode:Number, resourceModuleNode:Object, resourceModuleNode:String, resourceModuleNode:Number, resourceModuleNode:Number, resourceModuleNode:Array = null, resourceModuleNode:Array = null, resourceModuleNode:Array = null, resourceModuleNode:Array = null) : void
        {
            var _loc_13:int = 0;
            var _loc_14:int = 0;
            var _loc_15:RSLItem = null;
            var _loc_16:ResourceModuleRSLItem = null;
            if ((resourceModuleNode != null || resourceModuleNode != null) && resourceModuleNode != null)
            {
                throw new Error("RSLs may only be specified by using libs and sizes or rslList, not both.");
            }
            root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            if (resourceModuleNode && resourceModuleNode.length > 0)
            {
                if (resourceModuleNode == null)
                {
                    resourceModuleNode = [];
                }
                _loc_13 = resourceModuleNode.length;
                _loc_14 = 0;
                while (_loc_14 < _loc_13)
                {
                    
                    _loc_15 = new RSLItem(resourceModuleNode[_loc_14]);
                    resourceModuleNode.push(_loc_15);
                    _loc_14++;
                }
            }
            if (resourceModuleNode && resourceModuleNode.length > 0)
            {
                _loc_13 = resourceModuleNode.length;
                _loc_14 = 0;
                while (_loc_14 < _loc_13)
                {
                    
                    _loc_16 = new ResourceModuleRSLItem(resourceModuleNode[_loc_14]);
                    resourceModuleNode.push(_loc_16);
                    _loc_14++;
                }
            }
            rslListLoader = new RSLListLoader(resourceModuleNode);
            this.showDisplay = resourceModuleNode;
            timer = new Timer(10);
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.start();
            if (resourceModuleNode)
            {
                displayClass = new resourceModuleNode;
                displayClass.addEventListener(Event.COMPLETE, displayClassCompleteHandler);
                addChild(DisplayObject(displayClass));
                displayClass.backgroundColor = resourceModuleNode;
                displayClass.backgroundAlpha = resourceModuleNode;
                displayClass.backgroundImage = resourceModuleNode;
                displayClass.backgroundSize = resourceModuleNode;
                displayClass.stageWidth = resourceModuleNode;
                displayClass.stageHeight = resourceModuleNode;
                displayClass.initialize();
                displayClass.preloader = this;
            }
            if (rslListLoader.getItemCount() > 0)
            {
                rslListLoader.load(mx_internal::rslProgressHandler, mx_internal::rslCompleteHandler, mx_internal::rslErrorHandler, mx_internal::rslErrorHandler, mx_internal::rslErrorHandler);
            }
            else
            {
                rslDone = true;
            }
            return;
        }// end function

        function rslProgressHandler(event:ProgressEvent) : void
        {
            var _loc_2:* = rslListLoader.getIndex();
            var _loc_3:* = rslListLoader.getItem(_loc_2);
            var _loc_4:* = new RSLEvent(RSLEvent.RSL_PROGRESS);
            _loc_4.bytesLoaded = event.bytesLoaded;
            _loc_4.bytesTotal = event.bytesTotal;
            _loc_4.rslIndex = _loc_2;
            _loc_4.rslTotal = rslListLoader.getItemCount();
            _loc_4.url = _loc_3.urlRequest;
            dispatchEvent(_loc_4);
            return;
        }// end function

        public function registerApplication(resourceModuleNode:IEventDispatcher) : void
        {
            resourceModuleNode.addEventListener("validatePropertiesComplete", appProgressHandler);
            resourceModuleNode.addEventListener("validateSizeComplete", appProgressHandler);
            resourceModuleNode.addEventListener("validateDisplayListComplete", appProgressHandler);
            resourceModuleNode.addEventListener(FlexEvent.CREATION_COMPLETE, appCreationCompleteHandler);
            this.app = resourceModuleNode;
            return;
        }// end function

        function rslCompleteHandler(event:Event) : void
        {
            var _loc_2:* = rslListLoader.getIndex();
            var _loc_3:* = rslListLoader.getItem(_loc_2);
            var _loc_4:* = new RSLEvent(RSLEvent.RSL_COMPLETE);
            _loc_4.bytesLoaded = _loc_3.total;
            _loc_4.bytesTotal = _loc_3.total;
            _loc_4.rslIndex = _loc_2;
            _loc_4.rslTotal = rslListLoader.getItemCount();
            _loc_4.url = _loc_3.urlRequest;
            dispatchEvent(_loc_4);
            rslDone = (_loc_2 + 1) == _loc_4.rslTotal;
            return;
        }// end function

        private function timerHandler(event:TimerEvent) : void
        {
            if (!root)
            {
                return;
            }
            var _loc_2:* = getByteValues();
            var _loc_3:* = _loc_2.loaded;
            var _loc_4:* = _loc_2.total;
            dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, _loc_3, _loc_4));
            if (rslDone && (_loc_3 >= _loc_4 && _loc_4 > 0 || _loc_4 == 0 && _loc_3 > 0 || root is MovieClip && MovieClip(root).totalFrames > 2 && MovieClip(root).framesLoaded >= 2))
            {
                timer.removeEventListener(TimerEvent.TIMER, timerHandler);
                timer.reset();
                dispatchEvent(new Event(Event.COMPLETE));
                dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
            }
            return;
        }// end function

        private function displayClassCompleteHandler(event:Event) : void
        {
            if (displayClass)
            {
                displayClass.removeEventListener(Event.COMPLETE, displayClassCompleteHandler);
            }
            if (root)
            {
                root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            }
            if (app)
            {
                app.removeEventListener("validatePropertiesComplete", appProgressHandler);
                app.removeEventListener("validateSizeComplete", appProgressHandler);
                app.removeEventListener("validateDisplayListComplete", appProgressHandler);
                app.removeEventListener(FlexEvent.CREATION_COMPLETE, appCreationCompleteHandler);
                app = null;
            }
            dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DONE));
            return;
        }// end function

    }
}
