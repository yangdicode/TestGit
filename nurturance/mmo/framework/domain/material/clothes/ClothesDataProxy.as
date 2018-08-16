package mmo.framework.domain.material.clothes
{
import flash.system.ApplicationDomain;

public class ClothesDataProxy
{
	

	public function ClothesDataProxy()
	{
	}
	
	public static function getClothesById(clothesId):Clothes
	{
		var facadeClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.play.material.clothes.ClothesFacade") as Class;
		return facadeClass["instance"].getClothesDataById(clothesId);
	}
	
}
}