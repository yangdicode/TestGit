package mmo.framework.domain.vipmood
{
	import flash.system.ApplicationDomain;

	public class VipMoodDefines
	{
		private static const MoodsConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.VipMoodsData") as Class;
		
		public function VipMoodDefines()
		{
		}
		
		public static function getMoonDefine(moodId:int):VipMoodDefine{
			var data:Array = MoodsConfig["data"];			
			return data[moodId];			
		}
		
		public static function getAllHalosIds():Array{
			return MoodsConfig["data"];
		}
		
	}
}