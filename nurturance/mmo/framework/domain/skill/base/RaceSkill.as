package mmo.framework.domain.skill.base
{
	/**
	 * 种族技能基类
	 * 包括：经验，等级，所获得的子技能
	 * @author liyawei
	 */	
	
	public class RaceSkill
	{
		/** 技能ID **/
		private var _id:int;
		
		/** 技能类型**/		
		private var _mainType:int;
		
		/** 技能名称 **/
		private var _name:String;
		
		/** 技能分类 **/
		private var _type:String;
		
		/** 技能描述 **/
		private var _descript:String;
		
		/** 技能等级 **/
		private var _level:int;
		
		/** 技能等级限制 **/
		private var _learnNeedSkillLv:int;
		
		/** 人物等级限制 **/
		private var _learnNeedLv:int;
		
		/** 学习需求金币 **/
		private var _learnNeedScore:int;
		
		/** 其他技能学习限制 (XML，需要解析) **/
		private var _learnLimits:XML;
		
		/** 制作所需原材料 **/
		private var _stuffs:XML;
		
		/** 制作出的物品**/
		private var _product:XML;
		
		public function RaceSkill(id:int,mainType:int,name:String,type:String,descript:String,lv:int,learnNeedSkillLv:int,
									learnNeedLv:int,learnNeedScore:int,learnLimits:XML,stuffs:XML,product:XML
		)
		{
			this._id = id;
			this._mainType = mainType;
			this._name = name;
			this._type = type;
			this._descript = descript;
			this._level = lv;
			this._learnNeedSkillLv = learnNeedSkillLv;
			this._learnNeedLv = learnNeedLv;
			this._learnNeedScore = learnNeedScore;
			this._learnLimits = learnLimits;
			this._stuffs = stuffs;
			this._product = product;
		}
		
		/** 技能ID **/
		public function get id():int
		{
			return this._id;
		}
		
		/** 技能类型(哪种种族技能)  **/
		public function get mainType():int
		{
			return this._mainType;
		}
		
		/** 技能名称 **/
		public function get name():String
		{
			return this._name;
		}
		
		/** 技能具体分类(根据生成物)  **/	
		public function get type():String
		{
			return this._type;
		}
		
		/** 技能描述 **/
		public function get descript():String
		{
			return this._descript;
		}
		
		/** 技能等级 **/
		public function get level():int
		{
			return this._level;
		}
		
		/** 技能等级限制 **/
		public function get learnNeedSkillLv():int
		{
			return this._learnNeedSkillLv
		}
		
		/** 去掉人物等级限制，统一为0 **/
		public function get learnNeedLv():int
		{
			return 0;
		}
		
		/** 学习需求金币 **/
		public function get learnNeedScore():int
		{
			return this._learnNeedScore;
		}
		
		/** 制作所需原材料
		 * return stuffArray = [stuffObj]
		 * stuffObj.type 物品类型
		 * stuffObj.id   物品ID
		 * stuffObj.num  物品数量
		 * */
		public function get stuffs():Array
		{
			if(this._stuffs == null){
				return null;
			}
			var stuffItems:XMLList = _stuffs.item;
			if(stuffItems == null || stuffItems.length() <= 0){
				return null;
			}
			var stuffArray:Array = new Array();
			for each (var item:XML in stuffItems){
				var stuffObj:Object = {"type":item.@type,"id":item.@id,"num":item.@num};
				stuffArray.push(stuffObj);
			}
			return stuffArray;
		}
		
		/** 制作出的物品
		 * return productArray = [productObj]
		 * productObj.type 物品类型
		 * productObj.id   物品ID
		 * productObj.num  物品数量
		 * **/
		public function get product():Array
		{
			if(this._product == null){
				return null;
			}
			var productItems:XMLList = this._product.item; 
			if(productItems == null || productItems.length() <= 0){
				return null;
			}
			var productArray:Array = new Array();
			for each (var item:XML in productItems){
				var  productObj:Object = {"type":item.@type,"id":item.@id,"num":item.@num};
				productArray.push(productObj);
			}
			return productArray;
		}
		
		/** 其他技能学习限制 (XML，需要解析) **/
		public function get learnLimits():XML
		{
			return this._learnLimits;
		}
	}
}