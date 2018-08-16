package mmo.nurturance.gamemanager.model
{
	import com.adobe.utils.StringUtil;
	
	import mmo.nurturance.gamemanager.client.LocalStore;
	import mmo.nurturance.gamemanager.entity.NurGameDefine;
	import mmo.nurturance.gamemanager.entity.NurUserGameState;
	import mmo.play.dialog.NewDialog;

	public class NurGameStateProxy
	{
		private var _gameStates:Object = {};
		private var _curGameId:int;
		private var _callBack:Function;
		
		public function NurGameStateProxy()
		{
		}
		
		public function get curGameId():int{
			return _curGameId;
		}
		
		public function init(curGameId:int, callBack:Function = null):void{
			updateCurGame(curGameId);
			if(callBack != null){
				callBack.apply();
			}
		}
		
		public function updateCurGame(gameId:int):void{
			_curGameId = gameId;
			if (!_gameStates[curGameId]){
				var infoStr:String = LocalStore.getValue(gameId, LocalStore.AoYaNurturanceGame) as String;
				var gameInfo:NurUserGameState = getEmptyGameState(gameId);
				if (!StringUtil.isEmpty(infoStr))
				{
					gameInfo.parse(infoStr);
				}
				_gameStates[gameId] = gameInfo;
			}
		}
		
		public function isLeastGame():Boolean{
			return Boolean(_curGameId = NurDefinesProvider.getLatestGameId());
		}
		
		public function getCurGameState():NurUserGameState{
			return getGameStateByGameId(_curGameId);
		}
		
		public function hadfinishLatestChapter():Boolean{
			var latestGameId:int = NurDefinesProvider.getLatestGameId();
			var latestChapterId:int =NurDefinesProvider.getLatestChapterId();
			
			if(!getGameStateByGameId(latestGameId)){
				return false;
			}
			return getGameStateByGameId(latestGameId).hadFinishChapter(latestChapterId);
		}
		
		public function hadgainEndings(gameId:int):Array
		{
			return getGameStateByGameId(gameId).finishEnding;
		}
		
		public function getGameStateByGameId(gameId:int):NurUserGameState{
			return _gameStates[gameId];
		}
		
		public function getEmptyGameState(gameId:int):NurUserGameState{
			return new NurUserGameState(gameId, [], [], []);
		}
		
		public function getDoingGameState():Array{
			var arr:Array = [];
			for each(var userState:NurUserGameState in _gameStates){
				var gameId:int = userState.gameId;
				var gameDefine:NurGameDefine = NurDefinesProvider.getGameById(gameId);
				if(userState.finishChapter.length != NurDefinesProvider.getChaptersByGameId(gameId).length
					|| userState.finishEnding.length != NurDefinesProvider.getEndingsByGameId(gameId).length){
					arr.push(userState);		
				}
			}
			arr.sortOn("gameId", Array.NUMERIC);
			return arr;
		}
		
		public function finishEnding(endingId:int, callBack:Function):void{
			if(getCurGameState().hadFinishEnding(endingId)){
				callBack.apply();
				return;
			}
			getCurGameState().addFinishEnding(endingId);
			LocalStore.setValue(curGameId, getCurGameState().toString(), LocalStore.AoYaNurturanceGame);
			callBack.apply();
		}
		
		public function finishCG(cgId:int, callBack:Function):void{
			if(getCurGameState().hadFinishCG(cgId)){
				callBack.apply();
				return;
			}
			getCurGameState().addFinishCG(cgId);
			LocalStore.setValue(curGameId, getCurGameState().toString(), LocalStore.AoYaNurturanceGame);
			callBack.apply();
		}
		
		public function finishChapter(chapterId:int, callBack:Function):void{
			if(getCurGameState().hadFinishChapter(chapterId)){
				callBack.apply();
				NewDialog.showSucceedMessage("恭喜你成功通过第" + chapterId + "章~");
				return;
			}
			
			getCurGameState().addFinishChapter(chapterId);
			LocalStore.setValue(curGameId, getCurGameState().toString(), LocalStore.AoYaNurturanceGame);
			
			callBack.apply();
			NewDialog.showSucceedMessage("恭喜你成功通过第" + chapterId + "章~~");
		}
	}
}