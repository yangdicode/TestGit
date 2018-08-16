package mmo.nurturance.gamemanager.entity
{
	public class NurUserGameState
	{
		private var _gameId:int;
		private var _finishChapter:Array;
		private var _finishEnding:Array;
		private var _finishCG:Array;
		
		public function NurUserGameState(gameId:int, finishChapter:Array, finishEnding:Array, finishCG:Array)
		{
			_gameId = gameId;
			_finishChapter = finishChapter;
			_finishEnding = finishEnding;
			_finishCG = finishCG;
		}

		public function get gameId():int
		{
			return _gameId;
		}
		
		public function get finishChapter():Array
		{
			return _finishChapter;
		}
		
		public function get finishEnding():Array
		{
			return _finishEnding;
		}
		
		public function get finishCG():Array
		{
			return _finishCG;
		}
		
		public function get myLatestChapter():int{
			var latestChapter:int = 0;
			for(var i:int = 0; i < _finishChapter.length; i++){
				if(latestChapter < _finishChapter[i]){
					latestChapter = _finishChapter[i];
				}
			}
			return latestChapter;
		}
		
		public function hadFinishEnding(endingId:int):Boolean{
			return Boolean(_finishEnding.indexOf(endingId) != -1);
		}
		
		public function hadFinishCG(cgId:int):Boolean{
			return Boolean(_finishCG.indexOf(cgId) != -1);
		}
		
		public function hadFinishChapter(chapterId:int):Boolean{
			return Boolean(_finishChapter.indexOf(chapterId) != -1);
		}
		
		public function addFinishEnding(endingId:int):void{
			if(_finishEnding.indexOf(endingId) == -1){
				_finishEnding.push(endingId);
				_finishEnding.sort(Array.NUMERIC);
			}
		}
		
		public function addFinishCG(cgId:int):void{
			if(_finishCG.indexOf(cgId) == -1){
				_finishCG.push(cgId);
				_finishCG.sort(Array.NUMERIC);
			}
		}
		
		public function addFinishChapter(chapterId:int):void{
			if(_finishChapter.indexOf(chapterId) == -1){
				_finishChapter.push(chapterId);
				_finishChapter.sort(Array.NUMERIC);
			}
		}
		
		public function parse(info:String):void
		{
			var arr:Array = info.split(";");
			parseDataInt(arr[0], _finishChapter);
			parseDataInt(arr[1], _finishEnding);
			parseDataInt(arr[2], _finishCG);
		}
		
		private function parseDataInt(info:String, data:Array):void
		{
			var arr:Array = info.split(",");
			for (var i:int=0; i<arr.length; ++i)
			{
				data.push(int(arr[i]));
			}
		}
		
		public function toString():String
		{
			var arr:Array = [];
			arr.push(_finishChapter.join(","));
			arr.push(_finishEnding.join(","));
			arr.push(_finishCG.join(","));
			return arr.join(";");
		}
	}
}