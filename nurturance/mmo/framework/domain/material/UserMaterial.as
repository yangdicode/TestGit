package mmo.framework.domain.material
{
	import mmo.framework.model.changeable.ChangeableObject;
	
	/**
	 * 用户物品信息 
	 */
	public class UserMaterial extends ChangeableObject
	{
		//~ fields ------------------------------------------------------------
		
		public static const propertyQuantity:String = "quantity";
		public static const propertyUseUp:String = "usedUp";
		
		/** 物品ID */
		protected var _materialId:int;
		
		/** 物品类别 */
		protected var _materialType:int;
		
		
		/** 附加自定义信息 */
		protected var _extraInfo:Object;
		
		/** 对应物品数据 */
		protected var _material:Material;
		
		protected var _getTime:Number;
		
		//~ public methods ----------------------------------------------------
		
		public function UserMaterial(material:Material, materialType:int, quantity:int, usedUp:int, getTime:Number = 0) {
			this._material = material;
			this._materialId = material.id;
			this._materialType = materialType;
			this._getTime = getTime;
			
			this.setValue(propertyQuantity, quantity);
			this.setValue(propertyUseUp, usedUp);
			
		}
		
		/**
		 * 物品ID
		 */
		public function get materialId():int {
			return this._materialId;
		}
		
		/**
		 * 物品类型
		 */
		public function get materialType():int {
			return this._materialType;
		}
		
		/**
		 * 物品总数
		 */
		public function get quantity():int {
			return int(this.getValue(propertyQuantity));
		}
		
		public function set quantity(quantity:int):void
		{
			this.setValue(propertyQuantity, quantity);
		}	
		/**
		 * 物品已用数目
		 */
		public function get usedUp():int {
			return int(this.getValue(propertyUseUp));
		}
		
		public function set usedUp(usedUp:int):void
		{
			this.setValue(propertyUseUp, usedUp);	
		}	
		
		public function get available():int
		{
			return this.quantity - this.usedUp;
		}
		
		/**
		 * 物品定义 
		 * @return 
		 * 
		 */
		public function get material():Material
		{
			return this._material;
		}
		
		/**物品获得时间**/
		public function get getTime():Number
		{
			return _getTime;
		}
		
		public function set getTime(t:Number):void
		{
			_getTime = t;
		}
		
		/**
		 * 设置额外信息
		 * 
		 * @param key	关键字
		 * @param value	信息
		 */
		public function setExtraInfo(key:String, value:Object):void {
			if(this._extraInfo == null)
			{
				this._extraInfo = {};
			}
			this._extraInfo[key] = value;
			if(value == null) {
				delete this._extraInfo[key];
			}
		}
		
		/**
		 * 获得额外信息
		 * 
		 * @param key	关键字
		 * 
		 * @return	信息
		 */
		public function getExtraInfo(key:String):Object {
			return this._extraInfo[key];
		}
		
		public override function toString():String {
			return "UesrMaterial：id: " + _materialId + " type:" + _materialType + " " + super.toString();
		}
		
		public function clone():UserMaterial
		{
			return new UserMaterial(this.material, this.materialType, this.quantity, this.usedUp);
		}	

	}
}