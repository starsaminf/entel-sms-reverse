package mx.core
{
    import flash.events.*;
    import mx.events.*;
    import mx.resources.*;

    public class ResourceModuleRSLItem extends RSLItem
    {
        static const VERSION:String = "3.2.0.3958";

        public function ResourceModuleRSLItem(param1:String)
        {
            super(param1);
            return;
        }// end function

        private function resourceErrorHandler(event:ResourceEvent) : void
        {
            var _loc_2:* = new IOErrorEvent(IOErrorEvent.IO_ERROR);
            _loc_2.text = event.errorText;
            super.itemErrorHandler(_loc_2);
            return;
        }// end function

        override public function load(chainedRSLErrorHandler:Function, chainedRSLErrorHandler:Function, chainedRSLErrorHandler:Function, chainedRSLErrorHandler:Function, chainedRSLErrorHandler:Function) : void
        {
            chainedProgressHandler = chainedRSLErrorHandler;
            chainedCompleteHandler = chainedRSLErrorHandler;
            chainedIOErrorHandler = chainedRSLErrorHandler;
            chainedSecurityErrorHandler = chainedRSLErrorHandler;
            chainedRSLErrorHandler = chainedRSLErrorHandler;
            var _loc_6:* = ResourceManager.getInstance();
            var _loc_7:* = _loc_6.loadResourceModule(url);
            _loc_7.addEventListener(ResourceEvent.PROGRESS, itemProgressHandler);
            _loc_7.addEventListener(ResourceEvent.COMPLETE, itemCompleteHandler);
            _loc_7.addEventListener(ResourceEvent.ERROR, resourceErrorHandler);
            return;
        }// end function

    }
}
