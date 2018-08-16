package mmo.nurturance.nodehandle.build
{
	import com.adobe.utils.StringUtil;
	
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.nodehandle.handler.ChangePropsObject;

	public class NurPropManager
	{
		private var _saveDoc:NurUserSave;
		//好感度
		private var _propsData:ChangePropsObject;
		//特殊好感度
		private var _specialPropsData:ChangePropsObject;
		//分支好感度
		private var _branchPropsData:ChangePropsObject;
		//其他感度
		private var _otherPropsData:ChangePropsObject;
		private var _saveNodeStr:String;
		
		public function NurPropManager()
		{
		}
		
		public function init(doc:NurUserSave):void
		{
			_saveDoc = doc;
			_propsData = new ChangePropsObject();
			_specialPropsData = new ChangePropsObject();
			_branchPropsData = new ChangePropsObject();
			_otherPropsData = new ChangePropsObject();
			if(_saveDoc.extStr == null || _saveDoc.extStr == "")
			{
				_saveNodeStr = "";
			}
			else
			{
				_saveNodeStr = _saveDoc.extStr.split("|")[0];
			}
			initPropsData();
			NurEventDispatcher.instance.addEventListener(NurEvent.CHANGE_PROP, onChangeProp);
		}
		
		public function dispose():void
		{
			_saveDoc = null;
			_propsData = null;
			_specialPropsData = null;
			_branchPropsData = null;
			_otherPropsData = null;
		}
		
		private function initPropsData():void
		{
			var arr:Array = _saveNodeStr.split(",");
			for(var i:int = 0; i < arr.length; i++)
			{
				if(!StringUtil.isEmpty(arr[i]) && arr[i] != null)
				{
					trace("initPropsData =========arr" + arr);
					var change:Array = NurManageHandler.instance.ChangesConfig[arr[i].split("_")[0]][arr[i].split("_")[1]];
					changeProp(change);
				}
			}
		}
		
		private function onChangeProp(evt:NurEvent):void
		{
			trace("onChangeProp key====" + (evt.pramas["key"]));
			trace("onChangeProp index====" + (evt.pramas["index"]));
			var change:Array = NurManageHandler.instance.ChangesConfig[evt.pramas["key"]][evt.pramas["index"]];
			if(_saveNodeStr != "")
			{
				_saveNodeStr += ("," + evt.pramas["key"] + "_" + evt.pramas["index"]);
			}
			else
			{
				_saveNodeStr += (evt.pramas["key"] + "_" + evt.pramas["index"]);
			}
			
			changeProp(change);
		}
		
		private function changeProp(props:Array):void
		{
			for each(var changeObj:Object in props)
			{
				if(changeObj["type"] == "favor")
				{
					var favorArr:Array = changeObj["value"].split("_");
					_propsData.addValue(favorArr[0] + "_" + favorArr[1], int(favorArr[2]));
				}
				
				else if(changeObj["type"] == "specialfavor")
				{
					var specialFavorArr:Array = changeObj["value"].split("_");
					trace("changeProp  type===========" + (specialFavorArr[0] + "_" + specialFavorArr[1]));
					trace("changeProp  value===========" + (specialFavorArr[2]));
					_specialPropsData.addValue(specialFavorArr[0] + "_" + specialFavorArr[1], int(specialFavorArr[2]));
				}
				else if(changeObj["type"] == "branchFavor")
				{
					var branchFavorArr:Array = changeObj["value"].split("_");
					trace("changeProp  type===========" + (branchFavorArr[0] + "_" + branchFavorArr[1]));
					trace("changeProp  value===========" + (branchFavorArr[2]));
					_branchPropsData.addValue(branchFavorArr[0] + "_" + branchFavorArr[1], int(branchFavorArr[2]));
				}
				else if(changeObj["type"] == "otherFavor")
				{
					var otherFavorArr:Array = changeObj["value"].split("_");
					trace("otherChangeProp  type===========" + (otherFavorArr[0] + "_" + otherFavorArr[1]));
					trace("otherChangeProp  value===========" + (otherFavorArr[2]));
					_otherPropsData.addValue(otherFavorArr[0] + "_" + otherFavorArr[1], int(otherFavorArr[2]));
				}
			}
		}

		public function get saveNodeStr():String
		{
			return _saveNodeStr;
		}
		
		

		public function get propsData():ChangePropsObject
		{
			return _propsData;
		}
		
		public function get specialPropsData():ChangePropsObject
		{
			return _specialPropsData;
		}

		public function get branchPropsData():ChangePropsObject
		{
			return _branchPropsData;
		}
		
		public function get otherPropsData():ChangePropsObject
		{
			return _otherPropsData;
		}
	}
}