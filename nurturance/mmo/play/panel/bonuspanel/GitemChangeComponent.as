package mmo.play.panel.bonuspanel
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.framework.domain.material.gitem.UserGItem;
	import mmo.play.helper.CommonHelper;
	import mmo.play.helper.NumHelper;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.IMaterialFacade;
	import mmo.play.material.MaterialFacade;
	import mmo.play.material.UserMaterialEvent;
	import mmo.play.material.changehelper.MaterialChangeHelper;
	import mmo.play.material.gitem.GItemFacade;
	import mmo.play.panel.CommonPanel;
	
	public class GitemChangeComponent
	{
		
		private var TempKey:String = "388:";
		private var GItemId:int = 1429;
		
		private var NeedNum:Array = [60,60,20,20,30,30];
		private var BonusObj:Object = {
			"0":"2-3402",
			"1":"2-3401",
			"2":"3-1191",
			"3":"3-1192",
			"4":"2-3403",
			"5":"2-3404"
		}
			
		private var _mch:MaterialChangeHelper;
		private var _container:Sprite;
		
		public function GitemChangeComponent(container:Sprite,tempKey:String,gitemId:int,needCounts:Array,bonusObj:Object)
		{
			_container = container;
			this.TempKey = tempKey;
			this.GItemId = gitemId;
			this.NeedNum = needCounts;
			this.BonusObj = bonusObj;
			
			GItemFacade.instance.addEventListener(UserMaterialEvent.onQuantiyChange, onChange);
			setBonus();
		}
		
		public function dispose():void
		{
			GItemFacade.instance.removeEventListener(UserMaterialEvent.onQuantiyChange, onChange);
			_container = null;
		}
		
		private function onChange(evt:UserMaterialEvent):void
		{
			setBonus();
		}
		
		private function setBonus():void
		{
			var count:int = daibi;
			if(_container["count"] != null)
			{
				if(_container["count"] is TextField)
					TextField(_container["count"]).text = count.toString();
				if(_container["count"] is MovieClip)
					NumHelper.instance.setNumMc(_container["count"],count,1);
			}
			
			for(var i:int = 0; i<NeedNum.length; i++)
			{
				var btn:SimpleButton = _container["btnGet"+i] as SimpleButton;
				if(canGot(i))
				{
					DisplayUtil.clearFilters(btn);
					btn.addEventListener(MouseEvent.CLICK, onClickGet);
				}
				else
				{
					DisplayUtil.applyGray(btn);
					btn.removeEventListener(MouseEvent.CLICK, onClickGet);
				}
				
				var tip:Sprite = _container["getTip"+i] as Sprite;
				if(tip != null)
				{
					if(hadGot(i))
						tip.visible = true;
					else
						tip.visible = false;
				}
				
			}
		}
		
		private function onClickGet(evt:MouseEvent):void
		{
			var num:int = int(DisplayObject(evt.currentTarget).name.charAt(6));
			var key:String = TempKey + int(num + 1);
			CommonHelper.takeCommonGift(key, setBonus);
		}
		
		private function hadGot(num:int):Boolean
		{
			var str:String = BonusObj[num.toString()];
			var arr:Array = str.split("-");
			var mf:IMaterialFacade = MaterialFacade.getFacade(arr[0]);
			return mf.getMyMaterialNum(arr[1]) > 0;
		}
		
		private function canGot(num:int):Boolean
		{
			return NeedNum[num] <= this.daibi;
		}
		
		private function get daibi():int
		{
			var item:UserGItem = ModelInfo.getUserItems().getUserItemById(GItemId);
			var count:int = 0;
			if(item != null)
			{
				count = item.quantity;
			}
			return count;
		}
	}
}