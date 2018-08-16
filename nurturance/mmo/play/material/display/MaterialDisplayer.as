package mmo.play.material.display
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.framework.domain.material.clothes.UserClothes;
	import mmo.play.material.MaterialFacade;
	import mmo.play.tips.TipsManager;

	public class MaterialDisplayer extends EventDispatcher
	{
		private var _view:Sprite;
		private var _icon:Sprite;
		public function MaterialDisplayer(view:Sprite)
		{
			_view = view;
			_view.buttonMode = true;
			_view.addEventListener(MouseEvent.CLICK, onClick);
			_view.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
			_view.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
			MovieClip(_view["container"]).gotoAndStop(1);
			TextField(_view["txtQuantity"]).mouseEnabled = false;
		}
		
		private var _userMaterial:UserMaterial;
		public function update(um:UserMaterial):void
		{
			_userMaterial = um;
			clear();
			if(_userMaterial != null)
			{
				_icon = MaterialFacade.getFacade(_userMaterial.materialType).getIcon(_userMaterial.materialId, _view.width - 16, _view.height - 16) as Sprite;
				_view.addChildAt(_icon, _view.getChildIndex(_view["txtQuantity"]));
				TextField(_view["txtQuantity"]).text = String(_userMaterial.available);
				DisplayUtil.middleDisplay(_icon, _view.width, _view.height);
				if(_userMaterial is UserClothes)
				{	
					TipsManager.getInstance().addCustomTips(_view, "library_res/clothestips", "mmo.res.customtips.ClothesTips", _userMaterial.material as Clothes)
				}else
				{
					TipsManager.getInstance().addComplexTips(_view, _userMaterial.material.name, _userMaterial.material.description);
				}	
			}	
		}	
		
		private function onClick(evt:MouseEvent):void
		{
			if(_userMaterial == null)
			{
				return;
			}	
			var event:MaterialDisplayEvent = new MaterialDisplayEvent(MaterialDisplayEvent.ON_CHOOSE_MATERIAL);
			event.userMaterial = _userMaterial;
			this.dispatchEvent(event);
		}	
		
		private function onRollOver(evt:MouseEvent):void
		{
			MovieClip(_view["container"]).gotoAndStop(2);
		}	
		
		private function onRollOut(evt:MouseEvent):void
		{
			MovieClip(_view["container"]).gotoAndStop(1);
		}
		
		private function clear():void
		{
			if(_icon != null && _view.contains(_icon))
			{
				TipsManager.getInstance().removeTips(_view);
				DisplayUtil.stopAndRemove(_icon);
				_icon = null;
				TextField(_view["txtQuantity"]).text = "";
			}	
		}	
		
		public function dispose():void
		{
			
		}	

	}
}