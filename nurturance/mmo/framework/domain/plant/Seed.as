package mmo.framework.domain.plant
{
	public class Seed
	{
		private var _id:int;
		private var _outputId:int;
		private var _needTime:int;
		private var _price:int;
		private var _sellPrice:int;
		private var _income:int;
		private var _exp:int;
		private var _needLevel:int;
		private var _expectOutput:int;
		
		private var _starExp:int;
		private var _varRate:int;
		private var _fairyId:int;
		
		private var _name:String;
		private var _flowerName:String;
		private var _desc:String;
		private var _extData:Object;
		
		public function Seed(id:int, outputId:int, time:int, exp:int, outputQuantity:int,
							  price:int, sellPrice:int, income:int,
							  level:int, starExp:int, varRate:int, fairyId:int, name:String, flowerName:String, desc:String, extData:Object=null)
		{
			this._id = id;
			this._outputId = outputId;
			this._needTime = time;
			this._price = price;
			this._sellPrice = sellPrice;
			this._income = income;
			this._exp = exp;
			this._expectOutput = outputQuantity;
			this._needLevel = level;
			
			this._starExp = starExp;
			this._varRate = varRate;
			this._fairyId = fairyId;
			
			this._name = name;
			this._flowerName = flowerName;
			this._desc = desc;
			this._extData = extData;
		}
		
		/**
		 * 种子id
		 * @return 
		 */		
		public function get id():int {
			return this._id;
		}
		
		/**
		 * 产出物Id
		 * @return 
		 */
		public function get outputId():int{
			return this._outputId;
		}
		
		/**
		 * 成熟时间
		 * @return 
		 */		
		public function get needTime():int {
			return this._needTime;
		}
		
		/**
		 * 获得经验
		 * @return 
		 */		
		public function get gainExp():int {
			return this._exp;
		}
		
		/**
		 * 购买价格
		 * @return 
		 */
		public function get price():int{
			return this._price;
		}
		
		/**
		 * 果实售价
		 * @return 
		 */		
		public function get sellPrice():int {
			return this._sellPrice;
		}
		
		/**
		 * 收益
		 * @return 
		 */		
		public function get income():int {
			return this._income;
		}
		
		/**
		 * 预计产量
		 * @return 
		 */		
		public function get expectOutput():int {
			return this._expectOutput;
		}
		
		/**
		 * 需要的种植等级
		 * @return 
		 */		
		public function get needLevel():int {
			return this._needLevel;
		}
		
		/**
		 * 星辉经验
		 * @return 
		 */		
		public function get starExp():int {
			return this._starExp;
		}
		
		/**
		 * 变异概率
		 * @return 
		 */		
		public function get varRate():int {
			return this._varRate;
		}
		
		/**
		 * 产出星灵
		 * @return 
		 */		
		public function get fairyId():int {
			return this._fairyId;
		}
		
		/**
		 * 判断是否是星灵花
		 * @return 
		 */	
		public function get isStar():Boolean
		{
			if (this._starExp==0 && this._varRate==0 && this._fairyId==0)
			{
				return false;
			}
			return true;
		}
		
		/**
		 * 种子名字
		 * @return 
		 */		
		public function get name():String {
			return this._name;
		}
		
		/**
		 * 产出物名字
		 * @return 
		 */
		public function get flowerName():String{
			return this._flowerName;
		}
		
		/**
		 * 植物描述
		 * @return 
		 */		
		public function get desc():String {
			return this._desc;
		}
		
		/**
		 * 扩展字段
		 * @return 
		 */
		public function get extData():Object{
			return this._extData;
		}
	}
}