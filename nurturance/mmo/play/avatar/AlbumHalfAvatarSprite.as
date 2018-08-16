package mmo.play.avatar
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	import mmo.common.DisplayUtil;
	import mmo.interfaces.IDispose;
	
	public class AlbumHalfAvatarSprite extends Sprite implements IDispose
	{
		private const CutWidth:Number = 120;
		private const CutHeight:Number = 120;
		
		private var _bitmapData:BitmapData;
		private var _bitmap:Bitmap;
		private var _containerWidth:Number;
		private var _containerHeight:Number;
		private var _spEraser:Sprite;
		
		public function AlbumHalfAvatarSprite()
		{
		}
		
		public function setHalfAvatarSprite(width:int, height:int):void
		{
			this._containerWidth = width;
			this._containerHeight = height;
			this.graphics.clear();
			this.graphics.beginFill(0, 0);
			this.graphics.drawRect(0, 0, width, height);
			this.graphics.endFill();
			
			this.setMiddleDisplay();
		}
		
		public function drawAvatarSprite(avatarSp:Sprite):void
		{
			if (this._bitmapData == null)
			{
				this._spEraser = new Sprite();
				this._spEraser.graphics.beginFill(1, 1);
				this._spEraser.graphics.drawRect(0, 0, CutWidth, CutHeight);
				this._spEraser.graphics.endFill();
				
				this._bitmapData = new BitmapData(CutWidth, CutHeight, true, 0);
				this._bitmap = new Bitmap(this._bitmapData, "auto", true);
				this._bitmap.blendMode = BlendMode.LAYER;
				this.addChild(this._bitmap);
			}
			
			this._bitmapData.draw(this._spEraser, null, null, BlendMode.ERASE);
			this._bitmapData.draw(avatarSp, new Matrix(1, 0, 0, 1, 60, 325));
			
			this.setMiddleDisplay();
		}
		
		private function setMiddleDisplay():void
		{
			if (this._bitmap == null)
			{
				return;
			}
			
			DisplayUtil.scaleDisplay(this._bitmap, this._containerWidth, this._containerHeight);
			DisplayUtil.middleDisplay(this._bitmap, this._containerWidth, this._containerWidth);
		}
		
		public function dispose():void
		{
			DisplayUtil.stopAndRemove(this);
			if (this._bitmapData != null)
			{
				this._bitmapData.dispose();
				this._bitmapData = null;
			}
			this._bitmap = null;
			this._spEraser = null;
		}
	}
}