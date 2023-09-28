package mx.core
{
    import flash.events.*;

    public class RSLListLoader extends Object
    {
        private var chainedSecurityErrorHandler:Function;
        private var chainedIOErrorHandler:Function;
        private var rslList:Array;
        private var chainedRSLErrorHandler:Function;
        private var chainedCompleteHandler:Function;
        private var currentIndex:int = 0;
        private var chainedProgressHandler:Function;
        static const VERSION:String = "3.2.0.3958";

        public function RSLListLoader(param1:Array)
        {
            rslList = [];
            this.rslList = param1;
            return;
        }// end function

        private function loadNext() : void
        {
            if (!isDone())
            {
                var _loc_2:* = currentIndex + 1;
                currentIndex = _loc_2;
                if (currentIndex < rslList.length)
                {
                    rslList[currentIndex].load(chainedProgressHandler, listCompleteHandler, listIOErrorHandler, listSecurityErrorHandler, chainedRSLErrorHandler);
                }
            }
            return;
        }// end function

        public function getIndex() : int
        {
            return currentIndex;
        }// end function

        public function load(completeHandler:Function, completeHandler:Function, completeHandler:Function, completeHandler:Function, completeHandler:Function) : void
        {
            chainedProgressHandler = completeHandler;
            chainedCompleteHandler = completeHandler;
            chainedIOErrorHandler = completeHandler;
            chainedSecurityErrorHandler = completeHandler;
            chainedRSLErrorHandler = completeHandler;
            currentIndex = -1;
            loadNext();
            return;
        }// end function

        private function listCompleteHandler(event:Event) : void
        {
            if (chainedCompleteHandler != null)
            {
                chainedCompleteHandler(event);
            }
            loadNext();
            return;
        }// end function

        public function isDone() : Boolean
        {
            return currentIndex >= rslList.length;
        }// end function

        private function listSecurityErrorHandler(event:Event) : void
        {
            if (chainedSecurityErrorHandler != null)
            {
                chainedSecurityErrorHandler(event);
            }
            return;
        }// end function

        public function getItemCount() : int
        {
            return rslList.length;
        }// end function

        public function getItem(currentIndex:int) : RSLItem
        {
            if (currentIndex < 0 || currentIndex >= rslList.length)
            {
                return null;
            }
            return rslList[currentIndex];
        }// end function

        private function listIOErrorHandler(event:Event) : void
        {
            if (chainedIOErrorHandler != null)
            {
                chainedIOErrorHandler(event);
            }
            return;
        }// end function

    }
}
