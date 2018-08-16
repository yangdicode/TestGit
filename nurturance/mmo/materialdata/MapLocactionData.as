package mmo.materialdata
{
	
	public class MapLocactionData
	{		
		public static const mapTownToSceneData:Object =
			{				
			}
		
		/***
		 * 三级地图的映射
		 * */
		public static const mapLocactionData:Object = 
			{
				//魔法神殿(三生树、魔法森林、魔法露台)
				"MagicGround":"MagicPalace",
				"SanShengTree":"MagicPalace",
				"MagicForest":"MagicPalace",
				//	护城河（迷风丛林、迷风丛林深处）
				"MoatCopy":"Moat", //新手任务		
				"Jungle":"Moat",
				"Jungle2":"Moat",						
				//	迷风丛林深处（古坛遗迹）
				"Relic":"Moat",
				"Relic2":"Moat",

	

				//	安琪拉学院（奥雅之都）
				"College":"CenterSquare",

				
				//雨花林(雨花溪)
				"RainForestStream":"RainForest",
				//万花平原西(果果农场、泡泡池)
				"Farm":"Plain",
				"Pond":"Plain",
				
				//暗夜马戏团(马戏搭帐篷、暗夜云端)
				"InnerCircus":"OuterCircus",
				"WildCircus":"OuterCircus",
				
				//弗蕾亚之森(塞壬之湖、九天悬瀑、修罗试炼场)
				"WaterKingLake":"TreeKingForest",
				"SkysWaterfall":"TreeKingForest",
				"XiuluoTraining":"TreeKingForest",
				
				//暮色之城(古堡会客厅)
				"DemonCastle":"DemonCity",
				
				//德古拉城堡(德古拉城堡内厅、德古拉密室)
				"VampireCastle":"VampireCastleOutside",
				"VampireCastleBackroom":"VampireCastleOutside",
				
				//凌云龙殿(凌霄王座、通天龙道)
				"Throne":"DragonTemple",
				"DragonCastlePath":"DragonTemple",
				
				//幻海之岛(祭典之桥)
				"FeteBridge":"FancyIsland",
				
				//清灵涧(无月宫)
				"NoMoonPalace":"JadeRiver",
				
				//御神岛(御神之里、御神居)
				"JadeGodInner":"JadeGod",
				"JadeYard":"JadeGod",
				
				//灵玉岛(太极阵)
				"JadeFormation":"JadeIsland",
				
				//孤独者雪崖(魅影的家)
				"PhantomHouse":"SingleHell",
				
				//幻灵雪山(幻古雪域、幻月冰河、深海禁地)
				"SnowyLand":"SnowMountain",
				"IceRiver":"SnowMountain",
				"ForbiddenArea":"SnowMountain",
				
				//魔女冰原(遗落地宫、幽梦之宫)
				"RelicPalace":"WitchIceland",
				"DreamPalace":"WitchIceland",
				
				//北极圣诞城(极光城堡)
				"PolarLightsCastle":"NorthPoleCastle",
				
				//楼兰城(楼兰宫、楼兰圣地)
				"LoulanHouse":"LoulanLand",
				"LoulanBethel":"LoulanLand",
				
				//拉赛尔小镇(拉赛尔藤桥、拉赛尔城、大祭司实验室)
				"LasaCity":"LasaTown",
				"LasaCliff":"LasaTown",
				"LasaLab":"LasaTown",
				
				//玫瑰教堂(月影石领域、梦幻游乐园)
				"DollMoonShadow":"DollRoseChurch",
				"DollDreamPark":"DollRoseChurch",
					
				//蔷薇海岸(蔷薇城堡、蔷薇花林)
				"RoseCastle":"RosebushCoast",
				"RosebushJungle":"RosebushCoast",
				
				//月亮小径(月亮湖)（一线月光）		
				"MoonLake":"Alley",				
				"WaterFallCave":"Alley",
				
				//纳雅之森(悬云索桥)
				"CloudBridge":"NayaForest",
				
				//圣彼得皇家学院(圣彼得学生会、圣彼得学院长廊、学院天台)]
				"StudentUnion":"RoyalAcademy",
				"LongCorridor":"RoyalAcademy",
				"AcademyGround":"RoyalAcademy",
				
							
				//光幻森林(月亭花海、祷歌台)
				"ElfFlowerSea":"ElfLightForest",
				"ElfPrayerPlace":"ElfLightForest",
				
				
				//小人进入畅想乐园的定位须在萌宠之家
				"FancyPark":"PetHome",
			// 安琪拉学院（文艺课室、修养课室、艺术课室、图书馆）
				"LiteratureClass":"CenterSquare",
				"HeartClass":"CenterSquare",
				"Odeum":"CenterSquare",
				"Library":"CenterSquare",
				"BackRoom":"CenterSquare",
				"BackRoomDeep":"CenterSquare",	
			//	英雄神殿（神殿大厅、卡片作坊、会长室）
				"TempleHall":"Temple",
				"CardFactory":"Temple",		
				"PresidentRoom":"Temple",
			//	梦幻商业街（罗莎服饰店、杰克家居店）
				"ClothesShop":"BusinessStreet",
				"FurnitureShop":"BusinessStreet",
				"MiyayaShop":"BusinessStreet",
				"Auction":"BusinessStreet",
				"Exchange":"NeverLand",
				//路丝道具店
				"PropShop":"BattleClass",
				
			//	布灵城（服饰研究院）
				"ClothesAcademe":"ClothTown",
				
			//凡思哲家居坊
				"ChanelFurniture":"ChanelClub",
			
			//	轻灵城（宠物研究所）
				"PetAcademe":"FairyTown",	
			//	康德的家（宠物研究所）
				"KangdeHome":"FairyTown",
			//	妈妈的房间（宠物研究所）
				"KangdeMamaRoom":"FairyTown",
			//	巧灵城（爱因斯坦基地）
				"Institute":"ArtisanTown",
				//	奥雅之树（光之源泉）
				"SpringLand":"HolyTree",
				//幻想天际 神羽圣殿,命运神迹，虚空幻境定位到神羽圣殿
				"VipFantasySky":"VipSceneRoom",
				"VanityDreamland":"VipSceneRoom",
				"FateArea":"VipSceneRoom",
				
				//	星光总汇（潮流会、精灵会）
				"CollegeProfession1":"StarStage",	
				"CollegeProfession2":"StarStage",
				"CollegeProfession3":"StarStage",
				
				//	愿望街（音乐之声乐器店）
				"MusicalInstrument":"DreamStreet",	
				
				//体育场，梦幻花园定位到花之梦庭
				"Gym":"RoseGarden",	
				
				//花与梦之店定位到愿望街
				"FlowerAndDreamShop":"DreamStreet",	
				
				//进入绚梦星城，绚梦电影天地，小人定位到主题乐园
				"MovieScene":"DreamTeam",	

				
				//设计师协会应该定位到空中花园
				"DesignerClub":"FancyPark",	
				
				//职业殿堂几个场景映射				
				"ProfessionTemple2":"ProfessionTemple",
				"ProfessionTemple3":"ProfessionTemple",
				"ProfessionTemple4":"ProfessionTemple",
				
				//新场景
			//	幻古雪域（幻狐迷阵）
				"FoxSnowyLand":"SnowyLand",
				
				"FairyWishRoom":"DreamStreet",

			//	竞技场（迷镜隧道）
				"FBTower":"Arena",	
				
			//	幻影帝国（恶魔实验室）
				"DaimonLab":"DarkEmpery",		
						
			//	空中花园（云上舞池）
				"DanceFloor":"SkyGarden",	
				"DanceFloor2":"SkyGarden",	
			//	"MagicCube":"OuterCircus",
				"MirrorMaze":"OuterCircus",
				"MirrorHouse":"OuterCircus"
		};
	}
}