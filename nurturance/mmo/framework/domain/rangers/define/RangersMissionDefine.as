package mmo.framework.domain.rangers.define
{
	public class RangersMissionDefine implements IRangerBattleInfo
	{
		private var _id:int;
		private var _mapId:int;
		private var _chapter:int;
		private var _isBoss:Boolean;
		private var _canGetRangers:Array;
		
		private var _enemyDistance:int;
		private var _enemyBasementHp:int;
		private var _enemyEnergy:int;
		private var _enemyEnergyUpSpeed:int;
		
		private var _enemyRangers:String;
		private var _enemyBoss:String;

		private var _availableNpc:Array;

		private var _playerExp:int;
		private var _rangersExp:int;
		private var _bonus:XML;
		
		/**
		 * 关卡配置
		 */		
		public function RangersMissionDefine(id:int, map:int, chapter:int, isBoss:int, rangers:String, 
			distance:int, basementHp:int, energy:int, upspeed:int, monster:String, boss:String,
			npc:String, playerExp:int, rangersExp:int, bonus:XML){
			_id = id;
			_mapId = map;
			_chapter = chapter;
			_isBoss = isBoss == 1;
			_canGetRangers = rangers.split(",");
			
			_enemyBasementHp = basementHp;
			_enemyBoss = boss;
			_enemyDistance = distance;
			_enemyEnergy = energy;
			_enemyEnergyUpSpeed = upspeed;
			_enemyRangers = monster;
			
			_availableNpc = npc.split(",");
			formatIntArr(_availableNpc);
			_playerExp = playerExp;
			_rangersExp = rangersExp;
			_bonus = bonus;
		}
		
		public function get battleParams():String{
			return _id.toString();
		}

		public function get id():int
		{
			return _id;
		}
		/**
		 * 基础：地图
		 */		
		public function get mapId():int
		{
			return _mapId;
		}
		/**
		 * 基础：是否boss关
		 */
		public function get isBoss():Boolean
		{
			return _isBoss;
		}

		/**
		 * 基础：能获得的星灵
		 */
		public function get canGetRangers():Array
		{
			return _canGetRangers;
		}

		/**
		 * 战斗：敌人的距离
		 */
		public function get enemyDistance():int
		{
			return _enemyDistance;
		}

		/**
		 * 战斗：敌人堡垒血量
		 */
		public function get enemyBasementHp():int
		{
			return _enemyBasementHp;
		}

		/**
		 * 战斗：敌人星灵能量
		 */
		public function get enemyEnergy():int
		{
			return _enemyEnergy;
		}

		/**
		 * 战斗：出怪
		 */
		public function get enemyRangers():String
		{
			return _enemyRangers;
		}

		/**
		 * 奖励：玩家经验
		 */
		public function get playerExp():int
		{
			return _playerExp;
		}

		/**
		 * 奖励：星灵经验
		 */
		public function get rangersExp():int
		{
			return _rangersExp;
		}

		/**
		 * 奖励：其它
		 */
		public function get bonus():XML
		{
			return _bonus;
		}

		/**
		 * 敌人能量上升速度
		 */
		public function get enemyEnergyUpSpeed():int
		{
			return _enemyEnergyUpSpeed;
		}

		/**
		 * 战斗：boss
		 */
		public function get enemyBoss():String
		{
			return _enemyBoss;
		}

		/**
		 * 可用冒险者
		 */
		public function get availableNpc():Array
		{
			return _availableNpc;
		}

		/**
		 * 章节id
		 */
		public function get chapter():int
		{
			return _chapter;
		}
		
		private function formatIntArr(arr:Array):void{
			for(var i:int=0; i<arr.length; i++){
				arr[i] = int(arr[i]);
			}
		}


	}
}