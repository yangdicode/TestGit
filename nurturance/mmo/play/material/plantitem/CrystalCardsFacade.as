package mmo.play.material.plantitem
{
	import mmo.framework.domain.plant.CrystalCard;
	import mmo.framework.domain.plant.Plants;

	public class CrystalCardsFacade
	{
		public function CrystalCardsFacade()
		{
		}
		
		public static function checkSeedUnlock(seedId:int):Boolean
		{
			if (!checkSeedIsNeedUnlock(seedId))
			{
				return true;
			}
			
			var arr:Array = getCrystalCardIdsBySeedId(seedId);
			for each(var id:int in arr)
			{
				if (PlantItemFacade.instance.hasMaterial(id))
				{
					return true;
				}
			}
			return false;
		}
		
		public static function checkSeedIsNeedUnlock(seedId:int):Boolean
		{
			for each(var info:CrystalCard in Plants.crystalCards)
			{
				if (info.openSeedIds.indexOf(seedId) != -1)
				{
					return true;
				}
			}
			return false;
		}
		
		public static function getCrystalCardIdsBySeedId(seedId:int):Array
		{
			var arr:Array = [];
			for each(var info:CrystalCard in Plants.crystalCards)
			{
				if (info.openSeedIds.indexOf(seedId) != -1)
				{
					arr.push(info.id);
				}
			}
			return arr;
		}
		
		public static function getCrystalCardGroup(cardId:int):Array
		{
			if (Plants.crystalCards.hasOwnProperty(cardId))
			{
				var nextCardId:int = Plants.getCrystalCardById(cardId).nextCardId;
				var arr:Array = getCrystalCardGroup(nextCardId);
				arr.unshift(cardId);
				return arr;
			}
			
			return [];
		}
	}
}