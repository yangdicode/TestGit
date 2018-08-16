package mmo.common.textfieldultra{
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	public class TextFieldUltra extends Sprite{
		
		public static const DYNAMIC:String = "dynamic";
		public static const INPUT:String = "input";
		
		private static const ADJUST_TYPE_INSERT:String = "adjust_type_insert";
		private static const ADJUST_TYPE_CHANGE:String = "adjust_type_change";		
		
		private const PLACEHOLDER:String = "﹒";
		private const PLACEHOLDER_FONT:String = "宋体";
		private const PLACEHOLDER_COLOR:uint = 0xFFFFFF;
		
		private var textField_:TextField;
		
		private var defaultTextFormat_:TextFormat;
		
		private var length_:int;
		
		private var spriteContainer_:Sprite;
		
		private var selectBegin:int;
		private var selectEnd:int;
		
		private var scrollV:int;		
		
		private var spriteMask:Shape;
		
		private var replacing:Boolean;
		
		public var textFormat:Dictionary;
		
		public var spriteVspace:int;
		public var spriteHspace:int;
		
		public var autoScroll:Boolean;
		public var autoScrollV:int = 0;
		
		private var _isNewPlayer:Boolean;
		
		public function TextFieldUltra(width:Number, height:Number, type:String = DYNAMIC) {
			initTextField(width, height);			
			addChild(textField_);
			
			spriteContainer_ = new Sprite();
			addChild(spriteContainer_);		
			
			textFormat = new Dictionary();
			
			scrollV = 1;
			spriteHspace = spriteVspace = 1;		
			
			this.type = type;
			
			spriteMask = createSpritesMask(textField_.x, textField_.y, textField_.width, textField_.height);
			addChild(spriteMask);
			spriteContainer_.mask = spriteMask;
			checkVersion();
		}		
		
		/**
		 * 添加带图片文本 
		 * @param text 文字
		 * @param resource 图片信息，格式[{index:1, src:object}, {index:1, src:object}, ...]
		 * @param format TextFormat
		 * @param autoWordWrap 自动换行
		 */
		public function appendText(text:String, resource:Array = null, format:TextFormat = null, autoWordWrap:Boolean = true):void {
			trace(" ============= appendText");
			_appendPureText(text, format, autoWordWrap);
			
			if(resource != null) {
				for(var i:int = 0, len:int = resource.length; i < len; i++) {
					var index:int = resource[i].index;
					if(index < 0) {
						index = text.length;
					}
					else {
						if(autoWordWrap) {
							index -= 1;
						}
					}
					
					index += textField_.length - text.length;
					if(index >= textField_.length) {
						index = textField_.length;
						if(autoWordWrap) {
							index -= 1;
						}
					}
					
					var width:int = (resource[i].width == null ? -1 : resource[i].width);
					var height:int = (resource[i].height == null ? -1 : resource[i].height);
					//由于表情的注册点被调整到两腿之间，所以这里需要包装一层
					var container:Sprite = new Sprite();
					var className:Class = resource[i].src as Class;
					var face:DisplayObject =  new className() as Sprite;
					//					face.width = face.width *0.6;
					//					face.height = face.height * 0.6;
					container.addChild(face);
					var rect:Rectangle = face.getBounds(container);
					face.x = 0-rect.left;
					face.y = 0-rect.top;
					//					addSprite(container, index, width, height);
					addSprite(container,index);
				}
			}
			
			scrollText();
		}
		
		/**
		 * 添加普通文本
		 */
		public function _appendPureText(text:String, format:TextFormat = null, autoWordWrap:Boolean = true):void {
			recoverDefaultTextFormat();
			
			var addText:String = text;
			if(autoWordWrap) {
				addText += "\n";	
			}
			addText = addText.split("\r").join("\n");
			//addText = addText.replace("\r", "\n");
			
			var start:int = textField_.length - 1;
			//trace("-------appendPureText: " + addText);
			textField_.appendText(addText);
			if(format) {
				//trace("--------appendPureText::textField_.setTextFormat(" + format + "," + start + "," + (textField_.length-1) + ")");
				textField_.setTextFormat(format, start, textField_.length - 1);
			}
		}
		
		/**
		 * 添加html文本
		 */
		public function appendHtmlText(text:String, format:TextFormat = null, autoWordWrap:Boolean = true):void {
			recoverDefaultTextFormat();
			
			var addText:String = text;
			if(autoWordWrap) {
				addText += "\n";	
			}
			addText = addText.split("\r").join("\n");
			//addText = addText.replace("\r", "\n");
			
			var start:int = textField_.length - 1;
			textField_.htmlText += addText;
			if(format) {
				//trace("--------appendPureText::textField_.setTextFormat(" + format + "," + start + "," + (textField_.length-1) + ")");
				textField_.setTextFormat(format, start, textField_.length - 1);
			}
			
			scrollText();
		}
		
		/**
		 * 从序列化的文本信息添加
		 */
		public function appendSerializedText(text:String, autoWordWrap:Boolean = true):void {
			// 正文
			var content:String = text.substring(0, text.lastIndexOf("||"));
			// 后缀
			var suffix:String = text.substr(text.lastIndexOf("||") + 2);
			//trace("-----text: " + text);
			var suffixArr:Array = suffix.split("$");
			if(suffixArr[0].length > 0) {
				var suffixSpriteArr:Array = suffixArr[0].split(";");
				var spriteArr:Array = [];
				for(var i:int = 0; i < suffixSpriteArr.length; i++) {
					if(suffixSpriteArr[i].length == 0) {
						continue;
					}
					//trace("--------suffixSpriteArr[]: " + suffixSpriteArr[i]);
					var tmpArr:Array = suffixSpriteArr[i].split(",");
					//trace("-----getDefinition: " + tmpArr[0]);
					var spriteClass:Class = Class(ApplicationDomain.currentDomain.getDefinition(tmpArr[0]));
					spriteArr.push({"index":int(tmpArr[1]), "src":spriteClass, "width":int(tmpArr[2]), "height":int(tmpArr[3])});
				}
			}
			
			appendText(content, spriteArr, null, autoWordWrap);
		}
		
		/**
		 * 在文本中插入图片
		 * @param	target String/Class/Sprite
		 * @param	width
		 * @param	height
		 * @param	caretIndex
		 */
		public function addSprite(target:*, caretIndex:int = -1, width:Number = -1, height:Number = -1):void {			
			var targetClass:Class;
			var newObj:DisplayObject
			if(target is String) {
				targetClass = Class(ApplicationDomain.currentDomain.getDefinition(target));
				newObj = DisplayObject(new targetClass());
			}
			else {
				if(target is Class) {
					targetClass = target;
					newObj = DisplayObject(new targetClass());
				}
				else {
					newObj = target;
				}
			}
			
			trace("=============addSprite w: " + newObj.width + " h: " + newObj.height + " index: " + caretIndex);
			
			if(width > 0) {
				newObj.width = width;
			}
			if(height > 0) {
				newObj.height = height;
			}
			
			if(caretIndex == -1) {
				caretIndex = textField_.caretIndex;
			}
			if(caretIndex > textField_.length) {
				caretIndex = textField_.length;
			}
			
			var format:TextFormat = getPlaceholderFormat(newObj.width, newObj.height);		
			//trace("--------textField.text: " + textField_.text);
			replacing = true;
			var tempScrollV:int = textField_.scrollV;
			// 插入PLACEHOLDER
			textField_.replaceText(caretIndex, caretIndex, PLACEHOLDER);
			trace("--------addSprite::textField_.setTextFormat(" + format + "," + caretIndex + "," + (caretIndex+1) + ")");
			textField_.setTextFormat(format, caretIndex, caretIndex+1);
			textField_.scrollV = tempScrollV;
			replacing = false;
			//trace("--------textField.text: " + textField_.text);
			spriteContainer_.addChild(newObj);
			newObj.name = String(caretIndex);
			
			length_++;
			adjustSprites(caretIndex, 1, ADJUST_TYPE_INSERT);
			
			//scrollText();
		}
		
		public function setTextFormat(format:TextFormat, beginIndex:int = -1, endIndex:int = -1):void {		
			if(endIndex < 0) {
				endIndex = (beginIndex < 0) ? textField_.text.length : beginIndex + 1;
			}
			if(beginIndex < 0) {
				beginIndex = 0;
			}
			if(endIndex <= beginIndex) {
				return;
			}
			
			textField_.setTextFormat(format, beginIndex, endIndex);
			recoverPlaceholderFormat(beginIndex, endIndex);
			textFormat[ { begin:beginIndex, end:endIndex } ] = format;
			adjustCoordinate(beginIndex, textField_.text.length - 1);	
		}		
		
		public function clear():void {
			textField_.text = "";
			textField_.htmlText = "";
			length_ = 0;
			scrollV = 1;
			recoverDefaultTextFormat();
			textFormat = new Dictionary();
			spriteContainer_.y = 0;
			while(spriteContainer_.numChildren > 0) {
				spriteContainer_.removeChildAt(0);
			}
		}
		
		public function dispose():void {
			while(this.numChildren > 0) {
				this.removeChildAt(0);
			}
			
			
			defaultTextFormat_ = null;
			spriteContainer_ = null;
			spriteMask = null;
			textFormat = null;
			
			if(textField_ != null) {
				textField_.removeEventListener(Event.SCROLL, onScroll);
				textField_.removeEventListener(Event.CHANGE, onChange);
				textField_.removeEventListener(TextEvent.TEXT_INPUT, onTextInput);
				textField_.removeEventListener(MouseEvent.MOUSE_UP, onSelection);
				textField_.removeEventListener(MouseEvent.MOUSE_OUT, onSelection);	
				
				textField_ = null;
			}
		}
		
		public function scrollText():void {
			if(autoScroll) {
				trace("-----textField_.scrollV = textField_.maxScrollV;");
				textField_.scrollV = textField_.maxScrollV;
			}	
			else {
				if(autoScrollV > 0) {
					textField_.scrollV = autoScrollV;
				}
			}
		}
		
		private function onScroll(e:Event):void {
			trace("-----onScroll: " + replacing);
			if(!replacing) {
				var scrollDirection:int = textField_.scrollV > this.scrollV ? 1 : -1;
				var begin:int = scrollDirection > 0 ? (textField_.scrollV - 2) : (this.scrollV - 2);
				var end:int = scrollDirection > 0 ? (this.scrollV - 2) : (textField_.scrollV - 2);
				var scrollHeight:Number = 0;
				for(var i:int = begin; i > end && i<textField_.numLines; i--) {
					scrollHeight += textField_.getLineMetrics(i).height;						
				}
				spriteContainer_.y -= scrollDirection * scrollHeight;				
				trace("------onScroll", scrollDirection, scrollV, textField_.scrollV, scrollDirection * scrollHeight);
			}
			if(replacing/* && textField_.scrollV == 1*/) {
				return;
			}
			this.scrollV = textField_.scrollV;
			trace("----set _scrollV", this.scrollV);
		}
		
		private function onSelection(e:MouseEvent):void {
			selectBegin = textField_.selectionBeginIndex;
			selectEnd = textField_.selectionEndIndex;
		}
		
		private function onTextInput(e:Event):void {			
			recoverDefaultTextFormat();
		}		
		
		private function onChange(e:Event):void {			
			var offset:int = textField_.length - length_;
			length_ = textField_.length;
			if(offset < 0) {
				checkSpriteExist(textField_.caretIndex, offset);
				adjustSprites(textField_.caretIndex, offset, ADJUST_TYPE_CHANGE);
			}
			else {
				adjustSprites(textField_.caretIndex - offset + 1, offset, ADJUST_TYPE_CHANGE);
			}	
		}
		
		private function checkSpriteExist(caretIndex:int, offset:int):void {				
			var begin:int = caretIndex + offset + 1;
			var end:int = caretIndex + 1;		
			if(offset < -1 && selectBegin != selectEnd) {
				begin = selectBegin;
				end = selectEnd;
			}
			
			for(var i:int = begin; i < end; i++) {
				var checkObj:DisplayObject = spriteContainer_.getChildByName(String(i)) as DisplayObject;
				if(checkObj) {
					var index:int = spriteContainer_.getChildIndex(checkObj);
					spriteContainer_.removeChild(checkObj);	
				}
			}
		}	
		
		private function adjustSprites(caretIndex:int, offset:int = 0, type:String = ADJUST_TYPE_CHANGE):void {			
			var insertStatus:Boolean = true;
			for(var i:int = 0, len:int = numSprite; i < len; i++) {				
				var caret:int = getSpriteIndexAt(i);		
				if(caret < caretIndex - 1) {
					//continue;
				}
				else {
					if(caret == caretIndex && type == ADJUST_TYPE_CHANGE) {
						caret = caret + offset;
					}
					else {
						if(caret == caretIndex - 1 && type == ADJUST_TYPE_CHANGE && offset < 0) {
							//continue;
						}				
						else { 
							if(caret == caretIndex - 1 && type == ADJUST_TYPE_CHANGE && offset > 0) {
								caret = caret + offset;
							}
							else { 
								if(caret == caretIndex - 1 && type == ADJUST_TYPE_INSERT) {
									caret = caret;
								}
								else {
									if(caret == caretIndex && type == ADJUST_TYPE_INSERT)	{
										if(insertStatus && textField_.text.charAt(caretIndex + 1) == PLACEHOLDER) {
											//if(textField_.getTextFormat(caretIndex + 1).letterSpacing != null)	{
											caret = caret + offset;
											insertStatus = false;
											//}						
										}
										else {						
											insertStatus = true;
										}
									}				
									else {
										if(caret != caretIndex) {
											caret = caret + offset;
										}
									}
								}
							}
						}
					}
				}			
				
				var adjustObj:DisplayObject = DisplayObject(spriteContainer_.getChildAt(i));
				var rectPlaceholder:Rectangle = getCharBoundaries(caret);
				if(adjustObj && rectPlaceholder) {
					adjustObj.name = String(caret);	
					setSpriteCoordinate(adjustObj, rectPlaceholder);	
				}
			}
		}		
		
		private function recoverPlaceholderFormat(beginIndex:int, endIndex:int):void {
			for(var i:int = beginIndex; i < endIndex; i++) {
				if(textField_.text.charAt(i) == PLACEHOLDER) {
					var sprite:DisplayObject = spriteContainer_.getChildByName(String(i)) as DisplayObject;
					if(!sprite) {
						continue;
					}
					var format:TextFormat = getPlaceholderFormat(sprite.width, sprite.height);
					trace("--------recoverPlaceholderFormat::textField_.setTextFormat(" + format + "," + i + ")");
					textField_.setTextFormat(format, i);
				}
			}
		}
		
		private function getPlaceholderFormat(width:Number, height:Number):TextFormat {
			//trace("-------getPlaceholderFormat: " + "width: " + width + " height: " + height);
			var format:TextFormat = new TextFormat();
			format.font = PLACEHOLDER_FONT;
			format.color = PLACEHOLDER_COLOR;
			format.size = height + 2 * spriteVspace;
			//format.leading = height + 2 * spriteVspace;		
			format.letterSpacing = width - height - 2 * spriteVspace + 2 * spriteHspace;
			return format;
		}		
		
		private function recoverDefaultTextFormat():void {
			trace("-----recoverDefaultTextFormat");
			if(defaultTextFormat_) {
				defaultTextFormat = defaultTextFormat_;
			}			
		}
		
		private function adjustCoordinate(beginIndex:int = -1, endIndex:int = -1):void {			
			for(var i:int = 0, len:int = spriteContainer_.numChildren; i < len; i++) {
				var sprite:DisplayObject = spriteContainer_.getChildAt(i) as DisplayObject;
				var spriteIndex:int = int(sprite.name);
				if(beginIndex <= spriteIndex && endIndex >= spriteIndex) {
					var rectPlaceholder:Rectangle = getCharBoundaries(spriteIndex);
					if(rectPlaceholder) {
						setSpriteCoordinate(sprite, rectPlaceholder);
					}
				}
			}
		}
		
		private function setSpriteCoordinate(target:DisplayObject, rectPlaceholder:Rectangle):void {
			var editionDis:Number = _isNewPlayer ? -spriteContainer_.y:0;
			target.x = spriteContainer_.x + rectPlaceholder.left + spriteHspace;
			target.y = rectPlaceholder.top + rectPlaceholder.height - target.height - spriteVspace + editionDis;
		}
		
		public function getCharBoundaries(charIndex:int):Rectangle {
			var rect:Rectangle = textField_.getCharBoundaries(charIndex);
			if(!rect) {
				// TextField该死的特性，必须在显示范围内的字符才能getCharBoundaries
				var objLine:int = textField_.getLineIndexOfChar(charIndex);
				if(textField_.bottomScrollV < objLine) {
					var tempScrollV:int = textField_.scrollV;
					textField_.scrollV = objLine;
					rect = textField_.getCharBoundaries(charIndex);
					textField_.scrollV = tempScrollV;
				}
			}
			return rect;
		}		
		
		public function applyTextFormat(formats:Dictionary, startIndex:int = 0):void {
			for(var i:Object in formats) {
				setTextFormat(formats[i], i.begin + startIndex, i.end + startIndex);
			}
		}
		
		public function setCaretIndex(caretIndex:int):void {
			textField_.setSelection(caretIndex, caretIndex);
		}
		
		private function initTextField(width:Number, height:Number):void {
			textField_ = new TextField();			
			textField_.width = width;
			textField_.height = height;
			textField_.multiline = true;
			textField_.wordWrap = true;	
			//textField_.border = true;
			textField_.restrict = "^" + PLACEHOLDER;
		}
		
		private function createSpritesMask(x:Number, y:Number, width:Number, height:Number):Shape {
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xFF0000);
			shape.graphics.drawRect(x, y, width, height);
			shape.graphics.endFill();
			return shape;
		}
		
		public function resize(width:Number, height:Number):void {
			textField_.width = spriteMask.width = width;
			textField_.height = spriteMask.height = height;			
			adjustCoordinate(0, textField_.length);
		}		
		
		public function replace(value:String, repl:String, beginIndex:int, endIndex:int):void {
			value = value.split(PLACEHOLDER).join("");	
			repl = repl.split(PLACEHOLDER).join("");	
			textField_.text = textField_.text.substring(0, beginIndex) + textField_.text.substring(beginIndex, endIndex).split(value).join(repl) + textField_.text.substring(endIndex);			
			length_ += repl.length - value.length;
			recoverPlaceholderFormat(0, length);
		}
		
		public function get textfield():TextField {
			return textField_;
		}
		
		public function get length():int {
			return textField_.text.length;
		}
		
		public function get textLength():int {
			return text.length;
		}
		
		public function get text():String {
			return textField_.text.split(PLACEHOLDER).join("");
		}
		
		public function set text(value:String):void {
			value = value.split(PLACEHOLDER).join("");
			textField_.text = value;
		}
		
		public function get serializedText():String {
			var result:String = this.text + "||";
			
			var len:int = numSprite;
			var picList:Array = new Array();
			for(var i:int = 0; i < len; i++) {			
				var itemContainer:DisplayObjectContainer = getSpriteAt(i) as DisplayObjectContainer;
				var item:DisplayObject = itemContainer.getChildAt(0);
				picList.push({"index":int(itemContainer.name), "src":item});
			}
			picList.sortOn("index", [Array.NUMERIC]);
			
			for (i = 0; i < len; i++) {
				item = DisplayObject(picList[i].src);
				var className:String = getQualifiedClassName(item).replace("::", ".");
				result += className + "," + String(picList[i].index - i) + "," + item.width + "," + item.height + ";";
			}
			
			result += "$";
			//			trace("---serializedText: " + result);
			return result;
		}
		
		public function isSprite(index:int):Boolean {
			if(index < 0 || index >= length) {
				return false;
			}
			return textField_.text.charAt(index) == PLACEHOLDER;
		}
		
		public function get numSprite():int {
			return spriteContainer_.numChildren;
		}
		
		public function getSpriteIndexAt(depth:int):int {			
			var sprite:DisplayObject = getSpriteAt(depth);
			if(sprite) {
				return int(sprite.name);
			}
			else {
				return -1;
			}
		}
		
		public function getSpriteAt(depth:int):DisplayObject {
			if(depth >= this.numSprite) {
				return null;
			}
			return spriteContainer_.getChildAt(depth) as DisplayObject;
		}	
		
		public function getSpriteByName(name:String):DisplayObject {
			return spriteContainer_.getChildByName(name) as DisplayObject;			
		}
		
		public function removeSpriteByName(name:String):void {
			var sp:DisplayObject = getSpriteByName(name);
			if(sp) {
				spriteContainer_.removeChild(sp);
			}
		}
		
		public function get defaultTextFormat():TextFormat {
			return defaultTextFormat_;
		}
		
		public function set defaultTextFormat(format:TextFormat):void {
			if(format.letterSpacing == null) {
				format.letterSpacing = 0;
			}
			defaultTextFormat_ = format;
			textField_.defaultTextFormat = format;
		}
		
		public function get type():String {
			return textField_.type;
		}
		
		public function set type(value:String):void {
			textField_.type = value;			
			textField_.addEventListener(Event.SCROLL, onScroll);
			if(value == INPUT) {				
				textField_.addEventListener(Event.CHANGE, onChange);
				textField_.addEventListener(TextEvent.TEXT_INPUT, onTextInput);
				textField_.addEventListener(MouseEvent.MOUSE_UP, onSelection);
				textField_.addEventListener(MouseEvent.MOUSE_OUT, onSelection);
			}			
		}
		
		public function set selectable(isSelectable:Boolean):void {
			this.textField_.selectable = isSelectable;
		}
		
		public function get selectable():Boolean {
			return this.textField_.selectable;
		}
		
		/**
		 * 判断当前版本是否高于11,2
		 * 
		 */
		private function checkVersion():void 
		{ 
			var verstr:String = Capabilities.version; 
			trace("Flash Player Version is " + verstr); 
			var verary:Array = verstr.split(/[,\ ]/); 
			var major:int = int(verary[1]);
			var sec:int = int(verary[2]);
			
			if(major > 11){
				_isNewPlayer = true;
				return;
			}
			
			if(major == 11 && sec > 2){
				_isNewPlayer = true;
				return;
			}
			_isNewPlayer = false;
		}
		
	}	
}