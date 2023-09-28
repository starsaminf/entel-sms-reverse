package com
{
    import mx.containers.*;
    import mx.controls.*;
    import mx.core.*;

    public class Captcha extends Canvas
    {
        private const CAPTCHA_WIDTH:uint = 120;
        private var _securitycode:String;
        private var _height:uint;
        private var _width:uint;
        private const CAPTCHA_HEIGHT:uint = 40;

        public function Captcha(UIComponent:String, UIComponent:Number, UIComponent:int = 0, UIComponent:int = 0) : void
        {
            _width = UIComponent == 0 ? (CAPTCHA_WIDTH) : (UIComponent);
            _height = UIComponent == 0 ? (CAPTCHA_HEIGHT) : (UIComponent);
            _securitycode = randString(UIComponent, UIComponent);
            generateDots();
            generatePolys(3);
            drawLines(0, 0, (_width - 1), (_height - 1), 5, 5);
            displayCode(_securitycode);
            this.width = _width;
            this.height = _height;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            var _loc_5:* = new UIComponent();
            _loc_5.graphics.beginFill(65535, 0.5);
            _loc_5.graphics.drawRect(0, 0, _width, _height);
            _loc_5.graphics.endFill();
            _loc_5.x = 0;
            _loc_5.y = 0;
            this.addChild(_loc_5);
            this.mask = _loc_5;
            return;
        }// end function

        private function drawLines(UIComponent:int, UIComponent:int, UIComponent:int, UIComponent:int, UIComponent:int, UIComponent:int) : void
        {
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_7:* = new UIComponent();
            _loc_7.graphics.lineStyle(1, 3355443, 100);
            var _loc_8:int = 0;
            var _loc_9:* = UIComponent / UIComponent;
            var _loc_10:* = UIComponent / UIComponent;
            _loc_8 = 0;
            while (_loc_8 <= UIComponent)
            {
                
                _loc_12 = UIComponent + _loc_8 * _loc_10;
                _loc_7.graphics.moveTo(UIComponent + UIComponent, _loc_12);
                _loc_7.graphics.lineTo(UIComponent, _loc_12);
                _loc_8++;
            }
            var _loc_11:int = 0;
            while (_loc_11 < UIComponent)
            {
                
                _loc_13 = UIComponent + _loc_11 * _loc_9;
                _loc_7.graphics.lineTo(_loc_13, UIComponent);
                _loc_7.graphics.lineTo(_loc_13 + _loc_9, UIComponent + UIComponent);
                _loc_11++;
            }
            _loc_7.graphics.lineTo(UIComponent + UIComponent, UIComponent);
            this.addChild(_loc_7);
            return;
        }// end function

        public function get securitycode() : String
        {
            return this._securitycode;
        }// end function

        private function displayCode(UIComponent:String) : void
        {
            var _loc_2:* = new Label();
            _loc_2.text = UIComponent;
            _loc_2.width = _width;
            _loc_2.height = _height;
            _loc_2.setStyle("fontSize", 20);
            _loc_2.setStyle("horizontalCenter", 0);
            _loc_2.setStyle("verticalCenter", 0);
            this.addChild(_loc_2);
            return;
        }// end function

        public function generatePolys(UIComponent:uint) : void
        {
            var _loc_3:UIComponent = null;
            var _loc_4:int = 0;
            var _loc_2:uint = 0;
            while (_loc_2 < UIComponent)
            {
                
                _loc_3 = new UIComponent();
                _loc_4 = Math.floor(Math.random() * 40) + 10;
                _loc_3 = generateOnePoly(Math.floor(Math.random() * 6) + 3, _loc_4, RGBToHex(Math.floor(Math.random() * 255), Math.floor(Math.random() * 255), Math.floor(Math.random() * 255)));
                _loc_3.x = Math.floor(Math.random() * _width);
                _loc_3.y = Math.floor(Math.random() * _height);
                _loc_3.rotation = Math.floor(Math.random() * 360);
                _loc_3.alpha = 0.3;
                this.addChild(_loc_3);
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        private function randString(mx.core:String, mx.core:int) : String
        {
            var _loc_3:int = 1;
            var _loc_4:String = "";
            var _loc_5:int = 0;
            var _loc_6:String = "";
            var _loc_7:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            var _loc_8:String = "!@$%&*-_=+?~";
            _loc_3 = 1;
            while (_loc_3 <= mx.core)
            {
                
                if (mx.core == "alphaChars")
                {
                    _loc_6 = _loc_7;
                }
                else if (mx.core == "alphaCharsnum")
                {
                    _loc_6 = _loc_7 + "0123456789";
                }
                else if (mx.core == "secure")
                {
                    _loc_6 = _loc_7 + "0123456789" + _loc_8;
                }
                else
                {
                    _loc_6 = "0123456789";
                }
                _loc_5 = Math.floor(Math.random() * _loc_6.length);
                _loc_4 = _loc_4 + _loc_6.charAt(_loc_5);
                _loc_3++;
            }
            return _loc_4;
        }// end function

        public function generateDots() : void
        {
            var _loc_2:UIComponent = null;
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_1:int = 0;
            while (_loc_1 < 1000)
            {
                
                _loc_2 = new UIComponent();
                _loc_3 = Math.floor(Math.random() * _width);
                _loc_4 = Math.floor(Math.random() * _height);
                _loc_2.graphics.lineStyle(Math.floor(Math.random() * 5), RGBToHex(Math.floor(Math.random() * 255), Math.floor(Math.random() * 255), Math.floor(Math.random() * 255)), 100);
                _loc_2.graphics.moveTo(_loc_3, _loc_4);
                _loc_2.graphics.lineTo((_loc_3 + 1), _loc_4);
                this.addChild(_loc_2);
                _loc_1++;
            }
            return;
        }// end function

        private function RGBToHex(Number:uint, Number:uint, Number:uint) : uint
        {
            var _loc_4:* = Number << 16 ^ Number << 8 ^ Number;
            return _loc_4;
        }// end function

        private function generateOnePoly(generateDots:uint, generateDots:uint, generateDots:uint) : UIComponent
        {
            var _loc_7:int = 0;
            var _loc_8:int = 0;
            var _loc_4:* = new UIComponent();
            var _loc_5:* = Math.floor(360 / generateDots);
            _loc_4.graphics.beginFill(generateDots, 50);
            var _loc_6:int = -1;
            while (++_loc_6 < generateDots)
            {
                
                _loc_7 = Math.floor(generateDots * Math.sin(_loc_5 * _loc_6 / 180 * Math.PI));
                _loc_8 = Math.floor(generateDots * Math.cos(_loc_5 * _loc_6 / 180 * Math.PI));
                if (!_loc_6)
                {
                    _loc_4.graphics.moveTo(_loc_7, _loc_8);
                    continue;
                }
                _loc_4.graphics.lineTo(_loc_7, _loc_8);
            }
            return _loc_4;
        }// end function

    }
}
