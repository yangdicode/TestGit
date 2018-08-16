package mmo.play.panel
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mmo.common.DisplayUtil;
	import mmo.play.tips.TipsManager;

	public class McBtnSetter
	{
		public function McBtnSetter()
		{
		}
		
		public static function addClickEvent(target:DisplayObject, func:Function):void
		{
			target.addEventListener(MouseEvent.CLICK, func);
		}
		
		public static function removeClickEvent(target:DisplayObject, func:Function):void
		{
			target.removeEventListener(MouseEvent.CLICK, func);
		}
		
		public static function setMcBtnState(mc:MovieClip, frame:int = 1, applyGray:Boolean = false, tipsMsg:String = "", buttonMode:Boolean = false, mouseEnabled:Boolean = true):void
		{
			mc.gotoAndStop(frame);
			mc.buttonMode = buttonMode;
			
			setMouseEnabled(mc, mouseEnabled);
			setTips(mc, tipsMsg);
			setGrayFitter(mc, applyGray);
		}
		
		public static function setBtnState(btn:SimpleButton, applyGray:Boolean = false, tipsMsg:String = ""):void
		{
			setGrayFitter(btn, applyGray);
			setTips(btn, tipsMsg);
		}
		
		public static function setMouseEnabled(sp:Sprite, mouseEnabled:Boolean):void
		{
			sp.mouseEnabled = mouseEnabled;
			sp.mouseChildren = mouseEnabled;
		}
		
		public static function setTips(io:InteractiveObject, tipsMsg:String = ""):void
		{
			if(tipsMsg == "")
			{
				TipsManager.getInstance().removeTips(io);
			}
			else
			{
				TipsManager.getInstance().addTips(io, tipsMsg);
			}
		}
		
		public static function setGrayFitter(displayObj:DisplayObject, applyGray:Boolean):void
		{
			if(applyGray)
			{
				DisplayUtil.applyGray(displayObj);
			}
			else
			{
				DisplayUtil.clearFilters(displayObj);
			}
		}
		
		public static function setGaryTipsRemoveClick(iObj:InteractiveObject, tips:String, clickFunc:Function):void
		{
			DisplayUtil.applyGray(iObj);
			TipsManager.getInstance().removeTips(iObj);
			TipsManager.getInstance().addTips(iObj, tips);
			iObj.removeEventListener(MouseEvent.CLICK, clickFunc);
		}
		
		public static function clearGaryTipsAddClick(iObj:InteractiveObject, clickFunc:Function):void
		{
			DisplayUtil.clearFilters(iObj);
			TipsManager.getInstance().removeTips(iObj);
			iObj.addEventListener(MouseEvent.CLICK, clickFunc);
		}
	}
}