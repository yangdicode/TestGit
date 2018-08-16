package mmo.framework.domain.halos
{
	import flash.system.ApplicationDomain;
	
	public class Halos
	{
		private static const HalosConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.HalosData") as Class;
		
		private static var _halosIds:Array;
		private static var _mainFrameIds:Array;
		private static var _sideFrameIds:Array;
		
		public function Halos()
		{
		}
		
		public static function getHaloDefine(haloBaseId:int):Halo{
			var data:Object = HalosConfig["haloConfig"];			
			return data[haloBaseId];			
		}
		
		public static function getColorDefine(colorId:int):HaloColor{
			var data:Object = HalosConfig["colorConfig"];			
			return data[colorId];	
		}
		
		public static function getHaloFrameDefine(frameId:int):HaloFrame{
			var data:Object = HalosConfig["frameConfig"];			
			return data[frameId];
		}
		
		public static function getNeedShowNewFlagHaloIds():Array{
			return HalosConfig["newHaloIdConfig"];	
		}
		
		public static function getAllHalosIds():Array{
			if( _halosIds == null )
				initHalosIds();
			return _halosIds;
		}
		
		public static function getAllMainFrameIds():Array{
			if( !_mainFrameIds )
				initFrameIds();
			return _mainFrameIds;
		}
		
		public static function getMainFrameIds(halosBaseId:int):Array{
			var data:Array = [];
			var frameId:int;
			var haloFrame:HaloFrame;
			var limitIds:Array;
			var expIds:Array;
			var allData:Array = getAllMainFrameIds();
			for( var i:int=0;i<allData.length;i++ ){
				frameId = allData[i];
				haloFrame = getHaloFrameDefine(frameId);
				limitIds = haloFrame.limit;
				expIds = haloFrame.except;
								
				if( limitIds.length==0 && expIds.length==0 ){
					data.push(frameId);
				}else{
					if( limitIds.length>0  ){
						if( isInArray(halosBaseId,limitIds) )
							data.push(frameId);
					}else{
						if( !isInArray(halosBaseId,expIds) )
							data.push(frameId);
					}
				}				
			}
			return data;				
		}
		
		public static function getAllSideFrameIds():Array{
			if( !_sideFrameIds )
				initFrameIds();
			return _sideFrameIds;
		}
		
		public static function getSideFrameIds(halosBaseId:int):Array{
			var data:Array = [];
			var frameId:int;
			var haloFrame:HaloFrame;
			var limitIds:Array;
			var expIds:Array;
			var allData:Array = getAllSideFrameIds();
			for( var i:int=0;i<allData.length;i++ ){
				frameId = allData[i];
				haloFrame = getHaloFrameDefine(frameId);
				limitIds = haloFrame.limit;
				expIds = haloFrame.except;
				if( limitIds.length==0 && expIds.length==0 ){
					data.push(frameId);
				}else{
					if( limitIds.length>0  ){
						if( isInArray(halosBaseId,limitIds) )
							data.push(frameId);
					}else{
						if( !isInArray(halosBaseId,expIds) )
							data.push(frameId);
					}
				}				
			}
			return data;				
		}
		
		private static function initHalosIds():void{
			_halosIds = [];
			var data:Object = HalosConfig["haloConfig"];
			for each(var halo:Halo in data ){
				if(halo.goodsId > 0){
					_halosIds.push(halo.id);
				}
			}
		}
		
		private static function initFrameIds():void{
			_mainFrameIds = [];
			_sideFrameIds = [];
			var data:Object = HalosConfig["frameConfig"];
			for each(var haloFrame:HaloFrame in data ){
				if( haloFrame.isMainFrame() ){
					_mainFrameIds.push(haloFrame.id);
				}else{
					_sideFrameIds.push(haloFrame.id);
				}
			}
			if( _mainFrameIds.length>1 )
				_mainFrameIds.reverse();
			
			if( _sideFrameIds.length>1 )
				_sideFrameIds.reverse();
		}
		
		private static function isInArray(num:int, arrayData:Array):Boolean{
			for( var i:int=0;i<arrayData.length;i++ ){
				if( int(arrayData[i]) == num )
					return true;
			}
			return false;
		}
	}
}