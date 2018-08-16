package mmo.framework.domain.dreamcard
{
	public class DreamCard
	{
		private var _id:int;
		private var _cardName:String;
		private var _roleName:String;
		private var _sex:String;
		private var _age:String;
		private var _height:String;
		private var _weight:String;
		private var _birthday:String;
		private var _hasVoice:Boolean;
		
		public function DreamCard(id:int, cardName:String, roleName:String, sex:String, age:String, height:String, weight:String, birthday:String, hasVoice:int)
		{
			this._id = id;
			this._cardName = cardName;
			this._roleName = roleName;
			this._sex = sex;
			this._age = age;
			this._height = height;
			this._weight = weight;
			this._birthday = birthday;
			this._hasVoice = Boolean(hasVoice);
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get cardName():String
		{
			return this._cardName;
		}
		
		public function get roleName():String
		{
			return this._roleName;
		}
		
		public function get sex():String
		{
			return this._sex;
		}
		
		public function get age():String
		{
			return this._age;
		}
		
		public function get height():String
		{
			return this._height;
		}
		
		public function get weight():String
		{
			return this._weight;
		}
		
		public function get birthday():String
		{
			return this._birthday;
		}
		
		public function get hasVoice():Boolean
		{
			return this._hasVoice;
		}
	}
}