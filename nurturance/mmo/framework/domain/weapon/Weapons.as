package mmo.framework.domain.weapon
{
	import flash.system.ApplicationDomain;

	public class Weapons
	{
		private static var cls:Class = Class(ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.WeaponsData"));
		private static var weaponsData:Object = cls["weaponsData"];
		private static var weaponsEvoData:Object = cls["weaponsEvoData"];
		private static var weaponsLvData:Object = cls["weaponLvsData"];
		private static var _maxLvData:Object;
		private static var _minLvData:Object;
		
		public function Weapons(){
		}
		
		public static function getWeaponById(id:int):WeaponEquip{
			return weaponsData[id];
		}
		
		public static function getWeaponEvoById(id:int):WeaponEquipEvo{
			return weaponsEvoData[id];
		}
		
		public static function getWeaponLv(id:int, lv:int):WeaponEquipLv{
			return weaponsLvData[id + "_" + lv];
		}
		
		public static function getWeaponMaxLv(id:int):int{
			if(_maxLvData == null){
				initMaxLvData();
			}
			return _maxLvData[id];
		}
		
		public static function getWeaponMinLv(id:int):int{
			return _minLvData[id];
		}
		
		private static function initMaxLvData():void{
			_maxLvData = {};
			_minLvData = {};
			for each(var define:WeaponEquipLv in weaponsLvData){
				if(_maxLvData.hasOwnProperty(define.id)){
					_maxLvData[define.id] = Math.max(_maxLvData[define.id], define.lv);
					_minLvData[define.id] = Math.min(_minLvData[define.id], define.lv);
				}else{
					_maxLvData[define.id] = define.lv;
					_minLvData[define.id] = define.lv;
				}
			}
		}
		
	}
}