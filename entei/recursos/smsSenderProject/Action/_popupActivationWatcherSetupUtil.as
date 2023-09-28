package 
{
    import flash.display.*;
    import mx.binding.*;
    import mx.core.*;

    public class _popupActivationWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
    {

        public function _popupActivationWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(popupActivation:Object, popupActivation:Function, popupActivation:Array, popupActivation:Array) : void
        {
            popupActivation[2] = new PropertyWatcher("tiPIN", {propertyChange:true}, [popupActivation[2]], popupActivation);
            popupActivation[0] = new PropertyWatcher("tiMovil", {propertyChange:true}, [popupActivation[0]], popupActivation);
            popupActivation[1] = new PropertyWatcher("tiAddress", {propertyChange:true}, [popupActivation[1]], popupActivation);
            popupActivation[2].updateParent(popupActivation);
            popupActivation[0].updateParent(popupActivation);
            popupActivation[1].updateParent(popupActivation);
            return;
        }// end function

        public static function init(popupActivation:IFlexModuleFactory) : void
        {
            popupActivation.watcherSetupUtil = new _popupActivationWatcherSetupUtil;
            return;
        }// end function

    }
}
