package mmo.framework.domain.fairy
{
	public class Fairy
	{
		private var _id:int;
		private var _name:String;
		private var _typeName:String;
		private var _useTypeName:String;
		private var _maxLevel:int;
		private var _cost:int;
		private var _starLevel:int;
		private var _mainSkillId:int;
		private var _leaderSkillId:int;
		private var _sellPrice:int;
		private var _gainWay:String;
		private var _extData:Object;
		
		private var _subTypeName:String;
		private var _subUseTypeName:String;
		private var _awakens:Array;
		
		public function Fairy(id:int, maxLevel:int, cost:int, starLevel:int, mainSkillId:int, leaderSkillId:int, sellPrice:int, 
							  name:String, typeName:String, subTypeName:String, useTypeName:String, subUseTypeName:String, gainWay:String, awakens:Array, extData:Object=null)
		{
			this._id = id;
			this._name = name;
			this._typeName = typeName;
			this._subTypeName = subTypeName;
			this._useTypeName = useTypeName;
			this._subUseTypeName = subUseTypeName;
			this._maxLevel = maxLevel;
			this._cost = cost;
			this._starLevel = starLevel;
			this._mainSkillId = mainSkillId;
			this._leaderSkillId = leaderSkillId;
			this._sellPrice = sellPrice;
			this._gainWay = gainWay;
			this._awakens = awakens;
			this._extData = extData;
		}
		
		public function get fairyId():int
		{
			return this._id;
		}
		
		public function get name():String
		{
			return this._name;
		}
		
		public function get typeName():String
		{
			return this._typeName;
		}
		
		public function get type():int
		{
			return FairysType.getFairyTypeByTypeName(this._typeName);
		}
		
		public function get subTypeName():String
		{
			return this._subTypeName;
		}
		public function get subType():int
		{
			return FairysType.getFairyTypeByTypeName(this._subTypeName);
		}
		
		public function hasType(type:int):Boolean
		{
			if (type==this.type || type==this.subType)
			{
				return true;
			}
			return false;
		}
		
		public function get useTypeName():String
		{
			return this._useTypeName;
		}
		
		public function get useType():int
		{
			return FairysUseType.getFairyUseTypeByUseTypeName(this._useTypeName);
		}
		
		public function get subUseTypeName():String
		{
			return this._subUseTypeName;
		}
		public function get subUseType():int
		{
			return FairysUseType.getFairyUseTypeByUseTypeName(this._subUseTypeName);
		}
		
		public function hasUseType(useType:int):Boolean
		{
			if (useType==this.useType || useType==this.subUseType)
			{
				return true;
			}
			return false;
		}
		
		public function get maxLevel():int
		{
			return this._maxLevel;
		}
		
		public function get cost():int
		{
			return this._cost;
		}
		
		public function get starLevel():int
		{
			return this._starLevel;
		}
		
		public function get mainSkillId():int
		{
			return this._mainSkillId;
		}
		
		public function get leaderSkillId():int
		{
			return this._leaderSkillId;
		}
		
		public function get leaderSkill():FairyLeaderSkill
		{
			return Fairys.getFairyLeaderSkillById(this._leaderSkillId);
		}
		
		public function get mainSkill():FairyMainSkill
		{
			return Fairys.getFairyMainSkillById(this._mainSkillId);
		}
		
		public function get sellPrice():int
		{
			return this._sellPrice;
		}
		
		public function get evolveTargets():Array
		{
			var targets:Array = [];
			for each(var evolve:FairyEvolve in Fairys.getFairyEvolves())
			{
				if (evolve.originId == this._id)
				{
					targets.push(evolve.targetId);
				}
			}
			return targets;
		}
		public function get superEvolveTargets():Array
		{
			var targets:Array = [];
			for each(var evolve:FairySuperEvolve in Fairys.getFairySuperEvolves())
			{
				if (evolve.originId == this._id)
				{
					targets.push(evolve.targetId);
				}
			}
			return targets;
		}
		
		public function get awakens():Array
		{
			return this._awakens;
		}
		
		public function get equipDesc():String
		{
			return Fairys.getEquipDesc(this._id);
		}
		
		public function get gainWay():String
		{
			return this._gainWay;
		}
		
		public function get extData():Object
		{
			return this._extData;
		}
	}
}