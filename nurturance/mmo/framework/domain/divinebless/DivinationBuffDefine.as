package mmo.framework.domain.divinebless
{
	public class DivinationBuffDefine
	{
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _goodsId:int;
		
		public function DivinationBuffDefine(id:int, name:String, desc:String, goodsId:int)
		{
			_id = id;
			_name = name;
			_desc = desc;
			_goodsId = goodsId;
		}
		
		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get desc():String
		{
			return _desc;
		}

		public function get goodsId():int
		{
			return _goodsId;
		}

		public function get isJewelry():Boolean{
			return _goodsId > 0;
		}

	}
}