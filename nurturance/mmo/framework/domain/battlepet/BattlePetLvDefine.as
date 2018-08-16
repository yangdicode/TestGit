package mmo.framework.domain.battlepet
{
	public class BattlePetLvDefine
	{
		
		private var _id:int;
		private var _level:int;
		private var _learnSkill:Array;
		private var _attackSlotNum:int;
		private var _aidSlotNum:int;
		private var _healSlotNum:int;
		private var _haloSlotNum:int;
		private var _attackPow:int;
		private var _magicPow:int;
		private var _agility:int;
		private var _lvUpNeedExp:int;
		
		public function BattlePetLvDefine(id:int, level:int, learnSkill:String, attackSlotNum:int, aidSlotNum:int, healSlotNum:int, 
										  haloSlotNum:int, attackPow:int, magicPow:int, agility:int, lvUpNeedExp:int)
		{
			_id = id;
			_level = level;
			_learnSkill = initSkill(learnSkill);
			_attackSlotNum = attackSlotNum;
			_aidSlotNum = aidSlotNum;
			_healSlotNum = healSlotNum;
			_haloSlotNum = haloSlotNum;
			_attackPow = attackPow;
			_magicPow = magicPow;
			_agility = agility;
			_lvUpNeedExp = lvUpNeedExp;
		}
		
		private function initSkill(skillStrs:String):Array
		{
			var arr:Array = new Array();
			var skills:Array = skillStrs.split(",");
			for each(var skillId:String in skills)
			{
				arr.push(int(skillId));
			}
			return arr;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get level():int
		{
			return _level;
		}
		
		public function get learnSkill():Array
		{
			return _learnSkill;
		}
		
		public function get atatckSlotNum():int
		{
			return _attackSlotNum;
		}
		
		public function get aidSlotNum():int
		{
			return _aidSlotNum;
		}
		
		public function get healSlotNum():int
		{
			return _healSlotNum;
		}
		
		public function get haloSlotNum():int
		{
			return _healSlotNum;
		}
		
		public function get attackPow():int
		{
			return _attackPow;
		}
		
		public function get magicPow():int
		{
			return _magicPow;
		}
		
		public function get agility():int
		{
			return _agility;
		}
		
		public function get lvUpNeedExp():int
		{
			return _lvUpNeedExp;
		}
		
	}
}