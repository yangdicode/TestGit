package mmo.play.avatar.skinviewhelper
{
	import flash.utils.getDefinitionByName;

	
	public class SkinviewHelper
	{
		private static var EffectDataMap:Object = initConfigData();
		
		private static const HandlesMap:Object = 
			{
				"1":BackGroundSkinviewHandler
			};
		
		public function  SkinviewHelper()
		{
			
		}
		
		public static function getHandlerByName(skinvewFileName:String):ISkinviewHandler
		{
			
			if (!EffectDataMap.hasOwnProperty(skinvewFileName))
			{
				return null;
			}
			
			var skinvewType:int = getEffectParams(skinvewFileName)["type"];
			
			if (!HandlesMap.hasOwnProperty(skinvewType))
			{
				return null;
			}
			var cls:Class = HandlesMap[skinvewType];
			var handler:ISkinviewHandler = new cls();
			return handler;
		}
		
		public static function getEffectParams(skinvewFileName:String):Object
		{
			
			return EffectDataMap[skinvewFileName];
		}
		
		
		private static function initConfigData():Object
		{
			
			var className:String = "mmo.materialdata.SkinviewEffectConfig";
			var type:Class = getDefinitionByName(className) as Class;
			

			return type["configData"];
			
			
		}
		
		
	}
}