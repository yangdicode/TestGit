package mmo.materialdata {
import com.adobe.utils.StringUtil;
/**
 * 服装信息
 */
public class ClothesData {

    [Embed(source="material/clothesdata.xml", mimeType="application/octet-stream")]
    private static const dataClass:Class;
    private static var _infoData:Object;
    
    public static const UserCardHandler:Object = {
        "17278":1,
        "17279":1,
        "17280":1, 
        "17281":1
    }

    public static function get data():Object {
        initData();
        return _infoData;
    }

    private static function initData():void {
        if (_infoData != null) {
            return;
        }
        _infoData = {};
        var dataStr:String = String(new dataClass());
        var dataList:Array = dataStr.split("\n");
        var id:int;

        var eachLine:String;
        var eachList:Array;
        for each(eachLine in dataList) {
            if (StringUtil.isEmpty(eachLine)) {
                continue;
            }
            eachList = StringUtil.splitToInt(eachLine, ";");
//				[id, name, maxOwnNum, value, sellsPrice, isBind, isVip, 
//				 fashion, limitSex, canTrade, isOutOfPrint, nuanStarLv]
//				[衣服id,最大拥有量,价值,售价,是否绑定,是否vip,时尚值,限制性别,可交易,已绝版,暖暖等级]
//				字段不可减少，修改需要更改Clothes.buildByConfig(config:Array):Clothes
            id = eachList[0];
            _infoData[id] = eachList;
        }
    }

}
}
