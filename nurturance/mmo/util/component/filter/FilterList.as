package mmo.util.component.filter
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import mmo.util.component.filter.subbutton.BaseButton;
	
	public class FilterList extends Sprite
	{

		//~ constants ---------------------------------------------------------

		private static const TIME:Number = 0.5;
		private static const DEFAULT_HEIGHT:int = 150;

		//~ public methods ----------------------------------------------------

		public function FilterList(background:Sprite)
		{
			super();

			_maskHeight = DEFAULT_HEIGHT;
			this._background = background;
			this._buttonList = [];

			initView();
		}

		private var _background:Sprite;

		private var _board:Sprite;

		/** 所有按钮的总高度 */
		private var _buttonsHeight:int;

		/**
		 * 列表高度
		 * 列表展开的最大高度，当列表中的项目的实际高度超过该高度时，列表会自动滚动
		 */
		private var _maskHeight:int;

		//~ fields ------------------------------------------------------------

		/**
		 * 是否已显示
		 * 1=隐藏
		 * 2=正在显示
		 * 4=已经显示
		 * 8=正在隐藏
		 */
		private var _showingState:int;

		private var _buttonList:Array;

		public function addButton(button:BaseButton):void
		{
			var hitSprite:Sprite = (button as BaseButton).hitSprite;

			//button.x = (50 - hitSprite.width) * 0.5;
			button.y = this._buttonsHeight + 2;

			this._buttonsHeight = button.y + hitSprite.height;

			this._board.addChild(button);
			this._buttonList.push(button);

			this._background.height = this._buttonsHeight + 4 < this._maskHeight ? this._buttonsHeight + 4 : this._maskHeight;
			
		}
		
		public function get buttonList():Array
		{
			return _buttonList;	
		}	
		
		public function dispose():void
		{
			stopMoving();

			this._buttonList = null;
		}
		
		public function immediatelyHide():void{
			if (this._showingState == 2)
			{
				// 停止运动
				stopMoving();
			}
			onHided();
		}
		
		public function hide():void
		{
			// 如果是正在显示状态，先停止运动
			if (this._showingState == 2)
			{
				// 停止运动
				stopMoving();
			}

			// 如果是已经显示状态，或正在显示状态，则启动隐藏动画
			if ((this._showingState & 6) > 0)
			{
				refreshMask();

				// 更新状态
				this._showingState = 8;

				TweenLite.to(this._board, 0.4, {"alpha": 0, "ease": Cubic.easeIn});
				TweenLite.to(this._background, 0.4, {"alpha": 0, "onComplete": onHided, "ease": Cubic.easeIn});
			}
		}

		override public function hitTestPoint(x:Number, y:Number, shapeFlag:Boolean = false):Boolean
		{
			if ((this._showingState & 1) > 0)
			{
				return false;
			}
			return super.hitTestPoint(x, y, shapeFlag);
		}

		public function setMaskHeight(height:int):void
		{
			this._maskHeight = height;
		}

		public function show():void
		{
			// 如果是正在隐藏状态，先停止运动
			if (this._showingState == 8)
			{
				// 停止运动
				stopMoving();
			}

			// 如果是隐藏状态，或正在隐藏状态，则启动显示动画
			if ((this._showingState & 9) > 0)
			{
				refreshMask();

				// 更新状态
				this._showingState = 2;

				TweenLite.to(this._board, 0.3, {"alpha": 1, "ease": Cubic.easeIn});
				TweenLite.to(this._background, 0.3, {"alpha": 1, "onComplete": onShowed, "ease": Cubic.easeIn});

				this.visible = true;
			}
		}
		
		public function rollY():void
		{
			if ((this._showingState & 6) > 0)
			{
				if (this._board.height > this._maskHeight)
				{
					// 滚动效果
					var currentY:int = mouseY;
					if (currentY < 5)
					{
						currentY = 5;
					}
					if (currentY > this._maskHeight - 5)
					{
						currentY = this._maskHeight - 5;
					}
					var dis:Number = (currentY - 5) / (this._maskHeight - 30) * (this._maskHeight - this._board.height);
					this._board.y = dis;
				}
			}
		}

		private function initView():void
		{
			this._background.alpha = 0;
			this.addChild(this._background);

			this._board = new Sprite();
			this._board.alpha = 0;
			this.addChild(this._board);

			// 初始为影藏状态
			onHided();

			this._buttonsHeight = 0;
		}

		private function onHided():void
		{
			if (this.parent != null && this.parent.contains(this))
			{
				this.parent.removeChild(this);
			}

			this._showingState = 1;

			this.visible = false;
		}

		//~ private methods ---------------------------------------------------

		private function onShowed():void
		{
			this._showingState = 4;
		}

		private function refreshMask():void
		{
			var pt:Point = this.localToGlobal(new Point(0, 0));

			var mask:Sprite = new Sprite();
			mask.graphics.beginFill(0xFF0000);
			mask.graphics.drawRect(pt.x - 1, pt.y - 1, this.width + 2, this._maskHeight + 2);
			mask.graphics.endFill();

			this.mask = mask;
		}

		private function stopMoving():void
		{
			TweenLite.killTweensOf(this._background);
			TweenLite.killTweensOf(this._board);
		}
	}
}