package mmo.framework.domain.material.clothes
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;


	public class UserClothes extends UserMaterial
	{

		public static const IsFavor:String = "IsFavorClothes";
		
		//~ public methods ----------------------------------------------------

		public function UserClothes(material:Material, quantity:int, usedUp:int, getTime:Number = 0)
		{
			super(material, MaterialTypes.CLOTHES, quantity, usedUp, getTime);
		}
		
		public function set isFavor(isFavor:Boolean):void{
			setValue(IsFavor, isFavor);
		}
		
		public function get isFavor():Boolean{
			return Boolean(getValue(IsFavor));
		}

		/**
		 * 判断衣服是否已穿着
		 */
		public function isWearing():Boolean
		{
			return (this.usedUp > 0 ? true : false);
		}

		/**
		 * 获得配置的子元件数据
		 */
		public function getParts():Array
		{
			return (this.material as Clothes).parts;
		}

		override public function get material():Material
		{
			return this._material as Material;
		}

	}
}