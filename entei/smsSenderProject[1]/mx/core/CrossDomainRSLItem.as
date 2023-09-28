package mx.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.events.*;
    import mx.utils.*;

    public class CrossDomainRSLItem extends RSLItem
    {
        private var urlIndex:int = 0;
        private var digests:Array;
        private var hashTypes:Array;
        private var isSigned:Array;
        private var rslUrls:Array;
        private var policyFileUrls:Array;
        static const VERSION:String = "3.2.0.3958";

        public function CrossDomainRSLItem(param1:Array, param2:Array, param3:Array, param4:Array, param5:Array, param6:String = null)
        {
            super(param1[0], param6);
            this.rslUrls = param1;
            this.policyFileUrls = param2;
            this.digests = param3;
            this.hashTypes = param4;
            this.isSigned = param5;
            return;
        }// end function

        override public function itemCompleteHandler(event:Event) : void
        {
            completeCdRslLoad(event.target as URLLoader);
            return;
        }// end function

        private function loadBytesCompleteHandler(event:Event) : void
        {
            super.itemCompleteHandler(event);
            return;
        }// end function

        override public function load(COMPLETE:Function, COMPLETE:Function, COMPLETE:Function, COMPLETE:Function, COMPLETE:Function) : void
        {
            var _loc_7:ErrorEvent = null;
            chainedProgressHandler = COMPLETE;
            chainedCompleteHandler = COMPLETE;
            chainedIOErrorHandler = COMPLETE;
            chainedSecurityErrorHandler = COMPLETE;
            chainedRSLErrorHandler = COMPLETE;
            urlRequest = new URLRequest(LoaderUtil.createAbsoluteURL(rootURL, rslUrls[urlIndex]));
            var _loc_6:* = new URLLoader();
            _loc_6.dataFormat = URLLoaderDataFormat.BINARY;
            _loc_6.addEventListener(ProgressEvent.PROGRESS, itemProgressHandler);
            _loc_6.addEventListener(Event.COMPLETE, itemCompleteHandler);
            _loc_6.addEventListener(IOErrorEvent.IO_ERROR, itemErrorHandler);
            _loc_6.addEventListener(SecurityErrorEvent.SECURITY_ERROR, itemErrorHandler);
            if (policyFileUrls.length > urlIndex && policyFileUrls[urlIndex] != "")
            {
                Security.loadPolicyFile(policyFileUrls[urlIndex]);
            }
            if (isSigned[urlIndex])
            {
                if (urlRequest.hasOwnProperty("digest"))
                {
                    urlRequest.digest = digests[urlIndex];
                }
                else
                {
                    if (hasFailover())
                    {
                        loadFailover();
                        return;
                    }
                    _loc_7 = new ErrorEvent(RSLEvent.RSL_ERROR);
                    _loc_7.text = "Flex Error #1002: Flash Player 9.0.115 and above is required to support signed RSLs. Problem occurred when trying to load the RSL " + urlRequest.url + ".  Upgrade your Flash Player and try again.";
                    super.itemErrorHandler(_loc_7);
                    return;
                }
            }
            _loc_6.load(urlRequest);
            return;
        }// end function

        private function completeCdRslLoad(mx.events:URLLoader) : Boolean
        {
            var _loc_4:Boolean = false;
            var _loc_5:String = null;
            var _loc_6:Boolean = false;
            var _loc_7:ErrorEvent = null;
            if (mx.events == null || mx.events.data == null || ByteArray(mx.events.data).bytesAvailable == 0)
            {
                return true;
            }
            var _loc_2:* = new Loader();
            var _loc_3:* = new LoaderContext();
            _loc_3.applicationDomain = ApplicationDomain.currentDomain;
            _loc_3.securityDomain = null;
            if ("allowLoadBytesCodeExecution" in _loc_3)
            {
                _loc_3["allowLoadBytesCodeExecution"] = true;
            }
            if (digests[urlIndex] != null && String(digests[urlIndex]).length > 0)
            {
                _loc_4 = false;
                if (!isSigned[urlIndex])
                {
                    if (hashTypes[urlIndex] == SHA256.TYPE_ID)
                    {
                        _loc_5 = null;
                        if (mx.events.data != null)
                        {
                            _loc_5 = SHA256.computeDigest(mx.events.data);
                        }
                        if (_loc_5 == digests[urlIndex])
                        {
                            _loc_4 = true;
                        }
                    }
                }
                else
                {
                    _loc_4 = true;
                }
                if (!_loc_4)
                {
                    _loc_6 = hasFailover();
                    _loc_7 = new ErrorEvent(RSLEvent.RSL_ERROR);
                    _loc_7.text = "Flex Error #1001: Digest mismatch with RSL " + urlRequest.url + ". Redeploy the matching RSL or relink your application with the matching library.";
                    itemErrorHandler(_loc_7);
                    return !_loc_6;
                }
            }
            _loc_2.contentLoaderInfo.addEventListener(Event.COMPLETE, loadBytesCompleteHandler);
            _loc_2.loadBytes(mx.events.data, _loc_3);
            return true;
        }// end function

        public function loadFailover() : void
        {
            if (urlIndex < rslUrls.length)
            {
                trace("Failed to load RSL " + rslUrls[urlIndex]);
                trace("Failing over to RSL " + rslUrls[(urlIndex + 1)]);
                var _loc_2:* = urlIndex + 1;
                urlIndex = _loc_2;
                url = rslUrls[urlIndex];
                load(chainedProgressHandler, chainedCompleteHandler, chainedIOErrorHandler, chainedSecurityErrorHandler, chainedRSLErrorHandler);
            }
            return;
        }// end function

        public function hasFailover() : Boolean
        {
            return rslUrls.length > (urlIndex + 1);
        }// end function

        override public function itemErrorHandler(event:ErrorEvent) : void
        {
            if (hasFailover())
            {
                trace(decodeURI(event.text));
                loadFailover();
            }
            else
            {
                super.itemErrorHandler(event);
            }
            return;
        }// end function

    }
}
