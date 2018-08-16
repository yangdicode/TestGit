package mmo.framework.domain.material
{
	import mmo.framework.domain.material.visitor.MaterialVisitor;

	/**
	 * 物品定义基础类
	 */
	public class Material
	{
		protected static const instantiated:Object = {};
		/**
		 * 物品id
		 */
		private var _id:int;
		/**
		 * 物品类别(MaterialTypes)
		 */
		private var _materialType:int;
		/**
		 * 物品名称
		 */
		protected var _name:String;
		/**
		 * 最大可拥有量
		 */
		private var _maxOwnNum:int;
		/**
		 * 价值
		 * */
		private var _value:int;
		/**
		 * 回购价
		 */
		private var _sellPrice:int;
		/**
		 * 是否绑定
		 */
		private var _isBind:int;
		/**
		 * 是否会员专有
		 */
		private var _isVip:int;
		/**
		 * 描述
		 * */
		protected var _description:String;
		/**
		 * 是否可交易
		 */
		private var _canTrade:int;
		/**
		 * 是否绝版
		 */
		private var _isOutOfPrint:int;

		public function Material(id:int, materialType:int, name:String, maxOwnNum:int, value:int, sellPrice:int, isBind:int, isVip:int, description:String, canTrade:int, isOutOfPrint)
		{
			var key:String = materialType + "_" + id;
			if (instantiated.hasOwnProperty(key))
			{
				throw new Error("物品定义: " + key + "已经被实例化!!不可重复实例化!");
			}
			instantiated[key] = this;
			this._id = id;
			this._materialType = materialType;
			this._name = name;
			this._maxOwnNum = maxOwnNum;
			this._value = value;
			this._sellPrice = sellPrice;
			this._isBind = isBind;
			this._isVip = isVip;
			this._description = description;
			this._canTrade = canTrade;
			this._isOutOfPrint = isOutOfPrint;
		}

		/**
		 * 物品id
		 */
		public function get id():int
		{
			return this._id;
		}

		/**
		 * 物品类别(MaterialTypes)
		 */
		public function get materialType():int
		{
			return this._materialType;
		}

		/**
		 * 物品名称
		 */
		public function get name():String
		{
			return this._name;
		}

		/**
		 * 最大可拥有量
		 */
		public function get maxOwnNum():int
		{
			return this._maxOwnNum;
		}

		/**
		 * 价值
		 * */
		public function get value():int
		{
			return this._value;
		}

		/**
		 * 回购价
		 * */
		public function get sellPrice():int
		{
			return this._sellPrice;
		}

		/**
		 * 是否绑定
		 * */
		public function get isBind():Boolean
		{
			return (this._isBind == 1);
		}

		/**
		 * 是否会员专有
		 * */
		public function get isVip():Boolean
		{
			return (this._isVip == 1);
		}

		/**
		 * 描述
		 * */
		public function get description():String
		{
			return this._description;
		}

		/**
		 * 是否可交易
		 * */
		public function get canTrade():Boolean
		{
			return (this._canTrade == 1);
		}
		
		public function isOutofPrice():Boolean
		{
			return _isOutOfPrint == 1;
		}
		
		public function accept(materialVisitor:MaterialVisitor):*
		{
			throw new Error("virtural method");
		}
	}
}