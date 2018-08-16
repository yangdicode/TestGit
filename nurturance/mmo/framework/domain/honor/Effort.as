package mmo.framework.domain.honor
{
	import com.adobe.utils.StringUtil;

	/**
	 * 成就定义类
	 * @author liyawei
	 */	
	
	public class Effort
	{
		private var _id:int;
		private var _name:String;
		private var _des:String;
		private var _type:String;
		private var _subType:String;
		private var _score:int;
		private var _badge:int;
		private var _bonus:XML;
		private var _effortValue:int;
		private var _honorId:int;
		private var _ext:String;
		
		public function Effort(id:int,name:String,des:String,type:String,subType:String,
							     score:int,badge:int,bonus:XML,effortValue:int,honorId:int,ext:String)
		{
			this._id = id;
			this._name = name;
			this._des = des;
			this._type = type;
			this._subType = subType;
			this._score = score;
			this._badge = badge;
			this._bonus = bonus;
			this._effortValue = effortValue;
			this._honorId = honorId;
			this._ext = ext;
		}

		public function get id():int
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get des():String
		{
			return _des;
		}

		public function get type():String
		{
			return _type;
		}

		public function get subType():String
		{
			return this._subType;
		}
		
		public function get score():int
		{
			return _score;
		}

		/**
		 * @return 称号Id
		 */		
		public function get badge():int
		{
			return _badge;
		}

		public function get bonus():XML
		{
			return _bonus;
		}

		/**
		 * 需要的荣誉点数
		 */		
		public function get effortValue():int
		{
			return _effortValue;
		}
		
		/**
		 * 对应的荣誉编号
		 */		
		public function get honorId():int
		{
			return _honorId;
		}

		public function get ext():String
		{
			return _ext;
		}

	}
}