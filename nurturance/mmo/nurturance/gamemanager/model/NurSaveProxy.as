package mmo.nurturance.gamemanager.model
{
	import com.adobe.utils.StringUtil;
	
	import mmo.common.DateUtil;
	import mmo.nurturance.gamemanager.client.LocalStore;
	import mmo.nurturance.gamemanager.entity.NurUserSave;

	public class NurSaveProxy
	{
		private var _saveDatas:Object = {};
		private var _gameId:int;

		public function NurSaveProxy()
		{
		}

		public function init(gameId:int, callBack:Function = null):void{
			_gameId = gameId;
			
			var saveInfos:String = LocalStore.getValue(gameId, LocalStore.AoYaNurturanceFile) as String;
			if (!StringUtil.isEmpty(saveInfos))
			{
				var arr:Array = saveInfos.split("&");
				for each(var info:String in arr)
				{
					var save:NurUserSave = getNewSave();
					save.parse(info);
					_saveDatas[save.saveId] = save;
				}
			}
			
			callBack==null || callBack.apply();
		}

		public function haveAutoSave():Boolean{
			return Boolean(getLeastAutoSave() != null);
		}

		public function isLock(saveId:int):Boolean{
			if(getSaveBySaveId(saveId)){
				return getSaveBySaveId(saveId).isLock;
			}
			return false;
		}

		public function isAuto(saveId:int):Boolean{
			var totalChapterNum:int = NurDefinesProvider.getTotalChapterNum(_gameId);
			return Boolean(saveId <= totalChapterNum && saveId > 0);
		}

		public function getLeastAutoSave():NurUserSave{
			var arr:Array = [];
			var saveId:int = -1;
			var saveTemp:NurUserSave;
			for each(var save:NurUserSave in _saveDatas)
			{
				if(save.isAuto)
					arr.push(save);
			}
			for(var n:int = 0; n < arr.length; n++)
			{
				if(arr[n].saveId > saveId)
				{
					saveId = arr[n].saveId;
					saveTemp = arr[n];
				}
			}
			return saveTemp;
		}

		public function getSaveBySaveId(saveId:int):NurUserSave{
			return _saveDatas[saveId] as NurUserSave;
		}

		public function haveSaveBySaveId(saveId:int):Boolean{
			return Boolean(_saveDatas[saveId]);
		}

		public function getNewSave():NurUserSave{
			return new NurUserSave(_gameId, -1, false, false, null, 1 , "", 0);
		}

		public function save(saveId:int, curNode:String, chapterId:int, extStr:String, callBack:Function = null):void{
			trace("??????????????????存档IDsaveId:" + saveId + "章节ID:" + chapterId + "=====" + extStr);
			var save:NurUserSave = _saveDatas[saveId];
			if(save == null){
				save = getNewSave();
				_saveDatas[saveId] = save;
				save.saveId = saveId;
				save.isAuto = isAuto(saveId);
				save.isLock = isAuto(saveId);
			}
			
			save.curNode = curNode;
			save.extStr = extStr;
			save.chapterId = chapterId;
			save.saveDate = DateUtil.getRealServerTime();
			
			LocalStore.setValue(_gameId, toString(), LocalStore.AoYaNurturanceFile);
			
			if(callBack != null){
				callBack.apply();
			}
		}
		
		public function lockSave(saveId:int, isLock:Boolean, callBack:Function = null):void{
			var save:NurUserSave = _saveDatas[saveId];
			save.isLock = isLock;
			
			LocalStore.setValue(_gameId, toString(), LocalStore.AoYaNurturanceFile);
			
			if(callBack != null){
				callBack.apply();
			}
		}
		
		public function toString():String
		{
			var arr:Array = [];
			for each(var info:NurUserSave in _saveDatas)
			{
				arr.push(info.toString());
			}
			return arr.join("&");
		}
	}
}

