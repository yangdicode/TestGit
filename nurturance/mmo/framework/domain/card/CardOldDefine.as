package mmo.framework.domain.card
{	
	public class CardOldDefine extends CardBase
	{
		private var _slot:String;
		private var _func:String;
		private var _subFunc:String;
		private var _target:String;
		private var _pow:int;
		private var _hit:int;
		private var _critical:int;
		private var _supportCards:Array;
		private var _mp:int;
		private var _fp:int;
		private var _priority:int;
		private var _autoPriority:int; //自动出卡的卡优先级

		public function CardOldDefine(id:int, 
								name:String, 
								description:String, 
								slot:String, 
								func:String, 
								subFunc:String, 
								target:String, 
								pow:int, 
								hit:int, 
								critical:int, 
								supportCards:String, 
								mp:int, 
								fp:int, 
								priority:int,
								autoPriority:int,
								cardType:int=0)
		{
			super(id,name,description, cardType);
			this._slot = slot;
			this._func = func;
			this._subFunc = subFunc;
			this._target = target;
			this._pow = pow;
			this._hit = hit;
			this._critical = critical;
			this._supportCards = supportCards.split(",");
			this._mp = mp;
			this._fp = fp;
			this._priority = priority;
			this._autoPriority = autoPriority;
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
		
		public function get supportCards():Array
		{
			return _supportCards;
		}
		
		public function get mp():int
		{
			return _mp;
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
		
		public function get slot():String
		{
			return _slot;
		}
		
		public function get func():String
		{
			return _func;
		}
		
		public function get subFunc():String
		{
			return _subFunc;
		}
	}
}