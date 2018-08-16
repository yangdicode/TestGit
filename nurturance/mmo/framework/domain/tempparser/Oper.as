package mmo.framework.domain.tempparser
{
	public class Oper
	{
		private var _limit:ILimit;
		private var _demand:IDemand;
		private var _bonus:IBonus;
		private var _key:String;
		
		public function Oper(limit:ILimit, demand:IDemand, bonus:IBonus, key:String)
		{
			this._limit = limit;
			this._demand = demand;
			this._bonus = bonus;
			this._key = key;
		}
		
		public function get limit():ILimit
		{
			return this._limit;
		}
		
		public function get demand():IDemand
		{
			return this._demand;
		}
		
		public function get bonus():IBonus
		{
			return this._bonus;
		}
		
		public function get key():String
		{
			return this._key;
		}
		
		public function toString():String
		{
			return this._key + ", " + this._limit.type.toString() + ", " + this._bonus.type.toString() + ", " + this._demand.type.toString();
		}
	}
}