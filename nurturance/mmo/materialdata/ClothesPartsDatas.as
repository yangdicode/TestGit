package mmo.materialdata {
import com.adobe.utils.StringUtil;

import mmo.play.avatar.SkinPosInfo;
import mmo.play.avatar.skininfo.SkinInfoFactory;


public class ClothesPartsDatas {


    /**
     * 衣服配置数据格式如下
     * id;[part1];[part2]...
     * part:clothesNo,clothesPos,fileName,skinViewFile,filePath,skinInfo,hasMovie,sideType
     */
    //a003089为空文件    a005104为形象卡空文件
    [Embed(source="material/clothespartsdata.xml", mimeType="application/octet-stream")]
    private static var dataClass:Class;
    private static var _infoData:Object;
    
    public static function get data():Object{
        initData();
        return _infoData;
    }
    
    private static function initData():void{
        if(_infoData != null){
            return;
        }
        _infoData = {};
        var dataStr:String = String(new dataClass());
        var allConfig:Array = dataStr.split("\n");
        var eachConfig:String;
        var clothesList:Array;
        var partStr:String;
        var partList:Array;
        
        var cloId:int;
        
        var partResult:Array;
        for each(eachConfig in allConfig){
            partResult = [];
            clothesList = eachConfig.replace("\r", "").split(";");
            cloId = int(clothesList.shift());
            for each(partStr in clothesList){
                partList = partStr.split(",");
//                cloNo = partList[0];
//                cloPos = int(partList[1]);
//                fileName = partList[2];
//                skinViewFile = partList[3];
//                filePath = partList[4];
//                skinInfoType = int(partList[5]);
//                hasMovie = int(partList[6]);
//                sideType = int(partList[7]);
                partResult.push(partList);
            }
            _infoData[cloId] = partResult;
        }
    }
    
}
}