package mmo.materialdata {
import com.adobe.utils.StringUtil;

public class ClothesDescData {

	[Embed(source="material/clothesdescdata.xml", mimeType="application/octet-stream")]
    private static const dataClass:Class;
    private static var _data:Object;
    
    /**
     * [Name, Description, Brand, NuanPart, NuanTopic, Type]
     * */
    public static function get data():Object{
        initData();
        return _data;
    }
    
    private static function initData():void{
        if(_data != null){
            return;
        }
        _data = {};
        var dataStr:String = String(new dataClass());
        var oriList:Array = dataStr.split("\n");
        var eachStr:String;
        var eachList:Array;
        
        var id:int;
        for each(eachStr in oriList){
            if(StringUtil.isEmpty(eachStr)){
                continue;
            }
            eachList = eachStr.split(";");
            id = int(eachList.shift());
            _data[id] = eachList;
        }
    }
    
}
}
