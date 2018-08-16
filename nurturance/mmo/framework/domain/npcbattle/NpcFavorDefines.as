package mmo.framework.domain.npcbattle
{
	import flash.system.ApplicationDomain;

	public class NpcFavorDefines
	{
		private static const NpcFavorConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.npcbattle.config.NpcFavorDefineData") as Class;
		private static const favorBuffConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.npcbattle.config.NpcFavorBuffData") as Class;
		
		private static var maxFavorData:Object;
		private static const MaxFavorLv:int = 10;
		
		public function NpcFavorDefines()
		{
		}
		
//		/**
//		 *	获取npc好感度的等级 ，目前等级是更npcId没关系的
//		 * @param npcId npcId
//		 * @param favor 用户的npc好感度值
//		 * @return  lv
//		 * 
//		 */		
//		public static function getNpcFavorLv(npcId:int,favor:int):int
//		{
//			var arrayFavorLv:Array = NpcFavorConfig["favorLvData"];
//			
//			for( var i:int =0;i<arrayFavorLv.length;i++ )
//			{
//				if( favor<= arrayFavorLv[i] )
//					return i;
//			}
//			return arrayFavorLv.length-1;
//		}
				
		public static function getNpcFavorDefineByFavor(npcId:int,favor:int):NpcFavorDefine
		{
			var data:Object = NpcFavorConfig["data"];
			var defineFavor:int = getNeedestFavorDefineFavor(favor);
			if (defineFavor ==0 )
				return data["0_0"];
			
			return data[npcId+"_"+defineFavor];
		}
		
		public static function getNpcFavorDefineByLv(npcId:int,favorLv:int):NpcFavorDefine
		{
			var data:Object = NpcFavorConfig["data"];
			
			var defineFavor:int = getNpcLvFavor(favorLv);
			if (defineFavor ==0 )
				return data["0_0"];
			
			return data[npcId+"_"+defineFavor];
		}
		
		/**
		 * ToDo:
		 */		
		public static function getNpcLvFavor(lv:int):int
		{
			return lv;
//			var arrayFavorLv:Array = NpcFavorConfig["favorLvData"];
//			return arrayFavorLv[lv];
		}
		
		public static function getMaxFavor(npcId:int):int
		{
			initMaxFavor();
			return maxFavorData[npcId];
		}
		
		public static function getNpcFavorBuffDefine(npcId:int, favor:int):NpcBuffDefine{
			var data:Object = favorBuffConfig["data"];
			var defineFavor:int = getNeedestFavorDefineFavor2(favor);
			var key:String = npcId + "_" + defineFavor;
			if(!data.hasOwnProperty(key)){
				return new NpcBuffDefine(npcId, favor);
			}else{
				return data[key];
			}
		}
		
		private static function initMaxFavor():void
		{
			if(maxFavorData != null)			
				return;
			
			maxFavorData = {};
			var favorData:Object = NpcFavorConfig["data"];
			for each(var favorDef:NpcFavorDefine in favorData){
				if(maxFavorData.hasOwnProperty(favorDef.npcId)){
					maxFavorData[favorDef.npcId] = Math.max(maxFavorData[favorDef.npcId], favorDef.favor);
				}else{
					maxFavorData[favorDef.npcId] = favorDef.favor;
				}
			}
		}
		
		
		/** 获取定义中最接近用户favor的favor向上取 **/
		private static function getNeedestFavorDefineFavor(favor:int):int
		{
			return Math.min(MaxFavorLv, favor);
//			var arrayFavorLv:Array = NpcFavorConfig["favorLvData"];
//			
//			for( var i:int =0;i<arrayFavorLv.length;i++ )
//			{
//				if( favor<= arrayFavorLv[i] )
//					return arrayFavorLv[i];
//			}
//			return arrayFavorLv[arrayFavorLv.length-1];
		}
		
		
		
		/** 获取定义中最接近用户favor的favor向下取 **/
		private static function getNeedestFavorDefineFavor2(favor:int):int
		{
			return favor;
//			var arrayFavorLv:Array = NpcFavorConfig["favorLvData"];
//			
//			for( var i:int = 1;i<arrayFavorLv.length;i++ )
//			{
//				if( favor < arrayFavorLv[i] )
//					return arrayFavorLv[i - 1];
//			}
//			return arrayFavorLv[arrayFavorLv.length-1];
		}
		
	}
}