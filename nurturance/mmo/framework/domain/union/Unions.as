package mmo.framework.domain.union
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.union.define.UnionHonor;
	import mmo.framework.domain.union.define.UnionJob;
	import mmo.framework.domain.union.define.UnionLevel;
	import mmo.framework.domain.union.define.UnionTitle;

	public class Unions
	{
		private static const baseConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.union.config.UnionBaseConfig") as Class;
		
		public static function getUnionLevelByLv(lv:int):UnionLevel{
			var data:Object = baseConfig["levelData"];
			return data[lv];
		}
		
		public static function get allUnionLv():Array{
			var arr:Array = [];
			var data:Object = baseConfig["levelData"];
			for each(var lv:UnionLevel in data){
				arr.push(lv);
			}
			arr.sortOn("level", Array.NUMERIC);
			return arr;
		}
		
		public static function getJobByJonId(id:int):UnionJob{
			var data:Object = baseConfig["jobData"];
			return data[id];
		}
		
		public static function get MaxUnionLevel():int{
			var data:Object = baseConfig["levelData"];
			var max:int = 0;
			for each(var lv:UnionLevel in data){
				max = max > lv.level ? max : lv.level;
			}
			return max;
		}
		
		public static function get yuZuanId():int{
			return 3345;
		}
		
		//根据声望取爵位
		public static function getTitleByReputation(reputation:int):UnionTitle{
			var allTitle:Array = allTitle;
			var eTitle:UnionTitle;
			for(var i:int = 0; i < allTitle.length; i ++){
				eTitle = allTitle[i];
				if(reputation < eTitle.needPrestige){
					return allTitle[i - 1];
				}
			}
			return eTitle;
		}
		
		//根据爵位等级取爵位
		public static function getTitleByLv(lv:int):UnionTitle{
			var data:Object = baseConfig["titleData"];
			return data[lv];
		}
		
		public static function get allTitle():Array{
			var data:Object = baseConfig["titleData"];
			var arr:Array = [];
			for each(var title:UnionTitle in data){
				arr.push(title);
			}
			arr.sortOn("id", Array.NUMERIC | Array.NUMERIC);
			return arr;
		}
		
		public static function getHonorById(id:int):UnionHonor{
			var data:Object = baseConfig["honorData"];
			return data[id];
		}
		
	}
}