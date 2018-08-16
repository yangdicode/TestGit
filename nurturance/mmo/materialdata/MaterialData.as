package mmo.materialdata
{
import flash.display.Sprite;

import mmo.materialdata.fairy.CompileFairys;
import mmo.materialdata.fairy.FairyMonsterData;
import mmo.materialdata.petcomposing.EggComposingDatas;
import mmo.materialdata.petcomposing.FeedLevelDatas;
import mmo.materialdata.petcomposing.StuffComposingDatas;

public class MaterialData extends Sprite
	{
		public function MaterialData()
		{
			EggComposingDatas.compileMe();
			StuffComposingDatas.compileMe();
			FeedLevelDatas.compileMe();
		}

		private function compileMe():void
		{
			var skinviewEffectData:SkinviewEffectConfig;
			var furnitureData:FurnitureData;
			var gItemData:GItemData;
			var houseMaterialDisplayData:HouseMaterialDisplayData;
			var goodsData:GoodsData;
			var petsData:PetsData;
			var cardsData:CardsData;
			var cardsEffectData:CardsEffectData;
			var cardEquipLimitData:CardEquipLimitData;
			var professionLvData:ProfessionLvData;
			var fac:FeatherAgeConfig;
			var mtd:MapTipsData;
			var wingsData:WingsData;
			var battleItemsData:BattleItemsData;
			var monstersData:MonstersData;
			var shootItemsData:ShootItemsData;
			var maplocationdata:MapLocactionData;
			var cardMapData:CardMapData;
			var cardMapBuffData:CardMapBuffData;
			var mtc:MaterialTypeConfig;
			var transData:TransformData;
			var badgeData:BadgeData;
			var breedingPetsData:BreedingPetsData;
			var petItemsData:PetItemsData;
			var battleBuffDefineData:BattleBuffDefineData;
			var stuffMapData:StuffMapData;
			var crystalTripData:CrystalTripData;
			var viewmediator:ViewMediatorData;
			var broadCastConfig:BroadCastConfig;
			var cardGroupData:CardGroupData;
			var beiluoData:BeiluoData;
		//	var fillwordData:FillWordData;
			var propChangeItemData:PropChangeItemData;
			var mlds:MemberLevelDatas;
			var treasureBoxData:TreasureBoxData;
			var battlePetPhaseDefines:BattlePetPhaseDefines;
			var battlePetLvDefines:BattlePetLvDefines;
			var battlePetSkillData:BattlePetSkillDefineData;
			var playerLightsData:PlayerLightsData;
			var flowerConfig:FlowerData;
			var professionStoneData:ProfessionStoneData;
			var equipCardsData:EquipCardsData;
			var recycleData:ItemRecycleData;
			var plantItemsData:PlantItemsData;
			var plantsdata:PlantsData;
			var cardTypeIdMapData:CardTypeIdMapData;
			var effortData:EffortData;
			var divinationData:DivinationData;
			var fairyMonsterData:FairyMonsterData;
			var fairysDefine:CompileFairys;
			var voucher:RmbMarketVoucher;
			var cardsDataOld:CardsDataOld;
			var weaponsData:WeaponsData;
			
			var professionExtSkillData:ProfessionExtSkillData;
			var outDateGoods:OutDateGoods;
			
			var supermarketItemsData:SupermarketItemsData;
			
			var bugleDate:BugleData;
			ChanelsData;
			MiracleClothesData;
			var twinGiftData:TwinGiftData;
			var buddyGiftConfig:BuddyGiftConfig;
			
			var crystalCardsData:CrystalCardsData;
			HalosData;
			var dreamCardsData:DreamCardsData;
			EquipSuitEffectData;
			
			var palace:PalaceData;
			
			var activityVoucherData:ActivityVoucherData;
			MusicalBoxData;
			var vipMoodsData:VipMoodsData;
			
			NpcGoods;
			var cityData:CityData;
		}
	}
}