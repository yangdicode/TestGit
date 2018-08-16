package mmo.nurturance.gamemanager.model
{
	import flash.system.ApplicationDomain;
	
	import mmo.nurturance.gamemanager.entity.NurCGDefine;
	import mmo.nurturance.gamemanager.entity.NurChapterDefine;
	import mmo.nurturance.gamemanager.entity.NurEndingDefine;
	import mmo.nurturance.gamemanager.entity.NurGameDefine;

	public class NurDefinesProvider
	{
		private static const NurCGDefines:Class = ApplicationDomain.currentDomain.getDefinition("mmo.nurturance.gamemanager.config.NurCGDefines") as Class;
		private static const NurChapterDefines:Class = ApplicationDomain.currentDomain.getDefinition("mmo.nurturance.gamemanager.config.NurChapterDefines") as Class;
		private static const NurEndingDefines:Class = ApplicationDomain.currentDomain.getDefinition("mmo.nurturance.gamemanager.config.NurEndingDefines") as Class;
		private static const NurGameDefines:Class = ApplicationDomain.currentDomain.getDefinition("mmo.nurturance.gamemanager.config.NurGameDefines") as Class;

		private static var nurCGs:Array = [];
		private static var nurChapters:Array = [];
		private static var nurEndings:Array = [];
		private static var nurGames:Array = [];
		
		private static var _lastGameId:int;

		public function NurDefinesProvider()
		{
		}
		
		public static function initGame(gameId:int):void
		{
			_lastGameId = gameId;
		}

		public static function getCGByGameIdCGId(gameId:int, CGId:int):NurCGDefine{
			if(!NurCGDefines["DATA"][gameId + "_" + CGId]){
				throw new Error("找不到Id为" + gameId + "_" + CGId + "的CG图");
			}
			var dataArr:Array = NurCGDefines["DATA"][gameId + "_" + CGId] as Array;
			var nurCGDefine:NurCGDefine = new NurCGDefine(dataArr[0], dataArr[1], dataArr[2], dataArr[3]);
			return nurCGDefine;
		}

		public static function getChapterByGameIdChapterId(gameId:int, chapterId:int):NurChapterDefine{
			if(!NurChapterDefines["DATA"][gameId + "_" + chapterId]){
				throw new Error("找不到Id为" + gameId + "_" + chapterId + "的章节");
			}		
			var dataArr:Array = NurChapterDefines["DATA"][gameId + "_" + chapterId] as Array;
			var nurChapterDefine:NurChapterDefine = new NurChapterDefine(dataArr[0], dataArr[1], dataArr[2]);
			return nurChapterDefine;
		}

		public static function getEndingByGameIdEndingId(gameId:int, endingId:int):NurEndingDefine{
			if(!NurEndingDefines["DATA"][gameId + "_" + endingId]){
				throw new Error("找不到Id为" + gameId + "_" + endingId + "的结局");
			}
			var dataArr:Array = NurEndingDefines["DATA"][gameId + "_" + endingId] as Array;
			var nurEndingDefine:NurEndingDefine = new NurEndingDefine(dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4]);
			return nurEndingDefine;
		}

		public static function getGameById(gameId:int):NurGameDefine{
			if(!NurGameDefines["DATA"][gameId]){
				throw new Error("找不到Id为" + gameId + "的游戏定义");
			}
			var dataArr:Array = NurGameDefines["DATA"][gameId] as Array;
			var nurGameDefine:NurGameDefine = new NurGameDefine(dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4]);	
			return nurGameDefine;
		}

		public static function getLatestGameId():int{
			return _lastGameId;
		}

		public static function getLatestChapterId():int{
			return getChaptersByGameId(_lastGameId).length;
		}

		public static function getTotalChapterNum(gameId:int):int{
			return getChaptersByGameId(gameId).length;
		}

		public static function getChaptersByGameId(gameId:int):Array{
			var datas:Object = NurChapterDefines["DATA"];
			var arr:Array = [];
			for each(var dataArr:Array in datas){
				var chapter:NurChapterDefine = new NurChapterDefine(dataArr[0], dataArr[1], dataArr[2]);
				if(chapter.gameId == gameId){
					arr.push(chapter);
				}
			}
			arr.sortOn("id", Array.NUMERIC);
			return arr;
		}

		public static function getCGsByGameId(gameId:int):Array{
			var datas:Object = NurCGDefines["DATA"];
			var arr:Array = [];
			for each(var dataArr:Array in datas){
				var cg:NurCGDefine = new NurCGDefine(dataArr[0], dataArr[1], dataArr[2], dataArr[3]);
				if(cg.gameId == gameId){
					arr.push(cg);
				}
			}
			arr.sortOn("id", Array.NUMERIC);
			return arr;
		}

		public static function getGamesByGameId():Array{
			var datas:Object = NurGameDefines["DATA"];
			var arr:Array = [];
			for each(var dataArr:Array in datas){
				var game:NurGameDefine = new NurGameDefine(dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4]);
				arr.push(game);
			}
			arr.sortOn("id", Array.NUMERIC | Array.DESCENDING);
			return arr;
		}

		public static function getTotalEndingsNum(gameId:int):int{
			return getEndingsByGameId(gameId).length;
		}

		public static function getEndingsByGameId(gameId:int):Array{
			var datas:Object = NurEndingDefines["DATA"];
			var arr:Array = [];
			for each(var dataArr:Array in datas){
				var ending:NurEndingDefine = new NurEndingDefine(dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4]);
				if(ending.gameId == gameId){
					arr.push(ending);
				}
			}
			arr.sortOn("id", Array.NUMERIC);
			return arr;
		}
	}
}

