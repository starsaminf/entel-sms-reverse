package 
{
    import _smsSenderProject_FlexInit.*;
    import flash.net.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.messaging.channels.*;
    import mx.messaging.config.*;
    import mx.messaging.messages.*;
    import mx.styles.*;
    import mx.utils.*;

    public class _smsSenderProject_FlexInit extends Object
    {
        private static var mx_messaging_channels_SecureAMFChannel_ref:SecureAMFChannel;
        private static var mx_messaging_channels_AMFChannel_ref:AMFChannel;

        public function _smsSenderProject_FlexInit()
        {
            return;
        }// end function

        public static function init(resizeStartEffect:IFlexModuleFactory) : void
        {
            var fbs:* = resizeStartEffect;
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("addedEffect", "added");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("completeEffect", "complete");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("creationCompleteEffect", "creationComplete");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("focusInEffect", "focusIn");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("focusOutEffect", "focusOut");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("hideEffect", "hide");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("itemsChangeEffect", "itemsChange");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("mouseDownEffect", "mouseDown");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("mouseUpEffect", "mouseUp");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("moveEffect", "move");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("removedEffect", "removed");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("resizeEffect", "resize");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("resizeEndEffect", "resizeEnd");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("resizeStartEffect", "resizeStart");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("rollOutEffect", "rollOut");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("rollOverEffect", "rollOver");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("showEffect", "show");
            try
            {
                if (getClassByAlias("flex.messaging.io.ArrayCollection") == null)
                {
                    registerClassAlias("flex.messaging.io.ArrayCollection", ArrayCollection);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.io.ArrayCollection", ArrayCollection);
                try
                {
                }
                if (getClassByAlias("flex.messaging.io.ArrayList") == null)
                {
                    registerClassAlias("flex.messaging.io.ArrayList", ArrayList);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.io.ArrayList", ArrayList);
                try
                {
                }
                if (getClassByAlias("flex.messaging.config.ConfigMap") == null)
                {
                    registerClassAlias("flex.messaging.config.ConfigMap", ConfigMap);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.config.ConfigMap", ConfigMap);
                try
                {
                }
                if (getClassByAlias("flex.messaging.messages.AcknowledgeMessage") == null)
                {
                    registerClassAlias("flex.messaging.messages.AcknowledgeMessage", AcknowledgeMessage);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.messages.AcknowledgeMessage", AcknowledgeMessage);
                try
                {
                }
                if (getClassByAlias("DSK") == null)
                {
                    registerClassAlias("DSK", AcknowledgeMessageExt);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("DSK", AcknowledgeMessageExt);
                try
                {
                }
                if (getClassByAlias("flex.messaging.messages.AsyncMessage") == null)
                {
                    registerClassAlias("flex.messaging.messages.AsyncMessage", AsyncMessage);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.messages.AsyncMessage", AsyncMessage);
                try
                {
                }
                if (getClassByAlias("DSA") == null)
                {
                    registerClassAlias("DSA", AsyncMessageExt);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("DSA", AsyncMessageExt);
                try
                {
                }
                if (getClassByAlias("flex.messaging.messages.CommandMessage") == null)
                {
                    registerClassAlias("flex.messaging.messages.CommandMessage", CommandMessage);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.messages.CommandMessage", CommandMessage);
                try
                {
                }
                if (getClassByAlias("DSC") == null)
                {
                    registerClassAlias("DSC", CommandMessageExt);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("DSC", CommandMessageExt);
                try
                {
                }
                if (getClassByAlias("flex.messaging.messages.ErrorMessage") == null)
                {
                    registerClassAlias("flex.messaging.messages.ErrorMessage", ErrorMessage);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.messages.ErrorMessage", ErrorMessage);
                try
                {
                }
                if (getClassByAlias("flex.messaging.messages.MessagePerformanceInfo") == null)
                {
                    registerClassAlias("flex.messaging.messages.MessagePerformanceInfo", MessagePerformanceInfo);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.messages.MessagePerformanceInfo", MessagePerformanceInfo);
                try
                {
                }
                if (getClassByAlias("flex.messaging.messages.RemotingMessage") == null)
                {
                    registerClassAlias("flex.messaging.messages.RemotingMessage", RemotingMessage);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.messages.RemotingMessage", RemotingMessage);
                try
                {
                }
                if (getClassByAlias("flex.messaging.io.ObjectProxy") == null)
                {
                    registerClassAlias("flex.messaging.io.ObjectProxy", ObjectProxy);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.io.ObjectProxy", ObjectProxy);
            }
            var styleNames:Array;
            var i:int;
            while (i < styleNames.length)
            {
                
                StyleManager.registerInheritingStyle(styleNames[i]);
                i = (i + 1);
            }
            ServerConfig.xml = <services>
	<service id="remoting-service">
		<destination id="dSms">
			<channels>
				<channel ref="my-amf"/>
			</channels>
		</destination>
	</service>
	<service id="proxy-service">
		<destination id="DefaultHTTP">
			<channels>
				<channel ref="my-amf"/>
			</channels>
		</destination>
	</service>
	<service id="message-service">
	</service>
	<channels>
		<channel id="my-polling-amf" type="mx.messaging.channels.AMFChannel">
			<endpoint uri="http://{server.name}:{server.port}/smsSenderProject/messagebroker/amfpolling"/>
			<properties>
				<polling-enabled>true</polling-enabled>
				<polling-interval-seconds>4</polling-interval-seconds>
			</properties>
		</channel>
		<channel id="my-amf" type="mx.messaging.channels.AMFChannel">
			<endpoint uri="http://{server.name}:{server.port}/smsSenderProject/messagebroker/amf"/>
			<properties>
			</properties>
		</channel>
		<channel id="my-secure-amf" type="mx.messaging.channels.SecureAMFChannel">
			<endpoint uri="https://{server.name}:{server.port}/smsSenderProject/messagebroker/amfsecure"/>
			<properties>
			</properties>
		</channel>
	</channels>
</services>;
            return;
        }// end function

    }
}
