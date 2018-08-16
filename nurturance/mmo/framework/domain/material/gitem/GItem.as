package mmo.framework.domain.material.gitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.visitor.MaterialVisitor;

	/**
	 * 
	 * @author yangfeng
	 */
	public class GItem extends Material
	{
		private var _type:int;
		private var _useType:int;
		private var _extraData:*;
		private var _forbiddenShowChange:Boolean;

		public function GItem(id:int, name:String, maxOwnNum:int, value:int, sellPrice:int, isBind:int, isVip:int, des:String, type:int, canTrade:int, isOutOfPrint:int, useType:int = -1, extraData:Object = null)
		{
			super(id, MaterialTypes.GITEM, name, maxOwnNum, value, sellPrice, isBind, isVip, des, canTrade, isOutOfPrint);
			_type = type;
			_useType = useType;
			_extraData = extraData;
			if(_extraData!=null)
			{
				_forbiddenShowChange = _extraData.hasOwnProperty("forbiddenShowChange") ? _extraData["forbiddenShowChange"] : false;
				if(_extraData.hasOwnProperty("userType"))
				{	
					_useType=_extraData["userType"];
				}else
				{
					_useType = useType;
				}
			}

		}

		/**
		 *物品类型 (GItemTypes)
		 * @return
		 *
		 */
		public function get type():int
		{
			return _type;
		}

		/**
		 * 物品点击使用类型
		 * -1表示不能点击使用
		 * */
		public function get useType():int
		{
			return _useType;
		}

		/**
		 *
		 * 附加数据
		 * */
		public function get extraData():*
		{
			return _extraData;
		}
		
		/**
		 * 禁止显示物品变化
		 */		
		public function get forbiddenShowChange():Boolean{
			return _forbiddenShowChange;
		}

		override public function accept(materialVisitor:MaterialVisitor):*
		{
			return materialVisitor.visitorGItem(this);
		}
	}
}