package mmo.play.avatar.skin.displayer
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;

	/**
	 * 负责管理衣服的元件数组, 包括将他们转化和缓存为位图
	 *
	 * */
	public class SkinDisplayer extends EventDispatcher
	{
		public function SkinDisplayer(spriteSheet:Sprite, clothesNo:String)
		{
			_clothesNo = clothesNo;
			parseSpriteSheet(spriteSheet);
		}

		private var _frameDataArr:Array;
		
		private var _clothesNo:String;
		
		public function dispose():void
		{
			var arr:Array;
			var frameData:FrameData;
			for (var i:int = 0; i < _frameDataArr.length; i++)
			{
				arr = _frameDataArr[i];
				for (var j:int = 0; j < arr.length; j++)
				{
					if(arr[j] is FrameData && arr[j] != FrameData.emptyFrameData)
					{	
						
						FrameData(arr[j]).dispose();
					}
					arr[j] = null;
				}	
			}
			_frameDataArr = null;
		}

		/**
		 * 获取帧显示信息
		 * @param row
		 * @param col
		 * @return
		 *
		 */
		public function getFrameData(row:int, col:int):FrameData
		{
			// 尝试是否有缓存好的位图
			var frameData:FrameData = null;		
			if (this._frameDataArr[row] == null)
			{
				return frameData;
			}
			var data:* = this._frameDataArr[row][col];
			if(!data)
			{
				return frameData;
			}
			return _frameDataArr[row][col] as FrameData;
		}
		
		private function parseSpriteSheet(container:Sprite):void
		{
			this._frameDataArr = new Array();
			var childs:Array = new Array();
			var child:Sprite = null;
			for (var index:int = 0; index < container.numChildren; index++)
			{
				child = container.getChildAt(index) as Sprite;;
				child.y = Math.round(child.y);
				child.x = Math.round(child.x);
				childs.push(child);
			}
			childs.sortOn(["y", "x"], [Array.NUMERIC, Array.NUMERIC]);
			var y:int = int.MIN_VALUE;
			var rowItems:Array = [];
			for each (child in childs)
			{
				if (child.y != y)
				{
					rowItems = [];
					this._frameDataArr.push(rowItems);
					y = child.y;
				}
				child.x = 0;
				child.y = 0;
				container.removeChild(child);
				var fd:FrameData = new FrameData(_clothesNo + (_frameDataArr.length - 1) + rowItems.length , child);
				rowItems.push(fd);
			}
		}
	}
}

