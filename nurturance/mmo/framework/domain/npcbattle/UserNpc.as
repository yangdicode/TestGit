package mmo.framework.domain.npcbattle
{
	import mmo.common.DateUtil;

	public class UserNpc
	{		
		private var _id:int;
		private var _lv:int;
		private var _favor:int;
		private var _gdate:Date;
		
		public function UserNpc()
		{		
		}
		
		public static function parse(data:Object):UserNpc
		{
			var userFairy:UserNpc = new UserNpc();	
			userFairy.parseData(data);
			return userFairy;
		}
		
		private function parseData(data:Object):void
		{
			_id = int(data.nid);
			_lv = int(data.lv);
			_favor = int(data.favor);
			_gdate = new Date(Number(data.gdate));
		}
		
		public function set npcLv(value:int):void{
			_lv = value;
		}
		
		public function set favor(value:int):void{
			_favor = value;
		}
		
		public function get npcId():int
		{
			return _id;
		}

		public function get npcLv():int
		{
			return _lv;
		}
		
		public function get favor():int
		{
			return _favor;
		}
		
		public function get getDate():Date
		{
			return _gdate;
		}

	}
}