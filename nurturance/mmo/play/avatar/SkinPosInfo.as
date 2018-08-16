package mmo.play.avatar {
	

	public final class SkinPosInfo {

		//~ constants ---------------------------------------------------------
		/**
		 * 衣服的层次部位,按照图层顺序由高层到低层排列
		 * 部位需要遵守的原则就是: 任何方向的时候都要在同一个层次中
		 * 如果不满足这个原则,就需要考虑拆分部位
		 *
		 * */
		public static const TOTAL:int = 50;
		//变身
		public static const TRANSFORM:int = 1;
		//梦幻花边(没有小人)
		public static const FRONT_BACKGROUND:int = 2;
		//尾巴(前)
		public static const WEIBA_QIAN:int = 3;
		//背部饰品(前)
		public static const BEIBU_SHIPIN_QIAN:int = 4;
		//光之翼前
		public static const GUANGZHIYI_QIAN:int = 5;
		//翅膀(前)
		public static const CHIBANG_QIAN:int = 6;//光之翼专用，其他翅膀请用GUANGZHIYI_QIAN
		//头饰1(前)
		public static const TOUSHI_1QIAN:int = 7;
		//头饰2(前)
		public static const TOUSHI_2QIAN:int = 8;
		//头发2(前)
		public static const TOUFA2_QIAN:int = 9;
		//巧灵族耳朵
		public static const ERDUO_QIAOLING:int = 10;
		//头发(前)
		public static const TOUFA_QIAN:int = 11;
		//披风(前)
		public static const PIFENG_QIAN:int = 12;
		//轻灵族特征耳朵
		public static const ERDUO_QINGLING:int = 13;
		//面部饰品
		public static const MIANBU_SHIPIN:int = 14;
		//眼睛,嘴巴_模型
		public static const YAN_ZUI_SKIN:int = 15;
		//头_模型
		public static const TOU_SKIN:int = 16;
		//颈部挂饰
		public static const JINBU_GUASHI:int = 17;
		//左手饰品(前)
		public static const ZUOSHOU_SHIPIN_QIAN:int = 18;
		//右手饰品(前)
		public static const YOUSHOU_SHIPIN_QIAN:int = 19;
		//袖子(前)
		public static const XIUZI_QIAN:int = 20;
		//手臂_模型(前)
		public static const SHOUBI_SKIN_QIAN:int = 21;
		//左手手持物(前)
		public static const ZUOSHOU_CHIWU_QIAN:int = 22;
		//右手手持物(前)
		public static const YOUSHOU_CHIWU_QIAN:int = 23;
		//颈部挂饰2
		public static const JINBU_GUASHI2:int = 24;
		//肩部挂饰
		public static const JIANBU_GUASHI:int = 25;
		//腰部挂饰
		public static const YAOBU_GUASHI:int = 26;
		//上衣
		public static const SHANGYI_QUGAN:int = 27;
		//裙子
		public static const QUNZI:int = 28;
		//靴子
		public static const XUEZI:int = 29;
		//裤子
		public static const KUZI:int = 30;
		//鞋子
		public static const XIEZI:int = 31;
		//袜子
		public static const WAZI:int = 32;
		//躯干_模型
		public static const QUGAN_SKIN:int = 33;
		//左手饰品(后)
		public static const ZUOSHOU_SHIPIN_HOU:int = 34;
		//右手饰品(后)
		public static const YOUSHOU_SHIPIN_HOU:int = 35;
		//袖子(后)
		public static const XIUZI_HOU:int = 36;
		//手臂_模型(后)
		public static const SHOUBI_SKIN_HOU:int = 37;
		//左手手持物(后)
		public static const ZUOSHOU_CHIWU_HOU:int = 38;
		//右手手持物(后)
		public static const YOUSHOU_CHIWU_HOU:int = 39;
		//披风(后)
		public static const PIFENG_HOU:int = 40;
		//头发(后)
		public static const TOUFA_HOU:int = 41;
		//头饰1(后)
		public static const TOUSHI_1HOU:int = 42;
		//头饰2(后)
		public static const TOUSHI_2HOU:int = 43;
		//翅膀(后)
		public static const CHIBANG_HOU:int = 44; 
		//光之翼后
		public static const GUANGZHIYI_HOU:int = 45;
		//背部饰品(后)
		public static const BEIBU_SHIPIN_HOU:int = 46;
		//尾巴(后)
		public static const WEIBA_HOU:int = 47;
		//脚底阴影
		public static const YINGYIN:int = 48;
		//背景
		public static const BACKGROUND:int = 49;
		//~ public methods ----------------------------------------------------

		public function SkinPosInfo() {
		}
		
		//形象卡中需要显示的部位
		public static const XIAN_SHI__XING_XIANG_KA:Array = [
			GUANGZHIYI_HOU,
			GUANGZHIYI_QIAN,
			BEIBU_SHIPIN_QIAN,
			TOUSHI_1QIAN,
			TOUSHI_2QIAN,
			ERDUO_QIAOLING,
			TOUFA_QIAN,
			PIFENG_QIAN,
			ERDUO_QINGLING,
			MIANBU_SHIPIN,
			YAN_ZUI_SKIN,
			TOU_SKIN,
			YOUSHOU_SHIPIN_QIAN,
			XIUZI_QIAN,
			SHOUBI_SKIN_QIAN,
			YOUSHOU_CHIWU_QIAN,
			JINBU_GUASHI,
			JINBU_GUASHI2,
			JIANBU_GUASHI,
			YAOBU_GUASHI,
			SHANGYI_QUGAN,
			QUNZI,
			XUEZI,
			KUZI,
			XIEZI,
			QUGAN_SKIN,
			ZUOSHOU_SHIPIN_HOU,
			XIUZI_HOU,
			SHOUBI_SKIN_HOU,
			ZUOSHOU_CHIWU_HOU,
			PIFENG_HOU,
			TOUFA_HOU,
			TOUSHI_1HOU,
			TOUSHI_2HOU,
			CHIBANG_HOU,
			GUANGZHIYI_HOU,
			BEIBU_SHIPIN_HOU,
			WEIBA_HOU,
			WAZI
		];
		
		//形象卡中不能脱掉的部位
		public static const UNCHANGABLE_IN_AVATARCARD:Array = [
			ERDUO_QIAOLING,
			ERDUO_QINGLING,
			YAN_ZUI_SKIN,
			TOU_SKIN,
			SHOUBI_SKIN_QIAN,
			QUGAN_SKIN,
			SHOUBI_SKIN_HOU,
			CHIBANG_HOU,
			WEIBA_QIAN,
			WEIBA_HOU
			];
		
		// 半身象 需要显示的部位
		public static const HALF_AVATAR_POSES:Array = [
			BEIBU_SHIPIN_QIAN,
			TOUSHI_1QIAN,
			TOUSHI_2QIAN,
			ERDUO_QIAOLING,
			TOUFA_QIAN,
			PIFENG_QIAN,
			ERDUO_QINGLING,
			MIANBU_SHIPIN,
			YAN_ZUI_SKIN,
			TOU_SKIN,
			XIUZI_QIAN,
			XIUZI_HOU,
			JINBU_GUASHI,
			JINBU_GUASHI2,
			JIANBU_GUASHI,
			SHANGYI_QUGAN,
			QUGAN_SKIN,
			SHOUBI_SKIN_HOU,
			PIFENG_HOU,
			TOUFA_HOU,
			TOUSHI_1HOU,
			TOUSHI_2HOU,
			CHIBANG_HOU,
			GUANGZHIYI_HOU,
			BEIBU_SHIPIN_HOU,
			WEIBA_HOU,
			WAZI
		];
//		public static const XIAN_SHI__CHANG_JING:Array = [
//			WEIBA_QIAN,
//			BEIBU_SHIPIN_QIAN,
//			CHIBANG_QIAN,
//			TOUSHI_1QIAN,
//			TOUSHI_2QIAN,
//			ERDUO,
//			TOUFA_QIAN,
//			MIANBU_SHIPIN,
//			YAN_ZUI_SKIN,
//			TOU_SKIN,
//			ZUOSHOU_SHIPIN_QIAN,
//			YOUSHOU_SHIPIN_QIAN,
//			XIUZI_QIAN,
//			SHOUBI_SKIN_QIAN,
//			ZUOSHOU_CHIWU_QIAN,
//			YOUSHOU_CHIWU_QIAN,
//			JINBU_GUASHI,
//			JIANBU_GUASHI,
//			YAOBU_GUASHI,
//			SHANGYI_QUGAN,
//			KUZI,
//			XIEZI,
//			QUGAN_SKIN,
//			ZUOSHOU_SHIPIN_HOU,
//			YOUSHOU_SHIPIN_HOU,
//			XIUZI_HOU,
//			SHOUBI_SKIN_HOU,
//			ZUOSHOU_CHIWU_HOU,
//			YOUSHOU_CHIWU_HOU,
//			TOUFA_HOU,
//			TOUSHI_1HOU,
//			TOUSHI_2HOU,
//			CHIBANG_HOU,
//			BEIBU_SHIPIN_HOU,
//			WEIBA_HOU,
//			YINGYIN
//		];
		//服饰分类
		public static const CATEGORY_ALL:Array = [
			GUANGZHIYI_HOU,
			GUANGZHIYI_QIAN,
			BEIBU_SHIPIN_QIAN,
			TOUSHI_1QIAN,
			TOUSHI_2QIAN,
			TOUFA_QIAN,
			PIFENG_QIAN,
			MIANBU_SHIPIN,
			ZUOSHOU_SHIPIN_QIAN,
			YOUSHOU_SHIPIN_QIAN,
			XIUZI_QIAN,
			ZUOSHOU_CHIWU_QIAN,
			YOUSHOU_CHIWU_QIAN,
			JINBU_GUASHI,
			JINBU_GUASHI2,
			JIANBU_GUASHI,
			YAOBU_GUASHI,
			SHANGYI_QUGAN,
			QUNZI,
			XUEZI,
			KUZI,
			XIEZI,
			ZUOSHOU_SHIPIN_HOU,
			YOUSHOU_SHIPIN_HOU,
			XIUZI_HOU,
			ZUOSHOU_CHIWU_HOU,
			YOUSHOU_CHIWU_HOU,
			PIFENG_HOU,
			TOUFA_HOU,
			TOUSHI_1HOU,
			TOUSHI_2HOU,
			BEIBU_SHIPIN_HOU,
			WAZI,
			BACKGROUND,
			FRONT_BACKGROUND
			];

		//服饰分类_头发
		public static const CATEGORY_HAIR:Array = [
			TOUFA_QIAN,
			TOUFA2_QIAN,
			TOUFA_HOU
		];
		
		//服饰分类_上装
		public static const CATEGORY_BODY:Array = [
			XIUZI_QIAN,
			SHANGYI_QUGAN,
			XIUZI_HOU
		];
		
		//服饰分类_下装
		public static const CATEGORY_PANTS:Array = [
			QUNZI,
			KUZI,
			WAZI
		];
		
		//服饰分类_鞋子
		public static const CATEGORY_BOOTS:Array = [
			XUEZI,
			XIEZI
		];
		
		//服装分类_头部饰品
		public static const CATEGORY_HEAD_ACCE:Array = [
			TOUSHI_1QIAN,
			TOUSHI_2QIAN,
			TOUSHI_1HOU,
			TOUSHI_2HOU
		];
		
		//服装分类_面部饰品
		public static const CATEGORY_FACE_ACCE:Array = [
			MIANBU_SHIPIN
		];
		
		//服装分类_手部饰品
		public static const CATEGORY_HAND_ACCE:Array = [
			ZUOSHOU_SHIPIN_QIAN,
			YOUSHOU_SHIPIN_QIAN,
			ZUOSHOU_CHIWU_QIAN,
			YOUSHOU_CHIWU_QIAN,
			ZUOSHOU_SHIPIN_HOU,
			YOUSHOU_SHIPIN_HOU,
			ZUOSHOU_CHIWU_HOU,
			YOUSHOU_CHIWU_HOU
		];
		
		//服饰分类_肩部饰品
		public static const CATEGORY_SHOULDER_ACCE:Array = [
			JINBU_GUASHI,
			JINBU_GUASHI2,
			JIANBU_GUASHI
		];
		
		//服饰分类_腰部饰品
		public static const CATEGORY_HAUNCH_ACCE:Array = [
			BEIBU_SHIPIN_QIAN,
			PIFENG_QIAN,
			YAOBU_GUASHI,
			BEIBU_SHIPIN_HOU,
			PIFENG_HOU
		];
		
		//所有饰品分类...
		public static const CATEGORY_ALL_ACCE:Array = CATEGORY_HEAD_ACCE.concat(CATEGORY_FACE_ACCE)
			.concat(CATEGORY_HAND_ACCE).concat(CATEGORY_SHOULDER_ACCE)
			.concat(CATEGORY_HAUNCH_ACCE);
		
		//服饰分类_翅膀
		public static const CATEGORY_CHIBANG:Array = [
			GUANGZHIYI_QIAN,
			GUANGZHIYI_HOU
		];
		
		//服饰分类_背景卡
		public static const CATEGORY_BACKGROUND:Array = [
			BACKGROUND,
			FRONT_BACKGROUND
		];
		
		
		//魔妆店分类_耳朵、尾巴
		public static const MAKE_UP_ACCE:Array = [
			ERDUO_QIAOLING,
			ERDUO_QINGLING,
			WEIBA_QIAN,
			WEIBA_HOU
		];
		
		/**
		 * 只显示在UserCard的部分 
		 */		
		public static const ONLY_SHOW_IN_USERCARD:Array = [
			BACKGROUND,
			FRONT_BACKGROUND
		];
		
		public static function isAlbumAvatarContain(pos:int):Boolean
		{
			return XIAN_SHI__XING_XIANG_KA.indexOf(pos) >= 0;
		}	
		
		public static function cantChangeInAvatarCard(pos:int):Boolean
		{
			return UNCHANGABLE_IN_AVATARCARD.indexOf(pos) >= 0;
		}
		
		public static function isHalfAvatarContain(pos:int):Boolean
		{
			return HALF_AVATAR_POSES.indexOf(pos) >= 0;
		}
		
		public static function isOnlyShowInUserCard(pos:int):Boolean
		{
			return ONLY_SHOW_IN_USERCARD.indexOf(pos) >= 0;
		}
		
		public static function isMakeUpContain(pos:int):Boolean
		{
			return MAKE_UP_ACCE.indexOf(pos) >= 0;
		}	
		
	}
}

