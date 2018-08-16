package mmo.framework.domain.player
{
	public class ShootItem
	{
		private var _key:String;
		private var _desc:String;
		private var _preClsName:String;
		private var _speed:Number;
		private var _path:String;
		private var _flyType:int;
		
		//后面添加的，有显示对于收集品数量，使用权限等
		private var _isDefault:Boolean;
		private var _gitemId:int;
		private var _needVip:Boolean;
		private var _needYearVip:Boolean;
		
		public function ShootItem(key:String, desc:String, path:String, preClsName:String, speed:Number, flyType:int = 1, isDefault:Boolean=false, gitemId:int=0, needVip:Boolean=false, needYearVip:Boolean = false)
		{
			_path = path;
			_preClsName = preClsName;
			_speed = speed;
			_desc = desc;
			_key = key;
			_flyType = flyType;
			
			_isDefault = isDefault;
			_gitemId = gitemId;
			_needVip = needVip;
			_needYearVip = needYearVip;			
		}
		
		public function get path():String
		{
			return _path;
		}
		
		public function get speed():Number
		{
			return _speed;
		}

		public function get desc():String
		{
			return _desc;
		}

		public function get key():String
		{
			return _key;
		}
		
		public function get flyType():int
		{
			return _flyType;
		}
		
		public function get flyClassName():String
		{
			return _preClsName + ".Fly";
		}
		
		public function get explodeClassName():String
		{
			return _preClsName + ".Explode";
		}
		
		public function get shootClassName():String
		{
			return _preClsName + ".Shoot";
		}
		
		public function get iconClassName():String
		{
			return _preClsName + ".Icon";
		}

		/** 是不是默认显示的 **/
		public function get isDefault():Boolean
		{
			return _isDefault;
		}

		/** 物品id， 0表示不是物品，无数量限制 **/
		public function get gitemId():int
		{
			return _gitemId;
		}

		/** 神羽特权 **/
		public function get needVip():Boolean
		{
			return _needVip;
		}

		/** 年费特权 **/
		public function get needYearVip():Boolean
		{
			return _needYearVip;
		}


	}
}