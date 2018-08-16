package mmo.play.panel.bonuspanel
{
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.framework.domain.market.Goods;
	import mmo.framework.domain.market.GoodsDataHelper;
	import mmo.play.helper.CommonHelper;
	import mmo.play.helper.MyYubeiHelper;
	import mmo.play.info.ModelInfo;
	import mmo.util.component.quantity.QuantityComponent;
	import mmo.util.component.quantity.QuantityComponentEvent;

	public class BuyDaibiComponent
	{
		private var GoodsId:int = 3472;
		private var _qc:QuantityComponent;
		private var _view:Sprite;
		
		private var _isCustomBuy:Boolean;

		private var _buyFunc:Function;
		
		private var _price:int = 1;
		private var _maxCount:int = 99;
		
		public function BuyDaibiComponent(container:Sprite, goodsId:int)
		{
			_view = container;
			GoodsId = goodsId;
			_isCustomBuy = false;
			
			var goods:Goods = GoodsDataHelper.getGoodsBuyGoodsId(goodsId);
			if(goods != null)
			{
				_price = goods.price;
			}
			initPanel();
		}
		
		public function dispose():void
		{
			_qc.removeEventListener(QuantityComponentEvent.QUANTITYCHANGE, onChange);
			_qc.dispose();
			_qc = null;
			_view = null;
		}
		
		public function setBuyFuc(func:Function):void
		{
			_isCustomBuy = true;
			_buyFunc = func;
		}
		
		public function setPrice(value:int):void
		{
			_price = value;
			setMaxValue();
		}
		
		public function setMaxCount(value:int):void
		{
			_maxCount = value;
			setMaxValue();
		}
		
		public function get qc():QuantityComponent
		{
			return _qc;
		}
		
		private function initPanel():void
		{
			_qc = new QuantityComponent(_view["txtCount"], _view["btnMinus"], _view["btnAdd"]);
			setMaxValue();
			_qc.addEventListener(QuantityComponentEvent.QUANTITYCHANGE, onChange);
			_qc.quantity = 0;
			
			MyYubeiHelper.setTxtAndBtn(_view["txtYb"],_view["btnCast"],onScoreChanged);
			
		}
		
		private function onScoreChanged():void
		{
			setMaxValue();
			_qc.quantity = 0;
		}
		
		private function onChange(evt:QuantityComponentEvent):void
		{
			var btn:InteractiveObject = _view["btnSure"] as InteractiveObject;
			var txtNeedYb:TextField = TextField(_view["txtNeedYubi"]);
			if(txtNeedYb != null)
			{
				txtNeedYb.text = (_qc.quantity * _price).toString();
			}
			
			if(_qc.quantity <= 0)
			{
				btn.removeEventListener(MouseEvent.CLICK, onClickBtn);
				DisplayUtil.applyGray(btn);
			}
			else
			{
				btn.addEventListener(MouseEvent.CLICK, onClickBtn);
				DisplayUtil.clearFilters(btn);
			}
		}
		
		private function onClickBtn(evt:MouseEvent):void
		{
			if(_isCustomBuy)
			{
				_buyFunc.apply(null,[_qc.quantity]);
			}
			else
			{
				CommonHelper.tryBuyGoods(GoodsId,_qc.quantity,buyEnd,true);
			}
		}
		
		private function buyEnd():void
		{
			setMaxValue();
			_qc.quantity = 0;
		}
		
		private function setMaxValue():void
		{
			_qc.maxQuantity = myMaxCount > _maxCount? _maxCount : myMaxCount;
			_qc.updateBtnState();
		}
		
		private function get myYubi():int
		{
			return ModelInfo.getUserInfo().yubi;
		}
		
		private function get myMaxCount():int
		{
			return myYubi/_price;
		}
	}
}