package mmo.framework.domain.fairy
{
	public class FairySubFbDefine
	{
		private var _fbId:int;
		private var _subFbId:int;
		private var _subFbName:String;
		private var _subFbLv:int;
		private var _costRes:int;
		private var _exp:int;
		private var _fairyBonus:String;
		private var _breedLimit:Boolean;
		private var _ownRestore:Boolean;
		
		public function FairySubFbDefine(fbId:int, subFbId:int, subFbName:String, subFbLv:int, costRes:int, exp:int, fairyBonus:String, breedLimit:int, ownRestore:int)
		{
			_fbId = fbId;
			_subFbId = subFbId;
			_subFbName = subFbName;
			_subFbLv = subFbLv;
			_costRes = costRes;
			_exp = exp;
			_fairyBonus = fairyBonus;
			_breedLimit = breedLimit == 1;
			_ownRestore = ownRestore == 1;
		}
		
		public function get fbId():int
		{
			return _fbId;
		}
		
		public function get subFbId():int
		{
			return _subFbId;
		}
		
		public function get subFbName():String
		{
			return _subFbName;
		}
		
		/**
		 * 副本的层数
		 */		
		public function get subFbLv():int
		{
			return _subFbLv;
		}
		
		public function get costRes():int
		{
			return _costRes;
		}

		public function get exp():int
		{
			return _exp;
		}

		public function get fairyBonus():Array
		{
			var bonus:Array = _fairyBonus.split(",");
			if(bonus[0] == "")
			{
				bonus = [];
			}
			return bonus;
		}

		public function get breedLimit():Boolean
		{
			return _breedLimit;
		}

		public function get ownRestore():Boolean
		{
			return _ownRestore;
		}


	}
}