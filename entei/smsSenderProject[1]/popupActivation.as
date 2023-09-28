package 
{
    import flash.events.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.collections.*;
    import mx.containers.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.rpc.events.*;
    import mx.rpc.remoting.mxml.*;
    import mx.styles.*;
    import mx.validators.*;
    import popupActivation.*;

    public class popupActivation extends TitleWindow implements IBindingClient
    {
        private var _691293789hbMovil:HBox;
        private var _1284244952varCount:int = 0;
        private var _382867521tiAddress:TextInput;
        private var _1586537375fitiMovil:FormItem;
        private var _110335712tiPIN:TextInput;
        private var _1503781265varCountry:String;
        private var _848308815fiAddress:FormItem;
        var _bindingsByDestination:Object;
        private var _265217986btnEnvioPIN:Button;
        private var _883309516fiMovil:FormItem;
        private var _1959606254strStatusUser:String = "unactivated";
        private var _1257214291fiCountry:FormItem;
        private var _746163711svtiMovil:StringValidator;
        private var _1221131950cbOccupancy:BFComboBox;
        private var _1707366588svtiAddress:StringValidator;
        private var _1566605039cbDepartment:BFComboBox;
        private var _1225127369cbCountry:BFComboBox;
        var _watchers:Array;
        private var validatorArr:Array;
        private var _1250349366fiOccupancy:FormItem;
        private var _97406418fiPIN:FormItem;
        private var _773037607varDepartment:String;
        private var _1822683555svtiPIN:StringValidator;
        private var _322862285roActivation:RemoteObject;
        private var _548742680cbMovil:BFComboBox;
        private var _1343159870tiMovil:TextInput;
        var _bindings:Array;
        var _bindingsBeginWithWord:Object;
        private var _873114507fiDepartment:FormItem;
        private var _documentDescriptor_:UIComponentDescriptor;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public function popupActivation()
        {
            _documentDescriptor_ = new UIComponentDescriptor({type:TitleWindow, propertiesFactory:function () : Object
            {
                return {width:480, height:330, childDescriptors:[new UIComponentDescriptor({type:SWFLoader, propertiesFactory:function () : Object
                {
                    return {x:30.35, y:1, width:437, height:291, source:"assets/fondo.swf"};
                }// end function
                }), new UIComponentDescriptor({type:FormItem, id:"fiCountry", propertiesFactory:function () : Object
                {
                    return {x:142, y:28, width:272, height:22, childDescriptors:[new UIComponentDescriptor({type:BFComboBox, id:"cbCountry", events:{change:"__cbCountry_change"}, stylesFactory:function () : void
                    {
                        this.fontSize = 9;
                        this.color = 543372;
                        return;
                    }// end function
                    , propertiesFactory:function () : Object
                    {
                        return {width:258, height:22};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:FormItem, id:"fiDepartment", propertiesFactory:function () : Object
                {
                    return {x:142, y:53, width:272, height:22, childDescriptors:[new UIComponentDescriptor({type:BFComboBox, id:"cbDepartment", stylesFactory:function () : void
                    {
                        this.fontSize = 9;
                        this.color = 543372;
                        return;
                    }// end function
                    , propertiesFactory:function () : Object
                    {
                        return {width:258};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:FormItem, id:"fiOccupancy", propertiesFactory:function () : Object
                {
                    return {x:142, y:78, width:272, height:22, childDescriptors:[new UIComponentDescriptor({type:BFComboBox, id:"cbOccupancy", stylesFactory:function () : void
                    {
                        this.fontSize = 9;
                        this.color = 543372;
                        return;
                    }// end function
                    , propertiesFactory:function () : Object
                    {
                        return {width:258, height:22};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:FormItem, id:"fiAddress", propertiesFactory:function () : Object
                {
                    return {x:142, y:106, width:272, height:33, childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"tiAddress", propertiesFactory:function () : Object
                    {
                        return {width:245, restrict:"^·ÈÌÛ˙‡ËÏÚ˘¡…Õ”⁄¿Ã»“Ÿ\\.\\-\\\'\\/#$%()=?°ø\'\\,\\\"\\&|∞!\\<>;:_\\^®*+{}[]\\`~", maxChars:250, height:37.6667};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:HBox, id:"hbMovil", propertiesFactory:function () : Object
                {
                    return {x:139, y:151, childDescriptors:[new UIComponentDescriptor({type:FormItem, id:"fiMovil", propertiesFactory:function () : Object
                    {
                        return {childDescriptors:[new UIComponentDescriptor({type:BFComboBox, id:"cbMovil", stylesFactory:function () : void
                        {
                            this.fontSize = 9;
                            this.color = 543372;
                            return;
                        }// end function
                        , propertiesFactory:function () : Object
                        {
                            return {width:73};
                        }// end function
                        })]};
                    }// end function
                    }), new UIComponentDescriptor({type:FormItem, id:"fitiMovil", propertiesFactory:function () : Object
                    {
                        return {width:123.5, height:25, childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"tiMovil", propertiesFactory:function () : Object
                        {
                            return {width:247, maxChars:5, restrict:"0-9"};
                        }// end function
                        })]};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:Button, id:"btnEnvioPIN", events:{click:"__btnEnvioPIN_click"}, stylesFactory:function () : void
                {
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:195, y:190, label:"Enviar PIN"};
                }// end function
                }), new UIComponentDescriptor({type:FormItem, id:"fiPIN", propertiesFactory:function () : Object
                {
                    return {x:289, y:191, childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"tiPIN", propertiesFactory:function () : Object
                    {
                        return {maxChars:5, restrict:"0-9", width:100.333, alpha:1, height:25};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:Button, events:{click:"___popupActivation_Button2_click"}, stylesFactory:function () : void
                {
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:195, y:247, label:"Activar", height:20};
                }// end function
                }), new UIComponentDescriptor({type:Label, stylesFactory:function () : void
                {
                    this.fontWeight = "bold";
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:115, y:31, text:"paÌs:", width:35.6, height:18};
                }// end function
                }), new UIComponentDescriptor({type:Label, stylesFactory:function () : void
                {
                    this.fontWeight = "bold";
                    this.textAlign = "right";
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:56, y:54, text:"departamento:"};
                }// end function
                }), new UIComponentDescriptor({type:Label, stylesFactory:function () : void
                {
                    this.fontWeight = "bold";
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:81, y:80, text:"ocupaciÛn:", width:72, height:18};
                }// end function
                }), new UIComponentDescriptor({type:Label, stylesFactory:function () : void
                {
                    this.fontWeight = "bold";
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:86, y:103, text:"direcciÛn:", width:67, height:18};
                }// end function
                }), new UIComponentDescriptor({type:Label, stylesFactory:function () : void
                {
                    this.fontWeight = "bold";
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:103, y:155, text:"mÛvil:"};
                }// end function
                }), new UIComponentDescriptor({type:Label, stylesFactory:function () : void
                {
                    this.fontWeight = "normal";
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:195, y:217, text:"Introducir ac· el PIN que se le"};
                }// end function
                }), new UIComponentDescriptor({type:Label, stylesFactory:function () : void
                {
                    this.fontWeight = "normal";
                    this.color = 543372;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:219, y:229, text:"enviÛ a su mÛvil"};
                }// end function
                })]};
            }// end function
            });
            _bindings = [];
            _watchers = [];
            _bindingsByDestination = {};
            _bindingsBeginWithWord = {};
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            }
            this.styleDeclaration.defaultFactory = function () : void
            {
                this.backgroundColor = 85911;
                this.cornerRadius = 20;
                this.borderColor = 16777215;
                this.backgroundAlpha = 0;
                this.borderThickness = 1;
                this.backgroundSize = "0";
                this.borderAlpha = 0;
                this.borderStyle = "none";
                return;
            }// end function
            ;
            this.layout = "absolute";
            this.width = 480;
            this.height = 330;
            this.showCloseButton = true;
            this.alpha = 1;
            _popupActivation_RemoteObject1_i();
            _popupActivation_StringValidator2_i();
            _popupActivation_StringValidator1_i();
            _popupActivation_StringValidator3_i();
            this.addEventListener("creationComplete", ___popupActivation_TitleWindow1_creationComplete);
            this.addEventListener("close", ___popupActivation_TitleWindow1_close);
            return;
        }// end function

        public function get svtiMovil() : StringValidator
        {
            return this._746163711svtiMovil;
        }// end function

        private function _popupActivation_Operation2_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "selectCities";
            _loc_1.addEventListener("result", ___popupActivation_Operation2_result);
            return _loc_1;
        }// end function

        private function _popupActivation_Operation6_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "activate";
            _loc_1.addEventListener("result", ___popupActivation_Operation6_result);
            return _loc_1;
        }// end function

        public function get cbDepartment() : BFComboBox
        {
            return this._1566605039cbDepartment;
        }// end function

        public function ___popupActivation_TitleWindow1_creationComplete(event:FlexEvent) : void
        {
            moveButton();
            init();
            return;
        }// end function

        public function ___popupActivation_Operation4_result(event:ResultEvent) : void
        {
            resultSelectRanges(event);
            return;
        }// end function

        public function init() : void
        {
            varCount = 1;
            roActivation.selectCountries();
            roActivation.selectRanges();
            roActivation.selectOccupancy();
            return;
        }// end function

        public function resultSetActivate(event:ResultEvent) : void
        {
            if (event.result.toString() == "ActiveUser")
            {
                Alert.show("Este n˙mero ya esta activado");
            }
            else
            {
                Alert.show("PIN enviado");
            }
            return;
        }// end function

        public function get cbMovil() : BFComboBox
        {
            return this._548742680cbMovil;
        }// end function

        public function resultSelectCities(event:ResultEvent) : void
        {
            cbDepartment.labelField = "ciudad";
            cbDepartment.dataField = "ciudad";
            cbDepartment.dataProvider = event.result as ArrayCollection;
            if (varCount == 1)
            {
                (varCount + 1);
                roActivation.selectUserENTEL(Application.application.intUserId);
            }
            else if (varCount == 2)
            {
                cbDepartment.selectedValue = varDepartment;
            }
            return;
        }// end function

        private function validateConfirmacion() : void
        {
            var _loc_3:ValidationResultEvent = null;
            var _loc_4:Array = null;
            validatorArr = new Array();
            validatorArr.push(svtiPIN);
            validatorArr.push(svtiMovil);
            validatorArr.push(svtiAddress);
            var _loc_1:* = Validator.validateAll(validatorArr);
            var _loc_2:* = _loc_1.length == 0;
            if (_loc_2)
            {
                roActivation.activate(Application.application.intUserId, cbCountry.selectedLabel, cbDepartment.selectedLabel, cbOccupancy.selectedLabel, tiAddress.text, int(cbMovil.selectedLabel + tiMovil.text), tiPIN.text);
            }
            else
            {
                _loc_4 = [];
                for each (_loc_3 in _loc_1)
                {
                    
                    _loc_4.push(_loc_3.message);
                }
                Alert.show(_loc_4.join("\n\n"), "registro invalido...", Alert.OK);
            }
            return;
        }// end function

        public function set count(_watcherSetupUtil:int) : void
        {
            varCount = _watcherSetupUtil;
            return;
        }// end function

        public function set cbDepartment(_watcherSetupUtil:BFComboBox) : void
        {
            var _loc_2:* = this._1566605039cbDepartment;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1566605039cbDepartment = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbDepartment", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        private function validateSolicitud() : void
        {
            var _loc_3:ValidationResultEvent = null;
            var _loc_4:Array = null;
            validatorArr = new Array();
            validatorArr.push(svtiMovil);
            validatorArr.push(svtiAddress);
            var _loc_1:* = Validator.validateAll(validatorArr);
            var _loc_2:* = _loc_1.length == 0;
            if (_loc_2)
            {
                if (strStatusUser == "unactivated")
                {
                    roActivation.setActivate(Application.application.intUserId, cbCountry.selectedLabel, cbDepartment.selectedLabel, cbOccupancy.selectedLabel, tiAddress.text, int(cbMovil.selectedLabel + tiMovil.text));
                }
                else if (strStatusUser == "waiting")
                {
                    roActivation.setPin(Application.application.intUserId, int(cbMovil.selectedLabel + tiMovil.text));
                }
            }
            else
            {
                _loc_4 = [];
                for each (_loc_3 in _loc_1)
                {
                    
                    _loc_4.push(_loc_3.message);
                }
                Alert.show(_loc_4.join("\n\n"), "registro invalido...", Alert.OK);
            }
            return;
        }// end function

        public function get varCount() : int
        {
            return this._1284244952varCount;
        }// end function

        public function resultActivate(event:ResultEvent) : void
        {
            if (event.result.toString() == "ActiveUser")
            {
                Alert.show("Este n˙mero ya esta activado");
            }
            else if (event.result.toString() == "OK")
            {
                Application.application.btnActivation.visible = false;
                Alert.show("Gracias por activar su mÛvil de entel");
                PopUpManager.removePopUp(this);
            }
            else
            {
                Alert.show("PIN incorrecto, verifique en su mÛvil que le haya llegado el PIN que le enviamos");
            }
            return;
        }// end function

        public function ___popupActivation_Operation3_result(event:ResultEvent) : void
        {
            resultSelectOccupancy(event);
            return;
        }// end function

        public function get cbCountry() : BFComboBox
        {
            return this._1225127369cbCountry;
        }// end function

        private function _popupActivation_StringValidator1_i() : StringValidator
        {
            var _loc_1:* = new StringValidator();
            svtiMovil = _loc_1;
            _loc_1.property = "text";
            _loc_1.minLength = 5;
            _loc_1.maxLength = 5;
            _loc_1.tooShortError = "MÛvil: MÌnimo 5 dÌgitos";
            _loc_1.requiredFieldError = "MÛvil: InformaciÛn requerida";
            BindingManager.executeBindings(this, "svtiMovil", svtiMovil);
            _loc_1.initialized(this, "svtiMovil");
            return _loc_1;
        }// end function

        public function get btnEnvioPIN() : Button
        {
            return this._265217986btnEnvioPIN;
        }// end function

        public function set cbMovil(_watcherSetupUtil:BFComboBox) : void
        {
            var _loc_2:* = this._548742680cbMovil;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._548742680cbMovil = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbMovil", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get fiMovil() : FormItem
        {
            return this._883309516fiMovil;
        }// end function

        public function set fitiMovil(_watcherSetupUtil:FormItem) : void
        {
            var _loc_2:* = this._1586537375fitiMovil;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1586537375fitiMovil = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fitiMovil", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get roActivation() : RemoteObject
        {
            return this._322862285roActivation;
        }// end function

        public function resultSelectUserENTEL(event:ResultEvent) : void
        {
            var _loc_3:String = null;
            var _loc_2:* = event.result as ArrayCollection;
            if (_loc_2.length > 0)
            {
                varCountry = _loc_2[0].country;
                varDepartment = _loc_2[0].department;
                cbCountry.selectedValue = _loc_2[0].country;
                roActivation.selectCities(varCountry);
                cbOccupancy.selectedValue = _loc_2[0].occupancy;
                tiAddress.text = _loc_2[0].address;
                _loc_3 = _loc_2[0].number;
                cbMovil.selectedValue = _loc_3.substr(0, 3);
                tiMovil.text = _loc_3.substr(3, 8);
                strStatusUser = "waiting";
            }
            else
            {
                cbCountry.selectedIndex = 28;
                roActivation.selectCities(cbCountry.selectedLabel);
                strStatusUser = "unactivated";
            }
            return;
        }// end function

        public function resultSetPin(event:ResultEvent) : void
        {
            if (event.result.toString() == "ActiveUser")
            {
                Alert.show("Este n˙mero ya esta activado");
            }
            else
            {
                Alert.show("PIN enviado");
            }
            return;
        }// end function

        private function _popupActivation_Operation1_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "selectCountries";
            _loc_1.addEventListener("result", ___popupActivation_Operation1_result);
            return _loc_1;
        }// end function

        public function resultSelectCountries(event:ResultEvent) : void
        {
            cbCountry.labelField = "pais";
            cbCountry.dataField = "pais";
            cbCountry.dataProvider = event.result as ArrayCollection;
            roActivation.selectCities(cbCountry.selectedLabel);
            return;
        }// end function

        public function ___popupActivation_Operation2_result(event:ResultEvent) : void
        {
            resultSelectCities(event);
            return;
        }// end function

        public function set varCount(_watcherSetupUtil:int) : void
        {
            var _loc_2:* = this._1284244952varCount;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1284244952varCount = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "varCount", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get fiCountry() : FormItem
        {
            return this._1257214291fiCountry;
        }// end function

        public function set cbOccupancy(_watcherSetupUtil:BFComboBox) : void
        {
            var _loc_2:* = this._1221131950cbOccupancy;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1221131950cbOccupancy = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbOccupancy", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        private function _popupActivation_Operation5_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "setActivate";
            _loc_1.addEventListener("result", ___popupActivation_Operation5_result);
            return _loc_1;
        }// end function

        public function ___popupActivation_TitleWindow1_close(event:CloseEvent) : void
        {
            PopUpManager.removePopUp(this);
            return;
        }// end function

        public function moveButton() : void
        {
            mx_internal::closeButton.x = 445;
            mx_internal::closeButton.y = 23;
            return;
        }// end function

        public function get hbMovil() : HBox
        {
            return this._691293789hbMovil;
        }// end function

        public function __btnEnvioPIN_click(event:MouseEvent) : void
        {
            validateSolicitud();
            return;
        }// end function

        public function set fiAddress(_watcherSetupUtil:FormItem) : void
        {
            var _loc_2:* = this._848308815fiAddress;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._848308815fiAddress = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fiAddress", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function set roActivation(_watcherSetupUtil:RemoteObject) : void
        {
            var _loc_2:* = this._322862285roActivation;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._322862285roActivation = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roActivation", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function set cbCountry(_watcherSetupUtil:BFComboBox) : void
        {
            var _loc_2:* = this._1225127369cbCountry;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1225127369cbCountry = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbCountry", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function ___popupActivation_Operation1_result(event:ResultEvent) : void
        {
            resultSelectCountries(event);
            return;
        }// end function

        public function set fiMovil(_watcherSetupUtil:FormItem) : void
        {
            var _loc_2:* = this._883309516fiMovil;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._883309516fiMovil = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fiMovil", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function set tiAddress(_watcherSetupUtil:TextInput) : void
        {
            var _loc_2:* = this._382867521tiAddress;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._382867521tiAddress = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tiAddress", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function set svtiAddress(_watcherSetupUtil:StringValidator) : void
        {
            var _loc_2:* = this._1707366588svtiAddress;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1707366588svtiAddress = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "svtiAddress", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get fiDepartment() : FormItem
        {
            return this._873114507fiDepartment;
        }// end function

        public function get varCountry() : String
        {
            return this._1503781265varCountry;
        }// end function

        public function set btnEnvioPIN(_watcherSetupUtil:Button) : void
        {
            var _loc_2:* = this._265217986btnEnvioPIN;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._265217986btnEnvioPIN = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnEnvioPIN", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        private function _popupActivation_Operation4_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "selectRanges";
            _loc_1.addEventListener("result", ___popupActivation_Operation4_result);
            return _loc_1;
        }// end function

        override public function initialize() : void
        {
            var target:popupActivation;
            var watcherSetupUtilClass:Object;
            .mx_internal::setDocumentDescriptor(_documentDescriptor_);
            var bindings:* = _popupActivation_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_popupActivationWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                
                Binding(bindings[i]).execute();
                i = (i + 1);
            }
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
            return;
        }// end function

        private function _popupActivation_Operation8_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "selectUserENTEL";
            _loc_1.addEventListener("result", ___popupActivation_Operation8_result);
            return _loc_1;
        }// end function

        public function set tiMovil(_watcherSetupUtil:TextInput) : void
        {
            var _loc_2:* = this._1343159870tiMovil;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1343159870tiMovil = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tiMovil", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function __cbCountry_change(event:ListEvent) : void
        {
            roActivation.selectCities(cbCountry.selectedLabel);
            return;
        }// end function

        public function ___popupActivation_Operation8_result(event:ResultEvent) : void
        {
            resultSelectUserENTEL(event);
            return;
        }// end function

        public function set fiOccupancy(_watcherSetupUtil:FormItem) : void
        {
            var _loc_2:* = this._1250349366fiOccupancy;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1250349366fiOccupancy = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fiOccupancy", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function set fiPIN(_watcherSetupUtil:FormItem) : void
        {
            var _loc_2:* = this._97406418fiPIN;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._97406418fiPIN = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fiPIN", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function set fiCountry(_watcherSetupUtil:FormItem) : void
        {
            var _loc_2:* = this._1257214291fiCountry;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1257214291fiCountry = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fiCountry", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get cbOccupancy() : BFComboBox
        {
            return this._1221131950cbOccupancy;
        }// end function

        public function ___popupActivation_Operation7_result(event:ResultEvent) : void
        {
            resultSetPin(event);
            return;
        }// end function

        public function get fiAddress() : FormItem
        {
            return this._848308815fiAddress;
        }// end function

        public function set varDepartment(_watcherSetupUtil:String) : void
        {
            var _loc_2:* = this._773037607varDepartment;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._773037607varDepartment = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "varDepartment", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        private function _popupActivation_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = tiMovil;
            _loc_1 = tiAddress;
            _loc_1 = tiPIN;
            return;
        }// end function

        public function resultSelectRanges(event:ResultEvent) : void
        {
            cbMovil.labelField = "ranges";
            cbMovil.dataField = "ranges";
            cbMovil.dataProvider = event.result as ArrayCollection;
            return;
        }// end function

        public function get fitiMovil() : FormItem
        {
            return this._1586537375fitiMovil;
        }// end function

        private function _popupActivation_StringValidator3_i() : StringValidator
        {
            var _loc_1:* = new StringValidator();
            svtiPIN = _loc_1;
            _loc_1.property = "text";
            _loc_1.minLength = 1;
            _loc_1.maxLength = 5;
            _loc_1.tooShortError = "PIN: MÌnimo 5 dÌgitos";
            _loc_1.requiredFieldError = "PIN: InformaciÛn requerida";
            BindingManager.executeBindings(this, "svtiPIN", svtiPIN);
            _loc_1.initialized(this, "svtiPIN");
            return _loc_1;
        }// end function

        public function set hbMovil(_watcherSetupUtil:HBox) : void
        {
            var _loc_2:* = this._691293789hbMovil;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._691293789hbMovil = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hbMovil", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get tiAddress() : TextInput
        {
            return this._382867521tiAddress;
        }// end function

        public function get svtiPIN() : StringValidator
        {
            return this._1822683555svtiPIN;
        }// end function

        public function set svtiPIN(_watcherSetupUtil:StringValidator) : void
        {
            var _loc_2:* = this._1822683555svtiPIN;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1822683555svtiPIN = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "svtiPIN", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get tiMovil() : TextInput
        {
            return this._1343159870tiMovil;
        }// end function

        public function get svtiAddress() : StringValidator
        {
            return this._1707366588svtiAddress;
        }// end function

        public function set tiPIN(_watcherSetupUtil:TextInput) : void
        {
            var _loc_2:* = this._110335712tiPIN;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._110335712tiPIN = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tiPIN", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        private function _popupActivation_Operation7_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "setPin";
            _loc_1.addEventListener("result", ___popupActivation_Operation7_result);
            return _loc_1;
        }// end function

        public function ___popupActivation_Operation6_result(event:ResultEvent) : void
        {
            resultActivate(event);
            return;
        }// end function

        public function get fiPIN() : FormItem
        {
            return this._97406418fiPIN;
        }// end function

        public function resultSelectOccupancy(event:ResultEvent) : void
        {
            cbOccupancy.labelField = "occupancy";
            cbOccupancy.dataField = "occupancy";
            cbOccupancy.dataProvider = event.result as ArrayCollection;
            return;
        }// end function

        public function get fiOccupancy() : FormItem
        {
            return this._1250349366fiOccupancy;
        }// end function

        private function _popupActivation_RemoteObject1_i() : RemoteObject
        {
            var _loc_1:* = new RemoteObject();
            roActivation = _loc_1;
            _loc_1.destination = "dSms";
            _loc_1.source = "service.smsService";
            _loc_1.showBusyCursor = true;
            _loc_1.operations = {selectCountries:_popupActivation_Operation1_c(), selectCities:_popupActivation_Operation2_c(), selectOccupancy:_popupActivation_Operation3_c(), selectRanges:_popupActivation_Operation4_c(), setActivate:_popupActivation_Operation5_c(), activate:_popupActivation_Operation6_c(), setPin:_popupActivation_Operation7_c(), selectUserENTEL:_popupActivation_Operation8_c()};
            _loc_1.addEventListener("fault", __roActivation_fault);
            _loc_1.initialized(this, "roActivation");
            return _loc_1;
        }// end function

        private function _popupActivation_Operation3_c() : Operation
        {
            var _loc_1:* = new Operation();
            _loc_1.name = "selectOccupancy";
            _loc_1.addEventListener("result", ___popupActivation_Operation3_result);
            return _loc_1;
        }// end function

        public function set varCountry(_watcherSetupUtil:String) : void
        {
            var _loc_2:* = this._1503781265varCountry;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1503781265varCountry = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "varCountry", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get tiPIN() : TextInput
        {
            return this._110335712tiPIN;
        }// end function

        public function set strStatusUser(_watcherSetupUtil:String) : void
        {
            var _loc_2:* = this._1959606254strStatusUser;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._1959606254strStatusUser = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "strStatusUser", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function get varDepartment() : String
        {
            return this._773037607varDepartment;
        }// end function

        public function set fiDepartment(_watcherSetupUtil:FormItem) : void
        {
            var _loc_2:* = this._873114507fiDepartment;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._873114507fiDepartment = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fiDepartment", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public function ___popupActivation_Operation5_result(event:ResultEvent) : void
        {
            resultSetActivate(event);
            return;
        }// end function

        private function _popupActivation_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
            binding = new Binding(this, function () : Object
            {
                return tiMovil;
            }// end function
            , function (_watcherSetupUtil:Object) : void
            {
                svtiMovil.source = _watcherSetupUtil;
                return;
            }// end function
            , "svtiMovil.source");
            result[0] = binding;
            binding = new Binding(this, function () : Object
            {
                return tiAddress;
            }// end function
            , function (_watcherSetupUtil:Object) : void
            {
                svtiAddress.source = _watcherSetupUtil;
                return;
            }// end function
            , "svtiAddress.source");
            result[1] = binding;
            binding = new Binding(this, function () : Object
            {
                return tiPIN;
            }// end function
            , function (_watcherSetupUtil:Object) : void
            {
                svtiPIN.source = _watcherSetupUtil;
                return;
            }// end function
            , "svtiPIN.source");
            result[2] = binding;
            return result;
        }// end function

        public function ___popupActivation_Button2_click(event:MouseEvent) : void
        {
            validateConfirmacion();
            return;
        }// end function

        public function get strStatusUser() : String
        {
            return this._1959606254strStatusUser;
        }// end function

        public function __roActivation_fault(event:FaultEvent) : void
        {
            Alert.show(event.fault.faultString, "Error");
            return;
        }// end function

        private function _popupActivation_StringValidator2_i() : StringValidator
        {
            var _loc_1:* = new StringValidator();
            svtiAddress = _loc_1;
            _loc_1.property = "text";
            _loc_1.requiredFieldError = "DirecciÛn: InformaciÛn requerida";
            BindingManager.executeBindings(this, "svtiAddress", svtiAddress);
            _loc_1.initialized(this, "svtiAddress");
            return _loc_1;
        }// end function

        public function set svtiMovil(_watcherSetupUtil:StringValidator) : void
        {
            var _loc_2:* = this._746163711svtiMovil;
            if (_loc_2 !== _watcherSetupUtil)
            {
                this._746163711svtiMovil = _watcherSetupUtil;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "svtiMovil", _loc_2, _watcherSetupUtil));
            }
            return;
        }// end function

        public static function set watcherSetupUtil(_watcherSetupUtil:IWatcherSetupUtil) : void
        {
            _watcherSetupUtil = _watcherSetupUtil;
            return;
        }// end function

    }
}
