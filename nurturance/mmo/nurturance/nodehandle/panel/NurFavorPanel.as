package mmo.nurturance.nodehandle.panel
{
	import com.adobe.utils.StringUtil;
	
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.play.panel.CommonBasePanel;
	
	public class NurFavorPanel extends CommonBasePanel
	{
		public function NurFavorPanel()
		{
		}
		
		protected override function initPanelAfterLoaded():void
		{
			setFavor();
			setSpecialFavor();
			setOtherFavor();
		}
		
		protected override function get panelClass():String
		{
			return "mmo.nurturance.nur" + NurManageHandler.instance.saveDoc().gameId + ".NurFavorPanel";
		}
		
		protected override function get panelPath():String
		{
			return "nurturance/nurext/nur" + NurManageHandler.instance.saveDoc().gameId + "res/nurui" + NurManageHandler.instance.saveDoc().gameId;
		}
		
		private function setFavor():void
		{
			var values:Object = NurManageHandler.instance.propManager.propsData.values;
			for(var key:String in values)
			{
				if(view["textFavor" + key] != null)
					view["textFavor" + key].text = values[key].toString();
				
				var arr:Array = key.split("_");
				var reKey:String = arr[1] + "_" + arr[0];
				if(view["textFavor" + reKey] != null)
					view["textFavor" + reKey].text = values[key].toString();
			}
		}
		
		private function setSpecialFavor():void
		{
			var values:Object = NurManageHandler.instance.propManager.specialPropsData.values;
			for(var key:String in values)
			{
				if(view["textSpecialFavor" + key] != null)
					view["textSpecialFavor" + key].text = values[key].toString();
				
				var arr:Array = key.split("_");
				var reKey:String = arr[1] + "_" + arr[0];
				if(view["textSpecialFavor" + reKey] != null)
					view["textSpecialFavor" + reKey].text = values[key].toString();
			}
		}
		
		private function setOtherFavor():void
		{
			trace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@");
			var values:Object = NurManageHandler.instance.propManager.otherPropsData.values;
			for(var key:String in values)
			{
				trace("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXkey:"+key);
				if(view["textOtherFavor" + key] != null)
					view["textOtherFavor" + key].text = values[key].toString();
				
				var arr:Array = key.split("_");
				var reKey:String = arr[1] + "_" + arr[0];
				if(view["textOtherFavor" + reKey] != null)
					view["textOtherFavor" + reKey].text = values[key].toString();
			}
		}
	}
}