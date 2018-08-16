package mmo.framework.domain.cardmap
{
	/**
	 * 卡片图鉴数据定义 
	 * @author liyawei
	 */	
	
	public class CardMap
	{
		private var _cardNo:String;
		
		private var _cardId:int;
		
		private var _cardName:String;
		
		private var _cardMapType:int;
		
		private var _cardFrom:String;
		
		private var _cardIntro:String;
		
		
		public function CardMap(cardNo:String,cardId:int,cardName:String,cardMapType:int,
								  cardFrom:String,cardIntro:String)
		{
			this._cardNo = cardNo;
			this._cardId = cardId;
			this._cardName = cardName;
			this._cardMapType = cardMapType;
			this._cardFrom = cardFrom;
			this._cardIntro = cardIntro;
		}
		
		/**
		 * 卡片编号
		 */		
		public function get cardNo():String
		{
			return _cardNo;
		}
		
		/**
		 * 卡片Id
		 */	
		public function get cardId():int
		{
			return _cardId;
		}
		
		/**
		 * 卡片名称
		 */		
		public function get cardName():String
		{
			return _cardName;
		}
		
		/**
		 * 卡片类型
		 */		
		public function get cardMapType():int
		{
			return _cardMapType;
		}

		/**
		 * 卡片出处
		 */		
		public function get cardFrom():String
		{
			return _cardFrom;
		}
		
		/**
		 * 卡片介绍
		 */		
		public function get cardIntro():String
		{
			return _cardIntro;
		}
	}
}