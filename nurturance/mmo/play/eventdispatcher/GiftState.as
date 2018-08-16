package mmo.play.eventdispatcher
{
	/*** 配置奥雅礼包状态事件的参数 ***/
	public class GiftState
	{
		private var _id:int;
		private var _canGet:Boolean;
		private var _tips:String;
		private var _hadGetAll:Boolean;
		
		/*** 配置奥雅礼包状态事件的参数 ***/
		public function GiftState()
		{
		}
		/** 礼包类型:和AoyaGiftsConfig中的id保持一致 **/
		public function get id():int
		{
			return this._id;
		}
		public function set id(id:int):void
		{
			this._id = id;
		}
		
		/** 礼包状态：是否可以领取礼物，true-可以领取,默认为false **/
		public function get canGet():Boolean
		{
			return this._canGet;
		}
		public function set canGet(canGet:Boolean):void
		{
			this._canGet = canGet;
		}
		
		/** 礼包对外开放的tips信息,默认为配置的礼包名称 **/
		public function get tips():String
		{
			return this._tips;
		}
		public function set tips(tips:String):void
		{
			this._tips = tips;
		}
		
		/** (在线时长专用) 礼包状态：是否领取了改礼包的全部礼物，true-全部已领取,默认为false **/
		public function get hadGetAll():Boolean
		{
			return this._hadGetAll;
		}
		public function set hadGetAll(hadGetAll:Boolean):void
		{
			this._hadGetAll = hadGetAll;
		}
	}
}