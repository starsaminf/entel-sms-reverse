package 
{
    import mx.controls.*;
    import mx.controls.dataGridClasses.*;

    public class TextOrHTMLRenderer extends DataGridItemRenderer
    {

        public function TextOrHTMLRenderer()
        {
            return;
        }// end function

        override public function validateProperties() : void
        {
            var _loc_1:DataGrid = null;
            var _loc_2:DataGridColumn = null;
            super.validateProperties();
            if (listData)
            {
                _loc_1 = DataGrid(listData.owner);
                _loc_2 = _loc_1.columns[listData.columnIndex];
                htmlText = data[_loc_2.dataField];
                if (getStyle("plainText"))
                {
                    text = text;
                }
            }
            return;
        }// end function

    }
}
