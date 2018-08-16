package mmo.framework.domain.halos
{
	public class HaloFrame
	{
		public static const MainFrame:int = 1;
		public static const OtherFrame:int = 2;
		
		private var _id:int;
		private var _name:String;
		private var _goodsId:int;
		private var _pos:int;
		private var _limit:Array;
		private var _except:Array;
		private var _memberLimit:Boolean;
		
		public function HaloFrame(id:int, name:String, goodsId:int, pos:int, limit:String = "", except:String = "", memberLimit:Boolean = false){
			_id = id;
			_name = name;
			_goodsId = goodsId;
			_pos = pos;
			if( limit=="" ){
				_limit = [];
			}else{
				_limit = limit.split(",");
			}
			
			if( except=="" ){
				_except = [];
			}else{
				_except = except.split(",");
			}			
			_memberLimit = memberLimit;
			_except.push(1);
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get goodsId():int
		{
			return _goodsId;
		}

		public function get pos():int
		{
			return _pos;
		}

		public function get limit():Array
		{
			return _limit;
		}

		public function get except():Array
		{
			return _except;
		}

		public function get memberLimit():Boolean
		{
			return _memberLimit;
		}
		
		public function isMainFrame():Boolean{
			return (_pos == MainFrame);
		}
		
		public function isSideFrame():Boolean{
			return (_pos == OtherFrame);
		}


	}
}