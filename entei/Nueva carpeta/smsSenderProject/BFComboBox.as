package 
{
    import BFComboBox.*;
    import mx.controls.*;
    import mx.events.*;

    public class BFComboBox extends ComboBox
    {
        private var bDataProviderSet:Boolean = false;
        private var bSelectedValueSet:Boolean = false;
        private var _dataField:String;
        private var _664267159_selectedValue:String;

        public function BFComboBox()
        {
            return;
        }// end function

        public function set dataField(param1:String) : void
        {
            _dataField = param1;
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:int = 0;
            var _loc_2:String = null;
            super.commitProperties();
            if (bSelectedValueSet && bDataProviderSet)
            {
                bSelectedValueSet = false;
                this.selectedIndex = -1;
                _loc_1 = 0;
                while (_loc_1 < this.dataProvider.length)
                {
                    
                    if (this.dataProvider[_loc_1] != null)
                    {
                        _loc_2 = this.dataProvider[_loc_1][_dataField];
                        if (_loc_2 == _selectedValue)
                        {
                            this.selectedIndex = _loc_1;
                            break;
                        }
                    }
                    _loc_1++;
                }
            }
            return;
        }// end function

        public function set selectedValue(param1:String) : void
        {
            bSelectedValueSet = true;
            _selectedValue = param1;
            invalidateProperties();
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        override public function set dataProvider(param1:Object) : void
        {
            super.dataProvider = param1;
            if (param1 != null && param1.length)
            {
                bDataProviderSet = true;
            }
            return;
        }// end function

        public function set _selectedValue(param1:String) : void
        {
            var _loc_2:* = this._664267159_selectedValue;
            if (_loc_2 !== param1)
            {
                this._664267159_selectedValue = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_selectedValue", _loc_2, param1));
            }
            return;
        }// end function

        public function get _selectedValue() : String
        {
            return this._664267159_selectedValue;
        }// end function

    }
}
