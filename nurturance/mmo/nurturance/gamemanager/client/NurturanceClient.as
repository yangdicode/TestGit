package mmo.nurturance.gamemanager.client
{
	public class NurturanceClient
	{
		private static const Cmd_SetSave:String = "106_1";// 存档
		private static const Cmd_LockSave:String = "106_2";// 锁定存档
		private static const Cmd_GetSaves:String = "106_3";// 获取存档
		private static const Cmd_FinishChapter:String = "106_4";// 完成章节
		private static const Cmd_GainEnding:String = "106_5";// 获得结局
		private static const Cmd_GainCg:String = "106_6";// 获得CG
		private static const Cmd_GetStates:String = "106_7";// 状态信息

		private static const EXTENSIONS_ID:int = 106;

		public function NurturanceClient()
		{
		}

		public static function sendMsgAndCallBack(cmd:String, params:Object = null, callBack:Function = null):void{
			callBack.apply();
		}

		public static function save(gameId:int, saveId:int, curNode:String, chapterId:int, extStr:String, callBack:Function = null):void{
			sendMsgAndCallBack(Cmd_SetSave, {"gid":gameId, "sid":saveId, "cn":curNode, "pn":extStr, "c":chapterId}, callBack);
		}

		public static function lockSave(gameId:int, saveId:int, isLock:Boolean, callBack:Function = null):void{
			sendMsgAndCallBack(Cmd_LockSave, {"gid":gameId, "sid":saveId, "il":isLock}, callBack);
		}

		public static function getSaveData(gameId:int, callBack:Function = null):void{
			sendMsgAndCallBack(Cmd_GetSaves, {"gid":gameId}, callBack);
		}

		public static function finishChapter(gameId:int, chapterId:int, callBack:Function = null):void{
			sendMsgAndCallBack(Cmd_FinishChapter, {"gid":gameId, "c":chapterId}, callBack);
		}

		public static function gainEnding(gameId:int, endingId:int, callBack:Function = null):void{
			sendMsgAndCallBack(Cmd_GainEnding, {"gid":gameId, "e":endingId}, callBack);
		}

		public static function gainCG(gameId:int, cgId:int, callBack:Function = null):void{
			sendMsgAndCallBack(Cmd_GainCg, {"gid":gameId, "cg":cgId}, callBack);
		}

		public static function getStateData(callBack:Function = null):void{
			sendMsgAndCallBack(Cmd_GetStates, {}, callBack);
		}
	}
}

