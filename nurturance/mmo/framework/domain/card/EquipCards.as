package mmo.framework.domain.card
{
	import flash.system.ApplicationDomain;

	public class EquipCards
	{
		
		private static var _class:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.EquipSuitEffectData") as Class;
		
		public static function getEquipSuitEffect(sId):EquipSuitEffect{
			var obj:Object = _class["data"];
			return obj[sId];
		}
		
		public static function getAllSuitEffect():Array{
			var obj:Object = _class["data"];
			var arr:Array = [];
			for each(var e:EquipSuitEffect in obj){
				arr.push(e);
			}
			return arr;
		}
		
		public static function getEffectByEquip(eId:int):EquipSuitEffect{
			var obj:Object = _class["data"];
			for each(var eq:EquipSuitEffect in obj){
				if(eq.equipSuits.indexOf(eId) >= 0){
					return eq;
				}
			}
			return EquipSuitEffect.emptyEffect;
		}
		
		public static function getEffectByEquipped(equippedIds:Array):Array{
			var hasEffect:Boolean;
			var obj:Object = _class["data"];
			var arr:Array = [];
			for each(var e:EquipSuitEffect in obj){
				hasEffect = true;
				for each(var eId:int in e.equipSuits){
					if(equippedIds.indexOf(eId) < 0){
						hasEffect = false;
						break;
					}
				}
				if(hasEffect){
					arr.push(e);
				}
			}
			if(arr.length <= 0){
				arr.push(EquipSuitEffect.emptyEffect);
			}
			return arr;
		}
		
	}
}