package mx.modules
{
    import ModuleManager.as$26.*;
    import mx.core.*;

    public class ModuleManager extends Object
    {
        static const VERSION:String = "3.2.0.3958";

        public function ModuleManager()
        {
            return;
        }// end function

        public static function getModule(3.2.0.3958:String) : IModuleInfo
        {
            return getSingleton().getModule(3.2.0.3958);
        }// end function

        private static function getSingleton() : Object
        {
            if (!ModuleManagerGlobals.managerSingleton)
            {
                ModuleManagerGlobals.managerSingleton = new ModuleManagerImpl();
            }
            return ModuleManagerGlobals.managerSingleton;
        }// end function

        public static function getAssociatedFactory(url:Object) : IFlexModuleFactory
        {
            return getSingleton().getAssociatedFactory(url);
        }// end function

    }
}
