package mmo.common {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.PixelSnapping;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	
	public class DisplayUtil extends Dictionary {
	
		//~ public methods ----------------------------------------------------
		
		public function DisplayUtil() {
		}
		
		//~~~~~ MovieClip -----------------------------------------------------
		
		/**
		 * 用新元件替换旧元件，并设置新元件的坐标、大小等参数
		 * 
		 * @param placeHolder	被替换的旧元件
		 * @param displayObj	替换的新元件
		 * @param isSetSize	    是否改变大小
		 * 
		 * @return	true=替换成功
		 */
		public static function replace(placeHolder:DisplayObject, displayObj:DisplayObject, 
									     isSetSize:Boolean = true,isRemove:Boolean = true):Boolean {
			if(!placeOn(placeHolder,displayObj,isSetSize)){
				return false;
			}
			
			if(isRemove){
				placeHolder.parent.removeChild(placeHolder);
			}else{
				placeHolder.visible = false;
			}
			
			return true;
		}
		
		/**
		 * 将元件放进另一个元件位置上，并设置新元件的坐标、大小等参数
		 */		
		public static function placeOn(placeHolder:DisplayObject, displayObj:DisplayObject, 
									 	  isSetSize:Boolean = true):Boolean
		{
			if(placeHolder.parent == null || !placeHolder.parent.contains(placeHolder)) {
				return false;
			}
			
			displayObj.x = placeHolder.x;
			displayObj.y = placeHolder.y;
			
			if(isSetSize){
				displayObj.width = placeHolder.width;
				displayObj.height = placeHolder.height;
			}
			
			placeHolder.parent.addChildAt(displayObj, placeHolder.parent.getChildIndex(placeHolder));
			placeHolder.parent.swapChildren(placeHolder,displayObj);
			return true;
		}
		
		//~~~~~ Bitmap --------------------------------------------------------
		
		/**
		 * 将元件用位图替换
		 * 
		 * @param	displayObj	待替换的元件，必须位于显示列表上
		 * 
		 * @return	替换后的Bitmap
		 */
		public static function replaceAsBitmap(displayObj:DisplayObject):Bitmap {
			var parent:DisplayObjectContainer = displayObj.parent;
			if(parent == null || !parent.contains(displayObj)) {
				throw new Error("待缓存的元件不在显示列表中");
				return null;
			}
			
			var depth:int = parent.getChildIndex(displayObj);
			var ox:Number = displayObj.x;
			var oy:Number = displayObj.y;

			var bitmap:Bitmap = cacheAsBitmap(displayObj);
			if(bitmap == null) {
				return null;
			}
			
			bitmap.name = displayObj.name;
			bitmap.x += displayObj.x;
			bitmap.y += displayObj.y;

			parent.addChildAt(bitmap, depth);

			DisplayUtil.stopAndRemove(displayObj);
			
			return bitmap;
		}
		
		/**
		 * 将元件缓存为位图，并返回
		 * 因为矢量图中，子元件的注册点可以为负数，即它的包围矩阵的坐标可能为负数，
		 * 但位图的包围矩阵的坐标必须为整数，所以会自动调整坐标
		 * 
		 * 使用样例请见 mmo.framework.scene.SceneBase
		 * 
		 * @param	displayObj	待缓存的元件
		 * 						该元件不能被flip，scale等操作
		 * 
		 * @return	位图
		 */
		public static function cacheAsBitmap(displayObj:DisplayObject):Bitmap {
			var depth:int = 0;
			var father:DisplayObjectContainer = null;
			if(displayObj.parent != null) {
				father = displayObj.parent; 
				depth = father.getChildIndex(displayObj);
			}
			
			displayObj.addEventListener(Event.ADDED, onChangedByCaching, false, 999);
			displayObj.addEventListener(Event.REMOVED, onChangedByCaching, false, 999);
			displayObj.addEventListener(Event.ADDED_TO_STAGE, onChangedByCaching, false, 999);
			displayObj.addEventListener(Event.REMOVED_FROM_STAGE, onChangedByCaching, false, 999);
			
			var ox:Number = displayObj.x;
			var oy:Number = displayObj.y;
			
			displayObj.x = displayObj.y = 0;
			
			var mySprite:Sprite = new Sprite();
			mySprite.addChild(displayObj);
			
			var bounds:Rectangle = displayObj.getBounds(mySprite);
			var bitmap:Bitmap;
			
			if(bounds.width > 0 && bounds.height > 0) {
				var rect:Rectangle = new Rectangle();
				
				rect.x = int(bounds.x);
				rect.y = int(bounds.y);
				
				// 保存单元格大小
				rect.width = Number(bounds.width + bounds.x - Number(rect.x));
				rect.height = Number(bounds.height + bounds.y - Number(rect.y));
				
				
				var matrix:Matrix = new Matrix();
				matrix.translate(-rect.x, -rect.y);
				
				var bitmapData:BitmapData = new BitmapData(int(rect.width+1), int(rect.height+1), true, 0);
				bitmapData.draw(mySprite, matrix);
				
				bitmap = new Bitmap(bitmapData, PixelSnapping.AUTO, true);
				bitmap.x = bounds.x;
				bitmap.y = bounds.y;
			}
			
			displayObj.x = ox;
			displayObj.y = oy;
			
			if(father != null) {
				father.addChildAt(displayObj, depth);
			}
			
			displayObj.removeEventListener(Event.ADDED, onChangedByCaching, false);
			displayObj.removeEventListener(Event.REMOVED, onChangedByCaching, false);
			displayObj.removeEventListener(Event.ADDED_TO_STAGE, onChangedByCaching, false);
			displayObj.removeEventListener(Event.REMOVED_FROM_STAGE, onChangedByCaching, false);
			
			return bitmap;
		}
		
		/**
		 * 获得元件事实上的包围矩形
		 * 该算法不受元件翻转、缩放等Matrix操作的影响
		 * 
		 * @param	displayObj
		 * 
		 * @return	Rectangle
		 */
		public static function getActualBounds(displayObj:DisplayObject):Rectangle {
			var hasParent:Boolean = true;
			if(displayObj.parent == null) {
				hasParent = false;
				var container:Sprite = new Sprite();
				container.addChild(displayObj);
			}
			
			var ox:Number = displayObj.x;
			var oy:Number = displayObj.y;
			
			displayObj.x = 0;
			displayObj.y = 0;
			
			var rect:Rectangle = displayObj.getBounds(displayObj.parent);
			
			if(!hasParent) {
				displayObj.parent.removeChild(displayObj);
			}
			
			displayObj.x = ox;
			displayObj.y = oy;
			
			return rect;
		}
		
		//~~~~~ Color ---------------------------------------------------------
		
		/**
		 * 将显示对象更改为灰色显示
		 * 
		 * @param	target	待变色的显示对象
		 **/
		public static function applyGray(target:DisplayObject):void {
            var matrix:Array = new Array();
            matrix = matrix.concat([0.3086, 0.6094, 0.0820, 0, 0]); // red
            matrix = matrix.concat([0.3086, 0.6094, 0.0820, 0, 0]); // green
            matrix = matrix.concat([0.3086, 0.6094, 0.0820, 0, 0]); // blue
            matrix = matrix.concat([0,      0,      0,      1, 0]); // alpha

            applyFilter(target, matrix);
        }
		
		public static function applyRed(target:DisplayObject):void{
			var matrix:Array = new Array();
			matrix = matrix.concat([1, 0, 0, 0, 0]); // red
			matrix = matrix.concat([0, 0, 0, 0, 0]); // green
			matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			applyFilter(target, matrix);
		}
		
		public static function applyGreen(target:DisplayObject):void{
			var matrix:Array = new Array();
			matrix = matrix.concat([0, 0, 0, 0, 0]); // red
			matrix = matrix.concat([0, 1, 0, 0, 0]); // green
			matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			applyFilter(target, matrix);
		}
        
        /**
		 * 将显示对象的亮度调为-50
		 * 
		 * @param	target	待调整亮度的显示对象
		 **/
        public static function setBrightHalf(target:DisplayObject):void {
            var matrix:Array = new Array();
            matrix = matrix.concat([1,0,0,0,-100]); // red
            matrix = matrix.concat([0,1,0,0,-100]); // green
            matrix = matrix.concat([0,0,1,0,-100]); // blue
            matrix = matrix.concat([0,0,0,1,0]); 	// alpha

            applyFilter(target, matrix);
        }
        
		/**
		 * 设置滤镜，主要用于选中效果
		 * */
		public static function applyGlowFilter(target:DisplayObject,
											   color:uint = 0xFF0000, 
											   strength:Number = 2,
											   alpha:Number = 1.0, 
											   blurX:Number = 6.0, 
											   blurY:Number = 6.0, 
											   quality:int = 1, 
											   inner:Boolean = false, 
											   knockout:Boolean = false):void{
			var glowFilter:GlowFilter = new GlowFilter(color,
														alpha,
														blurX,
														blurY,
														strength,
														quality,
														inner,
														knockout);
			target.filters = [glowFilter];
		}
		
		/**
		 * 设置模糊滤镜加黑效果
		 */		
		public static function applyBlurFilter(target:DisplayObject,
											     blurX:Number = 2,
												 blurY:Number = 2,
								                 quality:int = BitmapFilterQuality.LOW,
												 isSetHalfBlack:Boolean = true)
		{
			if(isSetHalfBlack){
				var ct:ColorTransform = target.transform.colorTransform;
				ct.redMultiplier = 0.5;
				ct.greenMultiplier = 0.5
				ct.blueMultiplier = 0.5;
				target.transform.colorTransform = ct;
			}
			
			var bf:BlurFilter = new BlurFilter(blurX, blurY, quality);
			target.filters = [bf];
		}
		
        /**
         * 清除显示对象的滤镜
         * @param	target	待清除滤镜的显示对象
         **/
        public static function clearFilters(target:DisplayObject):void{
        	target.filters = null;
        }
		
		/**
		 * 获得显示对象某点的颜色值
		 * 
		 * @param	disObj		待取色的显示对象
		 * @param	x		
		 * @param	y
		 * @param	needARGB	是否需要32bit色
		 */
		public static function getColor(disObj:DisplayObject, 
				x:uint = 0, 
				y:uint = 0, 
				needARGB:Boolean = false) : uint {
            var bmpData:BitmapData = new BitmapData(disObj.width, disObj.height);
            bmpData.draw(disObj);
            var color:uint = !needARGB ? (bmpData.getPixel(int(x), int(y))) : (bmpData.getPixel32(int(x), int(y)));
            bmpData.dispose();
            return color;
        }
		
		//~~~~~ Align ---------------------------------------------------------
        
        /**
         * 计算显示对象A中某点在显示对象B中的相对坐标
         * 
         * @param	disObj1		显示对象A
         * @param	disObj2		显示对象B
         * @param	point		待计算的点
         * 
         * @return	相对坐标
         */
        public static function localToLocal(disObj1:DisplayObject, 
        		disObj2:DisplayObject, 
        		point:Point = null):Point {
            if(point == null) {
                point = new Point(0, 0);
            }
            point = disObj1.localToGlobal(point);
            point = disObj2.globalToLocal(point);
            return point;
        }
        
        /**
         * 调整显示对象的排列方式 
         * 
         * @param	disObj		待调整的显示对象
         * @param	bound		调整的相对范围矩形
         * @param	alignType	调整类型
         * @param	offset		相对范围的偏移量
         */
        public static function align(disObj:DisplayObject, 
        		bound:Rectangle = null, 
        		alignType:int = AlignType.MIDDLE_CENTER, 
        		offset:Point = null):void {
			if(alignType == AlignType.NONE) {
				return;
			}
			
        	// 默认排列对齐对象为全屏幕
            if(bound == null) {
                bound = new Rectangle(0, 0, 960, 560);
            }
            
            // 调整偏移量
            if(offset) {
                bound.offsetPoint(offset);
            }
            
            // 获得显示对象的包围矩形
            var rect:* = disObj.getRect(disObj);
            
            // 获得长宽差
            var deltaWidth:* = bound.width - disObj.width;
            var deltaHeight:* = bound.height - disObj.height;
            
            // 调整显示对象
            switch(alignType) {
                case AlignType.TOP_LEFT: {
                    disObj.x = bound.x;
                    disObj.y = bound.y;
                    break;
                }
                case AlignType.TOP_CENTER: {
                    disObj.x = bound.x + (deltaWidth >> 1) - rect.x;
                    disObj.y = bound.y;
                    break;
                }
                case AlignType.TOP_RIGHT: {
                    disObj.x = bound.x + deltaWidth - rect.x;
                    disObj.y = bound.y;
                    break;
                }
                case AlignType.MIDDLE_LEFT: {
                    disObj.x = bound.x;
                    disObj.y = bound.y + (deltaHeight >> 1) - rect.x;
                    break;
                }
                case AlignType.MIDDLE_CENTER: {
                    disObj.x = bound.x + (deltaWidth >> 1) - rect.x;
                    disObj.y = bound.y + (deltaHeight >> 1) - rect.y;
                    break;
                }
                case AlignType.MIDDLE_RIGHT: {
                    disObj.x = bound.x + deltaWidth - rect.x;
                    disObj.y = bound.y + (deltaHeight >> 1) - rect.y;
                    break;
                }
                case AlignType.BOTTOM_LEFT: {
                    disObj.x = bound.x;
                    disObj.y = bound.y + deltaHeight - rect.y;
                    break;
                }
				case AlignType.BOTTOM_CENTER: {
                    disObj.x = bound.x + (deltaWidth >> 1) - rect.x;
                    disObj.y = bound.y + deltaHeight - rect.y;
                    break;
                }
                case AlignType.BOTTOM_RIGHT: {
                    disObj.x = bound.x + deltaWidth - rect.x;
                    disObj.y = bound.y + deltaHeight - rect.y;
                    break;
                }
                default: {
                    break;
                }
            }
        }
        
        //~~~~~ Animation -----------------------------------------------------
              
        /**
         * 停止元件及其儿子的所有动画
         * 	@params	target	需要停止的元件
         */
        public static function stop(target:DisplayObject):void {
			if(target == null)
			{
				return;
			}
        	if(target is MovieClip) {
        		MovieClip(target).stop();
        	}
        	
        	if(target is DisplayObjectContainer) {
        		for(var i:int = 0, len:int = DisplayObjectContainer(target).numChildren; i < len; i++) {
        			stop(DisplayObjectContainer(target).getChildAt(i));
        		}
        	}
        	else
        	if(target is SimpleButton) {
        		if(SimpleButton(target).upState is DisplayObjectContainer) {
        			stop(SimpleButton(target).upState);
        		}
        		if(SimpleButton(target).downState is DisplayObjectContainer) {
        			stop(SimpleButton(target).downState);
        		}
        		if(SimpleButton(target).overState is DisplayObjectContainer) {
        			stop(SimpleButton(target).overState);
        		}
        		if(SimpleButton(target).hitTestState is DisplayObjectContainer) {
        			stop(SimpleButton(target).hitTestState);
        		}
        	}
        }
		
		/**
		 * 开始元件及其儿子的所有动画
		 * 	@params	target	需要停止的元件
		 */
		public static function play(target:DisplayObject):void{
			if(target is MovieClip) {
				MovieClip(target).play();
			}
			
			if(target is DisplayObjectContainer) {
				for(var i:int = 0, len:int = DisplayObjectContainer(target).numChildren; i < len; i++) {
					play(DisplayObjectContainer(target).getChildAt(i));
				}
			}
			else
				if(target is SimpleButton) {
					if(SimpleButton(target).upState is DisplayObjectContainer) {
						play(SimpleButton(target).upState);
					}
					if(SimpleButton(target).downState is DisplayObjectContainer) {
						play(SimpleButton(target).downState);
					}
					if(SimpleButton(target).overState is DisplayObjectContainer) {
						play(SimpleButton(target).overState);
					}
					if(SimpleButton(target).hitTestState is DisplayObjectContainer) {
						play(SimpleButton(target).hitTestState);
					}
				}
		}

        /**
         * 停止元件及其儿子的所有动画，并从舞台移除
         * 	@params	target	需要停止并从显示列表移除的元件
         */
        public static function stopAndRemove(target:DisplayObject):Boolean {
        	if(target == null)
			{
				return false;
			}
			stop(target);
        	if(target.parent != null) {
        		var parent:DisplayObjectContainer = target.parent;
        		parent.removeChild(target);
        		return true;
        	}
        	return false;
        }
        
        //~~~~~ Scale ---------------------------------------------------------
        
        /**
         * 缩放元件
         * 当宽和高其中一个为0时，按传入的值等比缩放
         * 当两个都传入时，按小的缩放
         **/
        public static function scaleDisplay(view:DisplayObject, appointWidth:Number = 0, appointHeight:Number = 0):void
		{
			var scalX:Number = appointWidth / view.width * view.scaleX;
			var scalY:Number = appointHeight / view.height * view.scaleY;
			var scal:Number;
			if (appointWidth > 0 && appointHeight > 0)
			{
				scal = scalX < scalY ? scalX : scalY;
			}
			else if (appointWidth > 0)
			{
				scal = scalX;
			}
			else if (appointHeight > 0)
			{
				scal = scalY;
			}
			else
			{
				return;
			}
			view.scaleX = scal;
			view.scaleY = scal;
		}
		
		//~ disaffirm public methods ------------------------------------------------
		
		/**
		 * 上下左右居中元件
		 * 元件必须有父亲
		 * 传入要居中的元件的父亲的大小，设置元件的x,y达到居中，元件注册点可以在任意位置
		 * */
		public static function middleDisplay(view:DisplayObject, containerWidth:Number, containerHeight:Number):void
		{
			view.x = 0;
			view.y = 0;
			var r:Rectangle = view.getBounds(view.parent);
			var regX:Number = 0 - r.x;
			var regY:Number = 0 - r.y;
			view.x = (containerWidth - view.width) / 2 + regX;
			view.y = (containerHeight - view.height) / 2 + regY;
		}
		
		public static function middleAddChild(father:DisplayObjectContainer, child:DisplayObject):void
		{
			var rc:Rectangle = child.getBounds(child);
			var rf:Rectangle = father.getBounds(father);
			
			var wChild:Number = rc.width*child.scaleX;
			var hChild:Number = rc.height*child.scaleY;
			var bxChild:Number = rc.x * child.scaleX;
			var byChild:Number = rc.y * child.scaleY;
			
			var wFather:Number = rf.width * father.scaleX;
			var hFather:Number = rf.height * father.scaleY;
			var bxFather:Number = rf.x * father.scaleX;
			var byFather:Number = rf.y * father.scaleY;
			
			child.x = (wFather - wChild)/2 + bxFather - bxChild;
			child.y = (hFather - hChild)/2 + byFather - byChild;
			father.addChild(child);
		}
		
		/**
		 * 把元件放在左上，使他父亲对外来说注册点在(0,0)
		 * 元件必须有父亲
		 * */
		public static function leftUpDisplay(view:DisplayObject):void
		{
			view.x = 0;
			view.y = 0;
			var r:Rectangle = view.getBounds(view.parent);
			var regX:Number = 0 - r.x;
			var regY:Number = 0 - r.y;
			view.x = regX;
			view.y = regY;
		}
		
		/**
		 * 将target参考refObj设置为居中自适应大小
		 * */
		public static function setCenter(refWidth:Number, refHeight:Number, target:DisplayObject, border:int = 0):void{
			var widthScale:Number = refWidth / target.width;
			var heightScale:Number = refHeight / target.height;
			
			if(widthScale < heightScale){
				target.scaleX = widthScale;
				target.scaleY = widthScale;
				target.x = border;
				target.y = border + ( refHeight - target.height) /2;
			}else{
				target.scaleY = heightScale;
				target.scaleX = heightScale;
				target.x = border + (refWidth - target.width) /2; 
				target.y = border;
			}			
		}		
		
		//~ txt public methods ------------------------------------------------
		/**
		 * 设置文本颜色显示，
		 * 用于Tips显示不符合条件的情况
		 * @param txt   文本框
		 * @param txtStr 显示文本
		 * @param isAble 根据情况判断显示，true不显示，false显示
		 * @param color  显示颜色
		 */		
		public static function setTxtContent(txt:TextField,txtStr:String,isAble:Boolean,color:uint = 0xFF0000):void
		{
			txt.htmlText = txtStr;
			if(!isAble){
				txt.textColor = color;
			}
		}
		
		//~ mouse public methods ------------------------------------------------
		/**
		 * 设置鼠标滑动效果(划过改变大小)
		 */		
		public static function setMouseOverScale(displayObj:DisplayObject,scaleNum:Number = 1.1):void
		{
			displayObj.addEventListener(MouseEvent.ROLL_OVER,
			function ():void
			{
				displayObj.scaleX = scaleNum;
				displayObj.scaleY = scaleNum;
			});
			displayObj.addEventListener(MouseEvent.ROLL_OUT,
			function ():void
			{
				displayObj.scaleX = 1;
				displayObj.scaleY = 1;
			});
		}
		
		/**
		 * 设置鼠标滑动效果(划过添加滤镜)
		 */		
		public static function setMouseOverGlowFilter(displayObj:DisplayObject,
													  color:uint = 0xFF0000, 
													  strength:Number = 2,
													  alpha:Number = 1.0, 
													  blurX:Number = 6.0, 
													  blurY:Number = 6.0, 
													  quality:int = 1, 
													  inner:Boolean = false, 
													  knockout:Boolean = false):void
		{
			displayObj.addEventListener(MouseEvent.ROLL_OVER,
			function ():void
			{
				applyGlowFilter(displayObj,color,strength,alpha,blurX,blurY,quality,inner,knockout);
			});
			displayObj.addEventListener(MouseEvent.ROLL_OUT,
			function ():void
			{
				clearFilters(displayObj);
			});
		}
		
		/**
		 * 让文本框不响应鼠标
		 * */
		public static function setTextFieldMouseDisabled(container:Sprite):void
		{
			var child:DisplayObject;
			for( var i:int = 0; i < container.numChildren; i++)
			{
				child = container.getChildAt(i);
				if(child is TextField)
				{
					TextField(child).mouseEnabled = false;
					TextField(child).mouseWheelEnabled = false;
				}else if(child is Sprite)
				{
					setTextFieldMouseDisabled(child as Sprite);
				}	
			}	
		}	
		
		/**
		 *  根据用户定制的字符表，获取特定的美术字体,
		 *  @param str: 输入一个字符串， 如"35140", 输出的结果就是这个字符串的美术字体
		 *  @param characters: 可以输入定制的字体，但是格式要有10个实例，
		 *  	分别为0-9的美术字， 每一个实例名字为"char_"+数字， 例如：0的美术字实例名字为："char_0"
		 */
		public static function getArtFontFromString(str:String, characters:MovieClip):Sprite
		{
			var res:Sprite = new Sprite();
			for(var i:int=0; i < str.length; i++)
			{
				if(str.charAt(i) < '0' || str.charAt(i) > '9')
					continue;
				var curMc:Bitmap = DisplayUtil.cacheAsBitmap(characters.getChildByName("char_" + str.charAt(i)));
				curMc.x = res.width+1;
				res.addChild(curMc);
			}
			return res;
		}
		
		/**
		 * 设置元件可否点击状态
		 * @param target 目标
		 * @param enable 是否可点击
		 * @param needGrayFilter 不可点时是否需要灰掉元件
		 */		
		public static function setButtonState(target:InteractiveObject, enable:Boolean, needGrayFilter:Boolean = true):void
		{
			target.mouseEnabled = enable;
			if(target is Sprite)
				Sprite(target).mouseChildren = enable;
			if(!enable && needGrayFilter)
				applyGray(target);
			else
				clearFilters(target);
		}
		
		/**
		 * 干掉目标元件的所以孩子 
		 * @param target
		 * 
		 */		
		public static function removeAllChild(target:DisplayObjectContainer):void
		{
			while(target.numChildren > 0)
			{
				target.removeChildAt(0);
			}
		}
		
        //~ private methods ---------------------------------------------------
        
        private static function applyFilter(target:DisplayObject, matrix:Array):void {
            var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
            var filters:Array = new Array();
            filters.push(filter);
            target.filters = filters;
        }	
		
		private static function onChangedByCaching(e:Event):void {
			e.stopImmediatePropagation();
			e.stopPropagation();
		}
        
	}
}