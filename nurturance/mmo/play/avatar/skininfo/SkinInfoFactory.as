package mmo.play.avatar.skininfo
{

	import mmo.play.avatar.SkinInfo;

	public class SkinInfoFactory
	{

		//~ constants ---------------------------------------------------------
		
		public static function getInfoByKey(key:int):SkinInfo{
			switch(key){
				case 1:return CLOTHES;break;
				case 2:return EYEMOVIE;break;
				case 3:return WING;break;
				case 4:return SPECIALCLOTHES;break;
				case 5:return TEMPCLOTHES;break;
				case 6:return SCENE_PET1;break;
				case 7:return SCENE_PET2;break;
				case 8:return RIDE_PET;break;
				case 9:return FLY_RIDE_PET;break;
				case 10:return SCENE_FOLLOWER;break;
				case 11:return TRANSFORMER;break;
			}
			return null;
		}
		
		/**
		 * 衣服
		 */
		public static const CLOTHES:SkinInfo = new SkinInfo();

		/**
		 * 站立时眨动的眼睛
		 */
		public static const EYEMOVIE:SkinInfo = new SkinInfoForEyeMovie();
		
		/**
		 * 飞行时特殊翅膀动作
		 */
		public static const WING:SkinInfo = new SkinInfoForWing();
		/**
		 * 衣服动作特殊配置
		 */
		public static const SPECIALCLOTHES:SkinInfo = new SpecialSkinInfo();
		/**
		 * 活动衣服动作特殊配置
		 */
		public static const TEMPCLOTHES:SkinInfo = new TempSkinInfo();

//		/**
//		 * 特效衣服
//		 */
//		public static const CLOTHES_EFFECT_MOVIE:SkinInfo = new SkinInfoForEffectPlayer();
//
		/**
		 * 四桢场景宠物
		 */
		public static const SCENE_PET1:SkinInfo = new SkinInfoForScenePet1();
		
		/**
		 * 二桢场景宠物
		 * */
		public static const SCENE_PET2:SkinInfo = new SkinInfoForScenePet2();
		
		/**
		 * 骑宠
		 * */
		public static const RIDE_PET:SkinInfo = new SkinInfoForRidingPet();
		/**
		 * 陆空骑宠
		 * */
		public static const FLY_RIDE_PET:SkinInfo = new SkinInfoForFlyRidingPet();
		/**
		 * 
		 * 6桢场景跟随物
		 * */
		public static const SCENE_FOLLOWER:SkinInfo = new SkinInfoForFollower();
		
		/**
		 * 变身的形象 
		 * */
		public static const TRANSFORMER:SkinInfo = new SkinInfoForTransformer();

		//~ public methods ----------------------------------------------------

		public function SkinInfoFactory()
		{
		}

	}
}