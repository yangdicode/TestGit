package mmo.framework.domain.profession
{
	import mmo.framework.domain.property.Race;
	
	/**
	 * 职业定义
	 * @author liyawei
	 */	
	
	public class Profession extends ProfessionBase
	{
		private var _type:int;
		private var _demandScore:int;
		private var _limitPro:String;
		
		public function Profession(id:int,name:String,des:String,type:int,demandScore:int,isVip:int,
								   phyAttRate:int,magAttRate:int,extAttRate:int,initWeapon:int,
								   limitPro:String,backGroundStory:String, 
								   phyAttLv:int, magAttLv:int, lifeLv:int, phyDefLv:int, magDefLv:int, speedLv:int)
		{
			super(id, name, des, backGroundStory, isVip, phyAttRate, magAttRate, extAttRate, initWeapon, phyAttLv, magAttLv, lifeLv, phyDefLv, magDefLv, speedLv);
			this._type = type;
			this._demandScore = demandScore;
			this._limitPro = limitPro;
		}
		
		/**
		 * 职业线路
		 */
		public function get type():int
		{
			return _type;
		}
		
		/**
		 * 转职金币需求
		 */
		public function get demandScore():int
		{
			return _demandScore;
		}
		
		/**
		 * 获得前置职业条件(形式：2-10,3-10之类的)
		 * return [obj(proId,proLv)]
		 */		
		public function get limitPro():Array
		{
			if(this._limitPro == ""){
				return null;
			}
			var limitProArray:Array = new Array();
			var proStrArray:Array = this._limitPro.split(",");
			for each(var proStr:String in proStrArray){
				var strArray:Array = proStr.split("-");
				var strObj:Object = {"proId":strArray[0],"proLv":strArray[1]};
				limitProArray.push(strObj);
			}
			return limitProArray;
		}
		
		public function canTransform():Boolean
		{
			return (id > 4 );
		}

	}
}