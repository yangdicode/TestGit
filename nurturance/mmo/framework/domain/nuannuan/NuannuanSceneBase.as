package mmo.framework.domain.nuannuan
{
	import com.adobe.utils.StringUtil;
	
	import flash.display.Sprite;
	
	public class NuannuanSceneBase extends Sprite
	{
		private var _paths:Object = {};
		private var _initIcon:String;
		private var _iconFromMap:Object;
		
		public function NuannuanSceneBase(){
			_iconFromMap = {};
			initMap();
		}
		
		public function getPath(pName:String):Array{
			if(!_paths.hasOwnProperty(pName)){
				throw new Error("地图配置出错，找不到" + pName);
			}
			return _paths[pName];
		}
		
		/**
		 * 寻找从p1到p2
		 */		
		public function findPath(p1Name:String, p2Name:String):Vector.<NuannuanScenePath>{
			resetHasSearch();
			var arr:Vector.<NuannuanScenePath> = new Vector.<NuannuanScenePath>();
			var find:Boolean = findAndPush(p1Name, p2Name, arr);
			if(find){
				return arr;
			}else{
				throw new Error("没有找到从[" + p1Name + "]到[" + p2Name + "的路径。");
			}
		}
		
		public function setInitIcon(iconName:String):void{
			_initIcon = iconName;
		}
		
		public function addIconFromMap(mapId:int, iconName:String):void{
			_iconFromMap[mapId] = iconName;
		}
		
		public function getInitIcon(fromMap:int = -1):String{
			if(fromMap <= 0){
				return _initIcon;
			}else{
				return _iconFromMap[fromMap];
			}
		}
		
		private function findAndPush(p1Name:String, p2Name:String, arr:Vector.<NuannuanScenePath>):Boolean{
			var paths:Array = getPath(p1Name);
			for each(var path:NuannuanScenePath in paths){
				if(!path.hasSearch){
					if(path.findOtherPointName(p1Name) == p2Name){
						arr.push(path);
						return true;
					}else{
						var newArr:Vector.<NuannuanScenePath> = new Vector.<NuannuanScenePath>();
						newArr.push(path);
						var find:Boolean = findAndPush(path.findOtherPointName(p1Name), p2Name, newArr);
						if(find){
							for each(var newP:* in newArr){
								arr.push(newP);
							}
							return true;
						}
					}
				}
			}
			return false;
		}
		
		final protected function addPath(p1Name:String, p2Name:String, ctrlName:String = ""):void{
			var ctrl:Sprite = StringUtil.isEmpty(ctrlName) ? null : this[ctrlName];
			var path:NuannuanScenePath = new NuannuanScenePath(this[p1Name], this[p2Name], ctrl);
			add(p1Name, path);
			add(p2Name, path);
		}
		
		protected function initMap():void{
		}
		
		private function add(pName:String, path:NuannuanScenePath):void{
			if(!_paths.hasOwnProperty(pName)){
				_paths[pName] = new Array();
			}
			var arr:Array = _paths[pName];
			arr.push(path);
		}
		
		private function resetHasSearch():void{
			for each(var arr:Array in _paths){
				for each(var path:NuannuanScenePath in arr){
					path.hasSearch = false;
				}
			}
		}
		
	}
}