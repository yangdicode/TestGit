package mmo.framework.domain.card
{	
	public class Card extends CardBase
	{
		private var _func:String;
		private var _subFunc:String;
		private var _target:String;
		private var _pow:int;
		private var _hit:int;
		private var _critical:int;
		private var _fp:int;
		private var _priority:int;
		private var _autoPriority:int; //自动出卡的卡优先级
		private var _cardCD:int;
		private var _ignoreCloseSkill:Boolean;
		private var _proLvLimit:int;
		private var _proLimit:Array;
		private var _isVip:Boolean;		
		private var _strPostion:String;

		public function Card(id:int, 
							   name:String, 
							   description:String, 							  
							   func:String, 
							   subFunc:String, 
							   target:String, 
							   postion:String,
							   pow:int, 
							   hit:int, 
							   critical:int, 
							   fp:int, 
							   priority:int,
							   autoPriority:int,
								cardCD:int,
								proLvLimit:int,
								proLimit:String,
								isVip:int,
								ignoreCloseSkill:int)
		{
			super(id,name,description, 1);
			this._func = func;
			this._subFunc = subFunc;
			this._target = target;
			_strPostion = postion;
			this._pow = pow;
			this._hit = hit;
			this._critical = critical;
			this._fp = fp;
			this._priority = priority;
			this._autoPriority = autoPriority;
			_cardCD = cardCD;
			_ignoreCloseSkill = ignoreCloseSkill == 1;
			_proLvLimit = proLvLimit;
			_isVip = isVip > 0;
			
			if( proLimit == "" )
			{
				_proLimit = [];
			}else{
				_proLimit = proLimit.split(",");
			}
			
		}

		public function get target():String
		{
			return _target;
		}

		public function get pow():int
		{
			return _pow;
		}

		public function get hit():int
		{
			return _hit;
		}

		public function get critical():int
		{
			return _critical;
		}

		public function get ignoreCloseSkill():Boolean{
			return _ignoreCloseSkill;
		}

		public function get fp():int
		{
			return _fp;
		}

		public function get priority():int
		{
			return _priority;
		}
		
		public function get autoPriority():int
		{
			return _autoPriority;
		}

		public function get func():String
		{
			return _func;
		}

		public function get subFunc():String
		{
			return _subFunc;
		}
		
		public function get cardCD():int
		{
			return _cardCD;
		}
		
		public function get proLimitLv():int
		{
			return _proLvLimit;
		}
		
		public function get isVipCard():Boolean
		{
			return _isVip;
		}
		
		public function get proLimit():Array
		{
			return _proLimit;
		}
		
		public function get postion():String
		{
			return _strPostion;
		}

	}
}