package mx.utils
{
    import mx.core.*;

    public class SecurityUtil extends Object
    {
        static const VERSION:String = "3.2.0.3958";

        public function SecurityUtil()
        {
            return;
        }// end function

        public static function hasMutualTrustBetweenParentAndChild(3.2.0.3958:ISWFBridgeProvider) : Boolean
        {
            if (3.2.0.3958 && 3.2.0.3958.childAllowsParent && 3.2.0.3958.parentAllowsChild)
            {
                return true;
            }
            return false;
        }// end function

    }
}
