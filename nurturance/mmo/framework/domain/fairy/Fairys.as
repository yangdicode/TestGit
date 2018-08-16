package mmo.framework.domain.fairy
{
	import flash.system.ApplicationDomain;

	public class Fairys
	{
		private static const FairyPlayerLevelsConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyPlayerLevelsData") as Class;
		private static const FairyLevelsConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyLevelsData") as Class;
		private static const FairysConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairysData") as Class;
		private static const FairyEvolvesConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyEvolvesData") as Class;
		private static const FairyLeaderSkillsConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyLeaderSkillsData") as Class;
		private static const FairyMainSkillsConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyMainSkillsData") as Class;
		private static const FairyMainSkillsLvConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyMainSkillLvsData") as Class;
		private static const FairyEquipCardsConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyEquipCardsData") as Class;
		private static const FairyFrinedBuffConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyFriendBuffData") as Class;
		private static const FairyEnemyBuffConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyEnemyBuffData") as Class;
		private static const FairySuperEvolvesConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairySuperEvolvesData") as Class;
		
		private static var _fairyNameToIdMap:Object; 
		private static var _switchLv:int = 122;//开关等级，用于恶心的精灵等级配置，开关等级前面不是按公式算的
		
		public function Fairys()
		{
		}
		
		public static function getFairys():Array
		{
			var data:Object = FairysConfig["data"];
			var temp:Array = [];
			var id:int = 1;
			while (true)
			{
				if (data.hasOwnProperty(id))
				{
					temp.push(data[id]);
				}
				else
				{
					break;
				}
				
				id++;
			}
			
			return temp;
		}
		
		public static function getFairyById(id:int):Fairy
		{
			var data:Object = FairysConfig["data"];
			if (!data.hasOwnProperty(id))
			{
				throw new Error("没有此精灵：" + id);
			}
			return data[id];
		}
		
		public static function getFairyPlayerLevelFromExp(exp:int):FairyPlayerLevel 
		{
			var values:Array = FairyPlayerLevelsConfig["data"];
			for (var i:int=values.length-1; i>=0; i--) 
			{
				var levelInfo:FairyPlayerLevel = values[i];
				if (exp >= levelInfo.needExp) 
				{
					return levelInfo;
				}
			}
			return null;
		}
		
		public static function getFairyPlayerLevelByLevel(level:int):FairyPlayerLevel 
		{
			var values:Array = FairyPlayerLevelsConfig["data"];
			return values[level-1];
		}
		
		public static function getFairyLevelFromExp(id:int, exp:int):FairyLevel 
		{
			//恶心的开关，逐步改进
			if(id >= _switchLv)
			{
				return FairyLvExpMap.getFairyLvByExp(id, exp);
			}
			
			var values:Object = FairyLevelsConfig["data"];
			var fairy:Fairy = getFairyById(id);
			for (var i:int=fairy.maxLevel; i>=1; i--) 
			{
				var key:String = id.toString() + "_" + i.toString();
				var levelInfo:FairyLevel = values[key];
				if (exp >= levelInfo.needExp) 
				{
					return levelInfo;
				}
			}
			return null;
		}
		
		public static function getFairyLevel(id:int, level:int):FairyLevel
		{
			//恶心的开关，逐步改进
			if(id >= _switchLv)
			{
				return FairyLvExpMap.getFairyLvByLv(id, level);
			}
			
			var values:Object = FairyLevelsConfig["data"];
			var key:String = id.toString() + "_" + level.toString();
			if (!values.hasOwnProperty(key))
			{
				throw new Error("没有这精灵的等级：" + key);
			}
			return values[key];
		}
		
		public static function getFairyLeaderSkillById(id:int):FairyLeaderSkill
		{
			var data:Object = FairyLeaderSkillsConfig["data"];
			if (!data.hasOwnProperty(id))
			{
				throw new Error("精灵没有此队长技能：" + id);
			}
			return data[id];
		}
		
		public static function getFairyEvolves():Object
		{
			return FairyEvolvesConfig["data"];
		}
		
		public static function getFairyEvolveByTargetId(targetId:int):FairyEvolve
		{
			var data:Object = FairyEvolvesConfig["data"];
			if (!data.hasOwnProperty(targetId))
			{
				throw new Error("没有此进化目标的精灵：" + targetId);
			}
			return data[targetId];
		}
		
		public static function getFairySuperEvolves():Object
		{
			return FairySuperEvolvesConfig["data"];
		}
		
		public static function getFairySuperEvolveByTargetId(targetId:int):FairySuperEvolve
		{
			var data:Object = FairySuperEvolvesConfig["data"];
			if (!data.hasOwnProperty(targetId))
			{
				throw new Error("没有此觉醒目标的精灵：" + targetId);
			}
			return data[targetId];
		}
		
		public static function getFairyMainSkillByLevel(id:int, level:int):FairyMainSkillLevel
		{
			var key:String = id.toString() + "_" + level.toString();
			var data:Object = FairyMainSkillsLvConfig["data"];
			return data[key];
		}
		
		public static function getFairyMainSkillById(id:int):FairyMainSkill
		{
			var data:Object = FairyMainSkillsConfig["skills"];
			if (!data.hasOwnProperty(id))
			{
				throw new Error("精灵没有此主技能：" + id);
			}
			return data[id];
		}
		
		public static function getFairyMainSkillMaxLevel(id:int):FairyMainSkillLevel
		{
			var level:int = 1;
			while (getFairyMainSkillByLevel(id, level) != null)
			{
				level++;
			}
			level--;
			return getFairyMainSkillByLevel(id, level);
		}
		
		public static function getFairyPlayerMaxLevel():int
		{
			var values:Array = FairyPlayerLevelsConfig["data"];
			var fpl:FairyPlayerLevel = values[values.length-1];
			return fpl.level;
		}
		
		public static function getFairyEquipCard(fairyId:int):FairyEquipCard
		{
			var data:Object = FairyEquipCardsConfig["data"];
			if (!data.hasOwnProperty(fairyId))
			{
				throw new Error("精灵没有此装备卡信息：" + fairyId);
			}
			return data[fairyId];
		}
		
		public static function getFairyIdByName(name:String):int
		{
			if(!_fairyNameToIdMap)
			{
				_fairyNameToIdMap = {};
				var fairyArr:Array = getFairys();
				for each (var fairy:Fairy in fairyArr)
				{
					_fairyNameToIdMap[fairy.name] = fairy.fairyId;
				}
			}
			
			if (!_fairyNameToIdMap.hasOwnProperty(name))
			{
				throw new Error("无法索引id的精灵名字：" + name);
			}
			return _fairyNameToIdMap[name];
		}
		
		public static function getFriendBuffById(buffId:int):FairyFriendBuff
		{
			var data:Object = FairyFrinedBuffConfig["data"];
			if (!data.hasOwnProperty(buffId))
			{
				throw new Error("无法找到友方buff定义：" + buffId);
			}
			return data[buffId];
		}
		
		public static function getFreindBuffTypeClassName(buffTypeId:int):String
		{
			var buffTypeClassMap:Object = FairyFrinedBuffConfig["buffTypeClassMap"];
			if (!buffTypeClassMap.hasOwnProperty(buffTypeId))
			{
				throw new Error("无法找到友方buffType处理类：" + buffTypeId);
			}
			return String(buffTypeClassMap[buffTypeId]);
		}
		
		public static function getLeaderBuffClassName(buffId:int):String
		{
			var buffClassMap:Object = FairyLeaderSkillsConfig["leaderBuffClassMap"];
			
			if (!buffClassMap.hasOwnProperty(buffId))
			{
				throw new Error("无法找到队长buff类" + buffId);
			}
			
			return String(buffClassMap[buffId]);
		}
		
		public static function getEnemyBuffTypeClassName(buffTypeId:int):String
		{
			var buffTypeClassMap:Object = FairyEnemyBuffConfig["buffTypeClassMap"];
			if (!buffTypeClassMap.hasOwnProperty(buffTypeId))
			{
				throw new Error("无法找到敌方buffType处理类：" + buffTypeId);
			}
			return String(buffTypeClassMap[buffTypeId]);
		}
		
		public static function getEnemyBuffById(buffId:int):FairyEnemyBuff
		{
			var data:Object = FairyEnemyBuffConfig["data"];
			if (!data.hasOwnProperty(buffId))
			{
				throw new Error("无法找到敌方buff定义：" + buffId);
			}
			return data[buffId];
		}
		
		public static function getEquipDesc(fairyId:int):String
		{
			var equipInfo:FairyEquipCard = getFairyEquipCard(fairyId);
			var arr:Array = [];
			if (equipInfo.attackPower > 0)
			{
				arr.push("物攻+" + equipInfo.attackPower);
			}
			if (equipInfo.magicPower > 0)
			{
				arr.push("魔攻+" + equipInfo.magicPower);
			}
			if (equipInfo.attackArmor > 0)
			{
				arr.push("物防+" + equipInfo.attackArmor);
			}
			if (equipInfo.magicArmor > 0)
			{
				arr.push("魔防+" + equipInfo.magicArmor);
			}
			if (equipInfo.hp > 0)
			{
				arr.push("生命+" + equipInfo.hp);
			}
			if (equipInfo.speed > 0)
			{
				arr.push("速度+" + equipInfo.speed);
			}
			if (equipInfo.magicResistancePersent > 0)
			{
				arr.push("魔抗+" + equipInfo.magicResistancePersent);
			}
			if (equipInfo.critiPersent > 0)
			{
				arr.push("暴击+" + equipInfo.critiPersent);
			}
			if (equipInfo.dodgePersent > 0)
			{
				arr.push("闪避+" + equipInfo.dodgePersent);
			}
			return arr.join(",");
		}
	}
}