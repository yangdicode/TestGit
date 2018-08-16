package mmo.framework.domain.material {
import flash.utils.getDefinitionByName;

public class DescDatas {
    private static var _clothesDesc:Object;

    /**
     * [Name, Description, Brand, NuanPart, NuanTopic, Type]
     * */
    public static function getClothesDesc(clothesId:int):Object{
        if(_clothesDesc == null){
            var clsName:String = "mmo.materialdata.ClothesDescData";
            var clas:Class = getDefinitionByName(clsName) as Class;
            _clothesDesc = clas["data"];
        }
        return _clothesDesc[clothesId];
    }
    
    public static function getClothesName(clothesId:int):String{
        return getClothesDesc(clothesId)[0];
    }
    
    public static function getClothesDescription(clothesId:int):String{
        return getClothesDesc(clothesId)[1];
    }
    
    public static function getClothesBrand(clothesId:int):String{
        return getClothesDesc(clothesId)[2];
    }
    
    public static function getNuanPart(clothesId:int):String{
        return getClothesDesc(clothesId)[3];
    }
    
    public static function getNuanTopic(clothesId:int):String{
        return getClothesDesc(clothesId)[4];
    }
    
    public static function getClothesType(clothesId:int):String{
        return getClothesDesc(clothesId)[5];
    }
    
}
}
