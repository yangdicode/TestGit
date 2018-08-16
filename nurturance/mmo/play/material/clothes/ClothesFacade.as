package mmo.play.material.clothes {
import flash.display.DisplayObject;
import flash.display.InteractiveObject;
import flash.display.Sprite;
import flash.events.EventDispatcher;
import flash.utils.getDefinitionByName;

import mmo.common.DateUtil;
import mmo.common.DisplayUtil;
import mmo.framework.domain.avatar.AvatarInfo;
import mmo.framework.domain.material.Material;
import mmo.framework.domain.material.MaterialTypes;
import mmo.framework.domain.material.clothes.Clothes;
import mmo.framework.model.changeable.ChangeableDispatcher;
import mmo.framework.model.changeable.ChangeableEvent;
import mmo.framework.model.changeable.IChangeableObject;
import mmo.loader.scheduler.ResScheduler;
import mmo.play.helper.SceneDomainResLoader;

public class ClothesFacade extends EventDispatcher{
    private static var _instance:ClothesFacade;

    private var viewCreator:ClothesViewCreator;

    public static function get instance():ClothesFacade {
        if (_instance == null) {
            _instance = new ClothesFacade();
        }
        return _instance;
    }

    public function ClothesFacade() {
    }

    /** 原始数据 */
    private var _clothesObj:Object;
    /** 原始数据 */
    private var _partsObj:Object;

    /** 服装数据（根据ClothesNo索引） */
    private var _clothesDataByNo:Object = {};

    /** 服装元件数据 （根据ClothesNo索引）*/
    private var _clothesPartsData:Object = {};

    /**根据id获得Clothes**/
    private var clothesMap:Object = {};

    /**
     * 物品类别
     * @return
     */
    public function get materialType():int {
        return MaterialTypes.CLOTHES;
    }

    public function getClothesArr():Array {
        var arr:Array = [];
        for(var cloId:String in _clothesObj) {
            arr.push(getClothesDataById(int(cloId)));
        }
        return arr;
    }

    /**
     * 接口调用，获取衣服信息
     * */
    public function getMaterialById(mid:int):Material {
        return this.getClothesDataById(mid);
    }

    /**
     * 根据ClothesID获取衣服配置信息
     *
     * @param id    ClothesId
     *
     * @return        Clothes类型
     */
    public function getClothesDataById(clothesId:int):Clothes {
        if (clothesMap.hasOwnProperty(clothesId)) {
            return clothesMap[clothesId];
        }
        initClothesConfig();
        if (_clothesObj.hasOwnProperty(clothesId)) {
            initEachClothes(clothesId);
            return clothesMap[clothesId];
        }
        throw new Error("没这件衣服啊：" + clothesId);
    }

    private function initEachClothes(clothesId:int):void {
        var config:Array = _clothesObj[clothesId];
        var clothes:Clothes = Clothes.buildByConfig(config);
        clothes.parts = getPartsByClothes(clothesId);
        clothesMap[clothesId] = clothes;
    }

    /**
     * 根据ClothesNo获取衣服配置信息
     *
     * @param clothesNo    ClothesNo
     *
     * @return        Clothes
     */
    public function getClothesDataByNo(clothesNo:String):Clothes {
        return getClothesDataById(_clothesDataByNo[clothesNo]);
    }

    /**
     * 根据ClothesNo获取衣服元件的配置信息
     */
    public function getClothesPartsDataByNo(clothesNo:String):ClothesPart {
        return this._clothesPartsData[clothesNo];
    }

    public function getPartsByClothes(clothesId:int):Array {
        initPartConfig();
        if (!_partsObj.hasOwnProperty(clothesId)) {
            throw new Error("clothesID为:" + clothesId + " 在文件ClothesPartDatas中未定义");
        }
        var partConfig:Array = _partsObj[clothesId];
        var parts:Array = [];
        var part:ClothesPart;
        for each(var config:Array in partConfig) {
            part = ClothesPart.buildByConfig(config);
            _clothesDataByNo[part.clothesNo] = clothesId;
            _clothesPartsData[part.clothesNo] = part;
            parts.push(part);
        }
        return parts;
    }
	
    private function initClothesConfig():void {
        if (_clothesObj == null) {
            var cloClassName:String = "mmo.materialdata.ClothesData";
            var clothesConfig:Class = getDefinitionByName(cloClassName) as Class;
            _clothesObj = clothesConfig["data"];
        }
    }

    private function initPartConfig():void {
        if (_partsObj == null) {
            var partClassName = "mmo.materialdata.ClothesPartsDatas";
            var partsConfig:Class = getDefinitionByName(partClassName) as Class;
            _partsObj = partsConfig["data"];
        }
    }

    /**
     * 获得衣服视图
     * */
    public function getView(cId:int):DisplayObject {
//			if(viewCreator == null)
//			{
//				viewCreator = new ClothesViewCreator(ResStorageType.TEMPORARY);
//			}	
//			return viewCreator.getView();
        return null;
    }

    /**
     * 获得衣服缩略视图
     **/
    public function getIcon(cId:int, width:Number = 0, height:Number = 0):DisplayObject {
        if (viewCreator == null) {
            viewCreator = new ClothesViewCreator(SceneDomainResLoader.resStoryageType);
        }
        return viewCreator.getIcon(cId, width, height);
    }

    /**
     * 获得衣服缩略视图,添加参数needRemoveBg主要为了隐藏衣服的灰底
     **/
    public function getIconWithoutBg(cId:int, width:Number = 0, height:Number = 0):DisplayObject {
        if (viewCreator == null) {
            viewCreator = new ClothesViewCreator(SceneDomainResLoader.resStoryageType);
        }
        return viewCreator.getIconWithoutBg(cId, width, height);
    }

    public function getClothesCardView(cIds:Array):Sprite {
        var container:Sprite = new Sprite();
        var clothes:Clothes;
        var clothesViews:Array = [];
        for each(var cId:int in cIds) {
            clothes = getClothesDataById(cId);
            for each (var clothesPart:ClothesPart in clothes.parts) {
                loadClothes(container, clothesPart, clothesViews);
            }
        }
        return container;
    }

    private function loadClothes(container:Sprite, clothesPart:ClothesPart, clothesViews:Array):void {
        var url:String = "skinview/" + clothesPart.skinViewFile;
        var className:String = clothesPart.skinViewFile + "_B";
        ResScheduler.getResource(url, onLoadSkinView, className);
        function onLoadSkinView(content:Sprite):void {
            clothesViews[clothesPart.clothesPos] = content;
            refreshClothesView(container, clothesViews);
        }
    }

    private function refreshClothesView(container:Sprite, clothesViews:Array):void {
        DisplayUtil.removeAllChild(container);
        for (var i:int = clothesViews.length - 1; i >= 0; i--) {
            if (clothesViews[i] != null) {
                container.addChild(clothesViews[i]);
            }
        }
    }

    public function setClothesStar(target:Sprite, cloId:int, mcName:String = "star"):void {
        var clo:Clothes = getClothesDataById(cloId);
        for (var i:int = 0; i < Clothes.MaxStar; i++) {
            target[mcName + i].visible = i < clo.star;
        }
    }
}
}