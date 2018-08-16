package mmo.materialdata
{

	public class ExtMap
	{
		private static var em:Object=null;

		public function ExtMap()
		{
		}

		public static function getExtMap():Object
		{
			if (em == null)
			{
				init();
			}

			return em;
		}

		private static function init():void
		{
			em=new Object();
			
			em["StartupExtension"] = 0;
			em["UserExtension"] = 1;
			em["ClothFurnitureExtension"] = 18;
			em["BuddyExtension"] = 20;
			em["GatherExtension"] = 22;
			em["TaskExtension"] = 23;
			em["TailorSkillExtension"] = 25;
			em["CourseExtension"] = 26;
			em["ShopExtension"] = 27;
			em["ProfessionExtension"] = 28;
			em["AttrExtension"] = 24;
			em["BuildSkillExtension"] = 29;
			em["FeedSkillExtension"] = 30;
			em["CardExtension"] = 31;
			em["PetExtension"] = 32;
			em["CurrencyExtension"] = 33;
			em["BattleItemExtension"] = 34;
			em["SurveyExtension"] = 35;
			em["UserInfoExtension"] = 36;
			em["LogExtension"] = 37;
			em["SysGiftExtension"] = 38;
//			em["StatExtension"] = 21;
			em["GameExtension"] = 40;
			em["InviteExtension"] = 41;
			em["OneoffExtension"] = 42;
			em["ContextExtension"] = 43;
			em["TempExtension"] = 44;
			em["FBExtension"] = 45;
			em["MailExtension"] = 64;
			em["AuctionExtension"] = 47;
			em["CardSkillExtension"] = 46;
			em["BIExtension"] = 49;
			em["HouseExtension"] = 51;
			em["DanceExtension"] = 50;
			em["WeeklyExtension"] = 52;
//			em["MoonCakeTmpExtension"] = 53;
			em["TowerExtension"] = 54;
			em["HonorExtension"] = 56;
			em["PetDevelopExtension"] = 55;
//			em["CarnivalTmpExtension"] = 57;
			em["SurvivorExtension"] = 58;
			em["PkExtension"] = 59;
			em["FillWordExtension"] = 60;
			em["ArenaExtension"] = 61;
			em["PetTaskExtension"] = 62;
			em["ConnectTestExtension"] = 65;
			em["TeamExtension"] = 63;
			em["DebugExtension"] = 10000;
			em["BattleExtension"] = 66;
//			em["ChristmasExtension"] = 67;
			em["PokerExtension"] = 68;
			em["CacheExtension"] = 10001;
			em["TeamActivityExtension"] = 69;
			em["MemberExtension"] = 70;
			em["WinterVacationExtension"] = 71;
			em["BattlePetExtension"] = 72;
			em["LanternRiddleExtension"] = 73;
			em["FlowerExtension"] = 74;
			em["MsgExtension"] = 75;
			em["GardenPlantingExtension"] = 79;
			em["DaemonFairyExtension"] = 84;
			em["SuperMarketExtension"] = 89;
		}
	}
}