package mmo.framework.domain.npcbattle
{
	import mmo.framework.domain.profession.ProfessionBase;

	public class NpcBattleDefine extends ProfessionBase
	{
		
		private var _monsterId:int;
		private var _monsterLv:int;
		private var _inviteValue:int;
		private var _npcTypeCode:String;
		private var _nbSkillId:int;
		private var _bookDesc:String;
		private var _bookWay:String;
		private var _proId:int;
		private var _starLv:int;
		
		public function NpcBattleDefine(id:int,name:String,monster:String,proId:int,des:String,inviteValue:int,
								initWeapon:int,backGroundStory:String,isVip:int,
								phyAttLv:int, magAttLv:int, lifeLv:int, phyDefLv:int, magDefLv:int, speedLv:int,
								npcTypeCode:String,nbSkillId:int,bookDesc:String,bookWay:String, starLv:int)
		{
			super(id, name, des, backGroundStory, isVip, 0, 0, 0, initWeapon, phyAttLv, magAttLv, lifeLv, phyDefLv, magDefLv, speedLv);
			_proId = proId;
			_inviteValue = inviteValue;
			initMonster(monster);
			_npcTypeCode = npcTypeCode;
			_nbSkillId = nbSkillId;
			_bookDesc = bookDesc;
			_bookWay = bookWay;
			_starLv = starLv;
		}
		
		/** "1-1"(id-lv) **/
		public function get monsterId():int
		{
			return _monsterId;
		}
		
		public function get monsterLv():int
		{
			return _monsterLv;
		}
		
		public function get inviteValue():int
		{
			return _inviteValue;
		}
		
		public function get typeCode():String
		{
			return _npcTypeCode;
		}
		
		public function get nbSkillId():int
		{
			return _nbSkillId;
		}
		
		/*** 英雄图鉴中的描述  **/
		public function get bookDesc():String{
			return _bookDesc;
		}
		
		/**  获得方式 **/
		public function get bookWay():String{
			return _bookWay;
		}
		
		private function initMonster(monster:String):void
		{
			var arr:Array = monster.split("-");
			_monsterId = int(arr[0]);
			_monsterLv = int(arr[1]);
		}

		public function get proId():int
		{
			return _proId;
		}

		/**
		 * 星级
		 */
		public function get starLv():int
		{
			return _starLv;
		}

		
	}
}