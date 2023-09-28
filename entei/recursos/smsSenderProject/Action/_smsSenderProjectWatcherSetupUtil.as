package 
{
    import flash.display.*;
    import mx.binding.*;
    import mx.core.*;

    public class _smsSenderProjectWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
    {

        public function _smsSenderProjectWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(smsSenderProject:Object, smsSenderProject:Function, smsSenderProject:Array, smsSenderProject:Array) : void
        {
            smsSenderProject[0] = new PropertyWatcher("tiMovil", {propertyChange:true}, [smsSenderProject[0]], smsSenderProject);
            smsSenderProject[1] = new PropertyWatcher("taMessage", {propertyChange:true}, [smsSenderProject[1]], smsSenderProject);
            smsSenderProject[0].updateParent(smsSenderProject);
            smsSenderProject[1].updateParent(smsSenderProject);
            return;
        }// end function

        public static function init(smsSenderProject:IFlexModuleFactory) : void
        {
            smsSenderProject.watcherSetupUtil = new _smsSenderProjectWatcherSetupUtil;
            return;
        }// end function

    }
}
