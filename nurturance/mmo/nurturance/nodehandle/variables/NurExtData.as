package mmo.nurturance.nodehandle.variables {
public class NurExtData implements INurVariables {
    private var _gameId:int;
    private var _subPath:String;
    private var _subName:String;
    private var _stopBGM:Boolean;

    public function NurExtData(config:XML) {
        _gameId = config.@gameId;
        _subPath = config.@subPath;
        _subName = config.@subName;
        _stopBGM = int(config.@stopBGM) == 0;
    }

    public function dispose():void {
    }

    public function init():void {
    }

    public function get gameId():int {
        return _gameId;
    }

    public function get subPath():String {
        return _subPath;
    }

    public function get subName():String {
        return _subName;
    }

    public function get stopBGM():Boolean {
        return _stopBGM;
    }
}
}