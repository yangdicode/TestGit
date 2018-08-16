package mmo.nurturance.gamemanager.entity
{
	public class NurUserSave
	{
		private var _gameId:int;
		private var _saveId:int;
		private var _isAuto:Boolean;
		private var _isLock:Boolean;
		private var _curNode:String;
		private var _chapterId:int;
		private var _extStr:String;
		private var _saveDate:Number;

		public function NurUserSave(gameId:int, saveId:int, isAuto:Boolean, isLock:Boolean, curNode:String, chapterId:int, extStr:String, saveDate:Number)
		{
			_gameId = gameId;
			_saveId = saveId;
			_isAuto = isAuto;
			_isLock = isLock;
			_curNode = curNode;
			_chapterId = chapterId;
			_extStr = extStr;
			_saveDate = saveDate;
		}


		public function getCopy():NurUserSave{
			return new NurUserSave(_gameId, saveId, _isAuto, _isLock, _curNode, _chapterId, extStr, _saveDate);
		}

		public function get gameId():int
		{
			return _gameId;
		}

		public function get saveId():int
		{
			return _saveId;
		}

		public function get isAuto():Boolean
		{
			return _isAuto;
		}

		public function get isLock():Boolean
		{
			return _isLock;
		}

		public function get curNode():String
		{
			return _curNode;
		}

		public function get extStr():String
		{
			return _extStr;
		}

		public function get saveDate():Number
		{
			return _saveDate;
		}

		public function get chapterId():int
		{
			return _chapterId;
		}

		public function set curNode(value:String):void
		{
			_curNode = value;
		}

		public function set extStr(value:String):void
		{
			_extStr = value;
		}

		public function set saveDate(value:Number):void
		{
			_saveDate = value;
		}

		public function set isLock(value:Boolean):void
		{
			_isLock = value;
		}

		public function set chapterId(value:int):void
		{
			_chapterId = value;
		}

		public function set isAuto(value:Boolean):void
		{
			_isAuto = value;
		}

		public function set saveId(value:int):void
		{
			_saveId = value;
		}
		
		public function parse(info:String):void
		{
			var arr:Array = info.split(";");
			_gameId = int(arr[0]);
			_saveId = int(arr[1]);
			_isAuto = int(arr[2])==1;
			_isLock = int(arr[3])==1;
			_curNode = arr[4];
			_chapterId = int(arr[5]);
			_extStr = arr[6];
			_saveDate = Number(arr[7]);
		}

		public function toString():String
		{
			var auto:int = _isAuto ? 1 : 0;
			var lock:int = _isLock ? 1 : 0; 
			var arr:Array = [_gameId, _saveId, auto, lock, _curNode, _chapterId, _extStr, _saveDate];
			return arr.join(";");
		}
	}
}

