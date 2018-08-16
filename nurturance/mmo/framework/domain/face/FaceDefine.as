package mmo.framework.domain.face
{
	public class FaceDefine
	{
		private var _id:int;
		private var _name:String;
		private var _type:int;
		private var _goodId:int;
		
		/**
		 * type 详见FaceType
		 */
		public function FaceDefine(id:int, name:String, type:int, goodId:int=-1)
		{
			_id = id;
			_name = name;
			_type = type;
			_goodId = goodId;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get type():int
		{
			return _type;
		}

		public function get goodId():int
		{
			return _goodId;
		}


	}
}