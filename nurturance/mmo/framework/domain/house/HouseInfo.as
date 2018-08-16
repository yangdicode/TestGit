package mmo.framework.domain.house
{
	import flash.events.EventDispatcher;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.furniture.FurnituresDataProxy;
	import mmo.framework.domain.material.furniture.UserFurniture;

	/**
	 * 小屋的信息 
	 * @author hekehui
	 * 
	 */
	public class HouseInfo extends EventDispatcher
	{
		public static const DEFAULTGARDENID:int = 0;
		public static const DEFAULTBACKGROUND:int = 146;
		public static const DEFAULTHOUSE:int = 21;
		private var _owner:String; 
		private var subHouses:Object;
		private var _gardenId:int;
		private var _mainHouseId:int;
		private var _roomName:String;
		private var _houseName:String;
		
		public function HouseInfo(owner:String, houseInfoStr:String)
		{
			this._owner = owner;
			this.subHouses = {};
			parseHouseInfoStr(houseInfoStr)
		}
		
		public function reset(houseId:int):void
		{
			_mainHouseId = houseId;
			for (var hid:String in subHouses)
			{
				if(int(hid) != _gardenId)
				{
					delete subHouses[hid];		
				}	
			}
			subHouses[_mainHouseId] = [];
			
			this.dispatchEvent(new HouseInfoEvent(HouseInfoEvent.HOUSERESET));
		}	
			
		/**
		 * 小屋主人 
		 * @return 
		 * 
		 */
		public function get owner():String
		{
			return this._owner;
		}
		
		/**
		 * subHouse装饰信息
		 * 
		 * */
		public function getSubHouseInfo(houseId:int):Array
		{
			return this.subHouses[houseId] as  Array;
		}	
		
		public function setSubHouseInfo(houseId:int, houseInfo:Array):void
		{
			this.subHouses[houseId] = houseInfo;
		}	
		/**
		 * 获得摆放出来的所有家具, 包括房型
		 * 
		 * */
		public function getFurnitures():Array
		{
			var furnitures:Array = [];
			
			//注明：subHouses内已经包括房型，不需要重新加入
			
			for each(var subhouse:Array in this.subHouses)
			{
				for each(var furStr:String in subhouse)
				{
					var props:Array = furStr.split(",");
					if(int(props[0]) == MaterialTypes.FURNITURE)
					{
						var id:int = int(props[1])
						var furnitureDefine:Material = FurnituresDataProxy.getFurnitureDefine(id);
						furnitures.push(new UserFurniture(furnitureDefine, 1, 1));
					}	
				}
			}
			
			return furnitures;
		}					
		/**
		 * 小屋花园
		 * @return 
		 * 
		 */
		public function get gardenId():int
		{
			return this._gardenId;
		}
		
		/**
		 * 小屋主房间
		 * 
		 * */
		public function get mainHouseId():int
		{
			return this._mainHouseId;
		}	
		/**
		 * 当前所在房间名
		 * @return 
		 * 
		 */
		public function get	roomName():String
		{
			return this._roomName;
		}
		
		public function set roomName(value:String):void
		{
			this._roomName = value;
		}	
		
		/**
		 *所有 房间信息的格式为 garden;house1;house2
		 *每个房间的信息格式为 houseId|fur1|fur2
		 *每个家具的信息格式为 |type,id,x,y,angle|
		 * 
		 * */
		private function parseHouseInfoStr(houseInfoStr:String):void
		{
			var shs:Array = houseInfoStr.split(";");
			if(shs[0] == null || shs[0] == "")
			{
				throw new Error("小屋数据错误, 花园都没有!");
			}	
			if(shs[1] == null || shs[1] == "")
			{
				throw new Error("小屋数据错误, 主房间都没有!");
			}	
			this._gardenId = int(shs[0].split("|")[0]);
			this._mainHouseId = int(shs[1].split("|")[0]);
			trace(1)
			for each(var subhouse:String in shs)
			{
				var items:Array = subhouse.split("|");
				var houseId:int = int(items[0]);
				var furnitures:Array = [];
				if(items.length > 1)
				{	
					furnitures = items.slice(1, items.length);
				}
				this.subHouses[houseId] = furnitures;
			}
			validateGarden();
			validateGardenHouse();
		}	
		
		private function validateGarden():void
		{
			var gardenInfo:Array = getSubHouseInfo(gardenId);
			var hasBackground:Boolean = false;
			for each(var furniture:String in gardenInfo)
			{
				var furId:int = int(furniture.split(",")[1]);
				var furType:int = FurnituresDataProxy.getFurnitureDefine(furId).type;
				if(furType == 9)
				{
					hasBackground = true;
				}	
			}
			if(!hasBackground)
			{
				gardenInfo.push("3,146,0,0,0");
			}	
		}	
		
		private function validateGardenHouse():void
		{

			var houseDisplayTypes:Array = [7,8,10];
			var gardenInfo:Array = getSubHouseInfo(gardenId);
			var hasGardenHouse:Boolean = false;
			for each(var furniture:String in gardenInfo)
			{
				var furId:int = int(furniture.split(",")[1]);
	
				if(furId>0)
				{
					
					var furType:int = FurnituresDataProxy.getHouseMaterialTypeById(furId);
					if(houseDisplayTypes.indexOf(furType)>=0)
					{

						hasGardenHouse = true;
						break;
					}	

				}
				
			}
			


			if(!hasGardenHouse)
			{
				var gardenHouseID :int = 21;
				for (var hid:String in subHouses)
				{

					if(int(hid) >0)
					{
						var furType:int = FurnituresDataProxy.getHouseMaterialTypeById(int(hid));
						if(houseDisplayTypes.indexOf(furType)>=0)
						{

							gardenHouseID = int(hid);
							break;
						}	
					}	
				}
				

				var gardenHouseInfo:String = "3,"+gardenHouseID.toString()+",200,200,1";

				gardenInfo.push(gardenHouseInfo);
	
			}	
			
			
		}	
		
		public function format():String
		{
			var result:String = subHouseFormat(this.gardenId, this.getSubHouseInfo(this.gardenId));
			var info:Array;
			for (var subHouseKey:String in this.subHouses)
			{
				var subHouse:int = int(subHouseKey);
				if(subHouse != this.gardenId)
				{
					result +=";" + subHouseFormat(subHouse, this.getSubHouseInfo(subHouse));
				}	
			}	
			return result;
		}	
		
		private function subHouseFormat(houseId:int, subHouseInfo:Array):String
		{
			var result:String = "" + houseId;
			for each(var item:String in subHouseInfo)
			{
				result += "|" + item;
			}
			return result;
		}	
		/**
		 * 创建副本 
		 * @return 
		 * 
		 */
		public function clone():HouseInfo
		{
//			return new HouseInfo(this._owner, this._gardenId, this.subHouses, this._roomName);	
			return null;
		}

		public function get houseName():String
		{
			return _houseName;
		}

		public function set houseName(value:String):void
		{
			_houseName = value;
			var event:HouseInfoEvent = new HouseInfoEvent(HouseInfoEvent.ONSETHOUSENAME);
			event.houseName = _houseName;
			this.dispatchEvent(event);
		}

	}
}