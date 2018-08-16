package mmo.framework.domain.plant
{
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class GardenHelper
	{
		private static const HOUR_PRE_MIN:int = 60;
		private static const DAY_PRE_MIN:int = HOUR_PRE_MIN * 24;
		
		public function GardenHelper()
		{
		}
		
		/**
		 * 将分钟转化为xx天xx小时xx分钟的描述
		 * @param min
		 * @return 
		 */		
		public static function min2DHM(min:Number):String 
		{
			var day:Number = Math.floor(min / DAY_PRE_MIN);
			min -= day * DAY_PRE_MIN;
			
			var hour:Number = Math.floor(min / HOUR_PRE_MIN);
			min -= hour * HOUR_PRE_MIN;
			
			return (day == 0 ? "" : day + "天") + 
				(hour == 0 ? "" : hour + "小时") + 
				(min == 0 ? "" : min + "分钟");
		}
		
		/**
		 * 显示美术元件数字
		 * @param num 显示的数值
		 * @param lenght 元件长度 
		 * @return excursions 
		 */		
		public static function numShowHelper(target:Sprite, length:int, num:int=0, excursions:Array=null):void 
		{
			if (excursions == null)
			{
				excursions = [12, 5, 0];
			}
			var container:Sprite = target.getChildByName("container") as Sprite;
			container.x = 0;
			var numStr:String = num.toString();
			for (var i:int=0; i<length; ++i)
			{
				if (numStr.length == (i+1))
				{
					container.x += excursions[i];
					for (var k:int=0; k<length; ++k)
					{
						var mc:MovieClip = container.getChildByName("mcWei" + k) as MovieClip;
						if (k < numStr.length)
						{
							var frame:int = parseInt(numStr.charAt(k))+1;
							mc.gotoAndStop(frame);
							mc.visible = true;
						}
						else
						{
							mc.gotoAndStop(1);
							mc.visible = false;
						}
					}
					
				}
			}
		}
	}
}