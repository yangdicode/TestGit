package mmo.framework.domain.course
{
	/**
	 * 课程定义
	 * @author LIYAWEI
	 * */
	
	public class Course
	{
		private var _courseId:int;
		
		private var _name:String;
		
		private var _description:String;
		
		private var _type:int;
		
		private var _limitAttr:XML;
		
		private var _limitVip:int;
		
		private var _limitBaseLv:int;
		
		private var _limitProfession:int;
		
		private var _demandRmb:int;
		
		private var _demandScore:int;
		
		private var _demandItem:XML;
		
		private var _bonus:XML;
		
		public function Course(id:int,name:String,des:String,type:int,limitAttr:XML,limitVip:int,limitBaseLv:int,
							     limitProfession:int,demandRmb:int,demandScore:int,demandItem:XML)
		{
			this._courseId = id;
			this._name = name;
			this._description = des;
			this._type = type;
			this._limitAttr = limitAttr;
			this._limitVip = limitVip;
			this._limitBaseLv = limitBaseLv;
			this._limitProfession = limitProfession;
			this._demandRmb = demandRmb;
			this._demandScore = demandScore;
			this._demandItem = demandItem;
		}
		
		/**
		 * 课程ID
		 */		
		public function get courseId():int
		{
			return this._courseId;
		}
		
		/**
		 * 课程名称
		 */	
		public function get name():String
		{
			return this._name;
		}
		
		/**
		 * 课程描述
		 */	
		public function get description():String
		{
			return this._description;
		}
		
		/**
		 * 课程主类别(基础课程，职业课程)
		 */	
		public function get type():int
		{
			return this._type;
		}
		
		/**
		 * 属性限制
		 * 返回 attrObject[courseAttrType] = {type,min,max};
		 */	
		public function get limitAttr():Object
		{
			if(this._limitAttr == null){
				return null;
			}
			var limits:XMLList = _limitAttr.attr;
			if(limits == null || limits.length() == 0){
				return null;
			}
			var attrObject:Object = new Object();
			for each (var attrLimit:XML in limits){
				var limitObj:Object = {"type":attrLimit.@type,"min":attrLimit.@min,"max":attrLimit.@max};
				attrObject[attrLimit.@type] = limitObj;
			}
			return attrObject;
		}
		
		/**
		 * VIP限制
		 */	
		public function get limitVip():Boolean
		{
			return (this._limitVip == 1);
		}
		
		/**
		 * 等级限制
		 */	
		public function get limitBaseLv():int
		{
			return this._limitBaseLv;
		}
		
		/**
		 * 职业限制
		 */	
		public function get limitProfession():int
		{
			return this._limitProfession;
		}
		
		/**
		 * RMB需求
		 */		
		public function get demandRmb():int
		{
			return this._demandRmb;
		}
		
		/**
		 * 金币需求 
		 */		
		public function get demanScore():int
		{
			return this._demandScore;
		}
		
		/**
		 * 物品需求 
		 * return itemArray = {id,num}
		 */		
		public function get demandItem():Array
		{
			if(this._demandItem == null){
				return null;
			}
			var items:XMLList = _demandItem.item;
			if(items == null || items.length() <= 0){
				return null;
			}
			var itemArray:Array = new Array();
			for each (var item:XML in items){
				var itemObj:Object = {"id":item.@id,"num":item.@num};
				itemArray.push(itemObj);
			}
			return itemArray;
		}
		
		/**
		 * 奖励(前端估计用不到，预留着)
		 */		
		public function get bonus():XML
		{
			return this._bonus;
		}
	}
}