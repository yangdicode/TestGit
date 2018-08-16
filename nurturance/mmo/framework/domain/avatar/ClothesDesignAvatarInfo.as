package mmo.framework.domain.avatar
{
	import mmo.framework.domain.avatar.AvatarInfo;
	
	public class ClothesDesignAvatarInfo extends AvatarInfo
	{
		public static const DEFAULT:Array = [44, 45, 47];
		
		private var _npcId:int = 0;
		
		/**
		 * 替换掉原来的默认内衣，顺序是：[上衣id, 裤子id, 头发id]
		 */		
		public function ClothesDesignAvatarInfo(defaultClothesIds:Array = null, npcId:int = 0){
			super();
			_defaultClothesId = defaultClothesIds == null ? DEFAULT : defaultClothesIds;
			_npcId = npcId;
		}
		
		override public function setDefaultClothesBySex(isMale:Boolean):void{
		}

		public function get npcId():int
		{
			return _npcId;
		}
		
	}
}