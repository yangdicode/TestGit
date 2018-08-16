package mmo.framework.domain.map
{
	public class MapSceneTips
	{
		private var _fatherName:String;
		private var _name:String;
		private var _monsterLevel:String;
		private var _ability:String;
		private var _commInfo:String;
		private var _otherScene:String;
		private var _npcNames:String;
		private var _monsterName:String;
		private var _bossName:String;
		private var _collection:String;
		private var _historyFBId:int; //副本
		private var _arenaId:int; //竞技场
		private var _describe:String; //描述
		/**
		 * 地图tips：
		 * 父亲名称、名称，怪物等级范围，怪物名称，boss名称，功能，热点活动，采集，其他场景，npc名称，副本id，竞技场id，描述。
		 * */
		public function MapSceneTips(fatherName:String,
										   name:String,
										   monsterLevel:String,
										   monsterName:String,
										   bossName:String,
										   ability:String,
										   commInfo:String,
										   collection:String,
										   otherScene:String,
										   npcNames:String,
										   historyFBId:int=0,
										   arenaId:int=0,
										   describe:String=""
										   )
		{
			this._fatherName = fatherName;
			this._name = name;
			this._monsterLevel = monsterLevel;
			this._ability = ability;
			this._commInfo = commInfo;
			this._otherScene = otherScene;
			this._npcNames = npcNames;
			this._monsterName = monsterName;
			this._bossName = bossName;
			this._collection = collection;
			this._historyFBId = historyFBId;
			this._arenaId = arenaId;
			this._describe = describe;
		}

		/**
		 * 场景父亲名称，没有父亲返回""
		 * */
		public function get fartherName():String
		{
			return _fatherName;
		}
		
		/**
		 * 其他场景 
		 */		
		public function get otherScene():String
		{
			return _otherScene;
		}

		/**
		 * 场景的功能
		 */		
		public function get ability():String
		{
			return _ability;
		}

		/**
		 * 热点活动信息
		 * */
		public function get commInfo():String
		{
			return _commInfo;
		}
		
		/**
		 * 场景的名字 
		 */		
		public function get name():String
		{
			return _name;
		}
		
		/**
		 * 怪物的等级 
		 */		
		public function get monsterLevel():String
		{
			return _monsterLevel;
		}
		
		/**
		 * 一级场景npc
		 */		
		public function get npcNames():String
		{
			return _npcNames;
		}

		/**
		 * 怪物名称 
		*/
		public function get monsterName():String
		{
			return _monsterName;
		}
		
		/**
		 * 获取boss名称
		 */
		public function get bossName():String
		{
			return _bossName;
		}
		
		/**
		 * 采集点
		 */
		public function get collection():String
		{
			return _collection;
		}
		
		/**
		 * 副本
		 */
		public function get historyFBId():int
		{
			return _historyFBId;
		}
		
		/**
		 * 竞技场
		 */
		public function get arenaId():int
		{
			return _arenaId;
		}
		
		/**
		 * 描述
		 * */
		public function get describe():String
		{
			return _describe;
		}
	}
}