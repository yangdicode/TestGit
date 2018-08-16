package mmo.framework.domain.twingift
{
	public class TwinUserGift
	{
		private var _giftId:int;
		private var _boxId:int;
		private var _infos:Array;
		private var _sender:String;
		private var _receiver:String;
		private var _date:Date;
		
		public function TwinUserGift(info:Object)
		{
			_giftId = info["giftStyle"];
			_boxId = info["boxStyle"];
			_infos = [info["letters1"], info["letters2"]];
			_sender = info["senderName"];
			_receiver = info["receiverName"];
			_date = new Date(info["presentTime"]);
		}

		public function get giftId():int
		{
			return _giftId;
		}

		public function get boxId():int
		{
			return _boxId;
		}

		public function get infos():Array
		{
			return _infos;
		}

		public function get sender():String
		{
			return _sender;
		}

		public function get receiver():String
		{
			return _receiver;
		}

		public function get date():Date
		{
			return _date;
		}

	}
}