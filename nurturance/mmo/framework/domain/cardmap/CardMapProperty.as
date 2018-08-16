package mmo.framework.domain.cardmap
{
	/**
	 * 晶卡特性(图鉴使用)
	 * @author liyawei
	 */	
	public class CardMapProperty
	{
		private var _no:int;
		private var _name:String;
		private var _intro:String;
		
		public function CardMapProperty(no:int,name:String,intro:String)
		{
			this._no = no;
			this._name = name;
			this._intro = intro;
		}

		/**
		 * 编号
		 */		
		public function get no():int
		{
			return _no;
		}
		
		/**
		 * 名称
		 */		
		public function get name():String
		{
			return _name;
		}
		
		/**
		 * 介绍
		 */		
		public function get intro():String
		{
			return _intro;
		}


	}
}