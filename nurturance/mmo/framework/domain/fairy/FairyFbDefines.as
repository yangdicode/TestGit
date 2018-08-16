package mmo.framework.domain.fairy
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.fairy.FairyFbDefine;
	import mmo.framework.domain.fairy.FairySubFbDefine;

	public class FairyFbDefines
	{
		private static var fbCls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyFbDatas") as Class;
		private static var subFbCls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairySubFbsData") as Class;
		private static var timeLimitCls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyTimeLimitFbDatas") as Class;
		private static var fbDefines:Object = fbCls["fbDefine"];
		private static var npcAilliance:Object = fbCls["npcAilliance"];
		private static var fbSubDefines:Object = subFbCls["subFbDefine"];
		private static var _timeLimitDatas:Object = timeLimitCls["data"];
		private static var fb2SubFbMap:Object;
		
		public function FairyFbDefines()
		{
		}
		
		public static function getFbDefineById(id:int):FairyFbDefine{
			if(!fbDefines.hasOwnProperty(id)){
				throw new Error("没有找到一级副本定义!");
			}
			return fbDefines[id];
		}
		
		public static function getSubFbDefineById(fbId:int, subFbId:int):FairySubFbDefine{
			var key:String = fbId + "_" + subFbId;
			if(!fbSubDefines.hasOwnProperty(key)){
				throw new Error("没有找到二级副本定义!");
			}
			return fbSubDefines[key];
		}
		
		public static function getFbSubDefines(fbId:int):Array{
			if(fb2SubFbMap == null)
				initMap();
			if(!fb2SubFbMap.hasOwnProperty(fbId)){
				throw new Error("没有找到一级副本定义!");
			}
			return fb2SubFbMap[fbId];
		}
		
		/**
		 * @param type FairyFbDefine;
		 * 		public static const NORMAL_FB_NAME:String = "常规";
		 *		public static const COMMUNITY_FB_NAME:String = "活动";
		 *		public static const TECHNIQUE_FB_NAME:String = "技术";
		 */		
		public static function getFbDefinesByType(type:String):Array{
			var arr:Array = [];
			for each(var fbDefine:FairyFbDefine in fbDefines){
				if(!fbDefine.isOnline){
					continue;
				}
				if(fbDefine.type == type){
					arr.push(fbDefine);
				}
			}
			return arr;
		}
		
		public static function getNpcAilliance():Object{
			return npcAilliance;
		}
		
		public static function needBuy(fbId:int):Boolean{
			return _timeLimitDatas.hasOwnProperty(fbId);
		}
		
		public static function getBuyFbDefine(fbId:int):FairyTimeLimitedFbDefine{
			return _timeLimitDatas[fbId];
		}
		
		private static function initMap():void{
			fb2SubFbMap = {};
			for each(var subFbDefine:FairySubFbDefine in fbSubDefines){
				if(fb2SubFbMap.hasOwnProperty(subFbDefine.fbId)){
					fb2SubFbMap[subFbDefine.fbId].push(subFbDefine);
				}else{
					fb2SubFbMap[subFbDefine.fbId] = [subFbDefine];
				}
			}
		}
		
	}
}