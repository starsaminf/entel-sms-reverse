package mx.messaging.channels
{
    import NetConnectionChannel.as$146.*;
    import flash.events.*;
    import flash.net.*;
    import mx.logging.*;
    import mx.messaging.*;
    import mx.messaging.events.*;
    import mx.messaging.messages.*;

    public class NetConnectionChannel extends PollingChannel
    {
        var _appendToURL:String;
        protected var _nc:NetConnection;

        public function NetConnectionChannel(param1:String = null, param2:String = null)
        {
            super(param1, param2);
            _nc = new NetConnection();
            _nc.objectEncoding = ObjectEncoding.AMF3;
            _nc.client = this;
            return;
        }// end function

        public function AppendToGatewayUrl(client:String) : void
        {
            if (client != null && client != "" && client != _appendToURL)
            {
                if (Log.isDebug())
                {
                    _log.debug("\'{0}\' channel will disconnect and reconnect with with its session identifier \'{1}\' appended to its endpoint url \n", id, client);
                }
                _appendToURL = client;
            }
            return;
        }// end function

        public function receive(client:IMessage, ... args) : void
        {
            args = new activation;
            var mpiutil:MessagePerformanceUtils;
            var msg:* = client;
            var rest:* = args;
            if (Log.isDebug())
            {
                _log.debug("\'{0}\' channel got message\n{1}\n", id, toString());
                if (this.mpiEnabled)
                {
                    try
                    {
                        mpiutil = new MessagePerformanceUtils();
                        _log.debug(prettyPrint());
                    }
                    catch (e:Error)
                    {
                        _log.debug("Could not get message performance information for: " + e.toString());
                    }
                }
            }
            dispatchEvent(MessageEvent.createEvent(MessageEvent.MESSAGE, ));
            return;
        }// end function

        override protected function internalSend(client:MessageResponder) : void
        {
            var _loc_3:MessagePerformanceInfo = null;
            var _loc_4:IMessage = null;
            setFlexClientIdOnMessage(client.message);
            if (mpiEnabled)
            {
                _loc_3 = new MessagePerformanceInfo();
                if (recordMessageTimes)
                {
                    _loc_3.sendTime = new Date().getTime();
                }
                client.message.headers[MessagePerformanceUtils.MPI_HEADER_IN] = _loc_3;
            }
            var _loc_2:* = client.message;
            if (useSmallMessages && _loc_2 is ISmallMessage)
            {
                _loc_4 = ISmallMessage(_loc_2).getSmallMessage();
                if (_loc_4 != null)
                {
                    _loc_2 = _loc_4;
                }
            }
            _nc.call(null, client, _loc_2);
            return;
        }// end function

        override protected function getDefaultMessageResponder(mx.messaging.channels:NetConnectionChannel/netConnection/get:MessageAgent, mx.messaging.channels:NetConnectionChannel/netConnection/get:IMessage) : MessageResponder
        {
            return new NetConnectionMessageResponder(mx.messaging.channels:NetConnectionChannel/netConnection/get, mx.messaging.channels:NetConnectionChannel/netConnection/get, this);
        }// end function

        protected function securityErrorHandler(event:SecurityErrorEvent) : void
        {
            defaultErrorHandler("Channel.Security.Error", event);
            return;
        }// end function

        private function defaultErrorHandler(client:String, client:ErrorEvent) : void
        {
            var _loc_3:* = ChannelFaultEvent.createEvent(this, false, client, "error", client.text + " url: \'" + endpoint + "\'");
            _loc_3.rootCause = client;
            if (_connecting)
            {
                connectFailed(_loc_3);
            }
            else
            {
                dispatchEvent(_loc_3);
            }
            return;
        }// end function

        override protected function getPollSyncMessageResponder(mx.messaging.channels:NetConnectionChannel/netConnection/get:MessageAgent, mx.messaging.channels:NetConnectionChannel/netConnection/get:CommandMessage) : MessageResponder
        {
            return new PollSyncMessageResponder(mx.messaging.channels:NetConnectionChannel/netConnection/get, mx.messaging.channels:NetConnectionChannel/netConnection/get, this);
        }// end function

        override public function get useSmallMessages() : Boolean
        {
            return super.useSmallMessages && _nc != null && _nc.objectEncoding >= ObjectEncoding.AMF3;
        }// end function

        override protected function internalConnect() : void
        {
            var url:String;
            var i:int;
            var temp:String;
            var j:int;
            super.internalConnect();
            url = endpoint;
            if (_appendToURL != null)
            {
                i = url.indexOf("wsrp-url=");
                if (i != -1)
                {
                    temp = url.substr(i + 9, url.length);
                    j = temp.indexOf("&");
                    if (j != -1)
                    {
                        temp = temp.substr(0, j);
                    }
                    url = url.replace(temp, temp + _appendToURL);
                }
                else
                {
                    url = url + _appendToURL;
                }
            }
            if (_nc.uri != null && _nc.uri.length > 0 && _nc.connected)
            {
                _nc.removeEventListener(NetStatusEvent.NET_STATUS, statusHandler);
                _nc.close();
            }
            _nc.addEventListener(NetStatusEvent.NET_STATUS, statusHandler);
            _nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            _nc.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            _nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
            try
            {
                _nc.connect(url);
            }
            catch (e:Error)
            {
                e.message = e.message + ("  url: \'" + url + "\'");
                throw e;
            }
            return;
        }// end function

        protected function ioErrorHandler(event:IOErrorEvent) : void
        {
            defaultErrorHandler("Channel.IO.Error", event);
            return;
        }// end function

        protected function statusHandler(event:NetStatusEvent) : void
        {
            return;
        }// end function

        override protected function internalDisconnect(client:Boolean = false) : void
        {
            super.internalDisconnect(client);
            shutdownNetConnection();
            disconnectSuccess(client);
            return;
        }// end function

        override protected function connectTimeoutHandler(event:TimerEvent) : void
        {
            shutdownNetConnection();
            super.connectTimeoutHandler(event);
            return;
        }// end function

        public function get netConnection() : NetConnection
        {
            return _nc;
        }// end function

        protected function shutdownNetConnection() : void
        {
            _nc.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            _nc.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            _nc.removeEventListener(NetStatusEvent.NET_STATUS, statusHandler);
            _nc.removeEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
            _nc.close();
            return;
        }// end function

        protected function asyncErrorHandler(event:AsyncErrorEvent) : void
        {
            defaultErrorHandler("Channel.Async.Error", event);
            return;
        }// end function

    }
}
