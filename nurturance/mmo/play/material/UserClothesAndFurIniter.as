package mmo.play.material
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.framework.domain.house.HouseInfo;
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.framework.domain.material.clothes.UserClothes;
	import mmo.framework.domain.material.clothes.UserClothesData;
	import mmo.framework.domain.material.furniture.UserFurniture;
	import mmo.framework.domain.material.furniture.UserFurnitureData;
	import mmo.framework.domain.property.Sex;
	import mmo.framework.domain.property.UserProperty;
	import mmo.play.DataIniter;
	import mmo.play.dialog.NewDialog;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.furniture.FurnitureFacade;
	
	public class UserClothesAndFurIniter extends DataIniter
	{
		public function UserClothesAndFurIniter()
		{
			super();
		}
		
		override public function getData():void
		{
			ClothesFacade.instance;
			FurnitureFacade.instance;
			
			SocketClient.instance.addEventListener(ClothesFurnitureClient.cmdGetClothesAndFurniture, onGetClothesAndFurniture);
			ClothesFurnitureClient.instance.getClothesAndFurniture();
		}	
		
		private function onGetClothesAndFurniture(evt:SocketClientEvent):void
		{
			SocketClient.instance.removeEventListener(ClothesFurnitureClient.cmdGetClothesAndFurniture, onGetClothesAndFurniture);
		
			var avatarStr:String = evt.params.avatar as String;
			var clotheObj:Object = evt.params.cloth;
			//穿着
			var avatarInfo:AvatarInfo = initAvatar(avatarStr);
			//衣服
			initClothes(avatarInfo, clotheObj, evt.params.favouriteCloth);
			
			var furnitureObj:Object = evt.params.furniture;
			var houseInfoStr:String = evt.params.hd;
			//小屋装扮
			var houseInfo:HouseInfo = initHouseInfo(houseInfoStr, evt.params["name"]);
			//家具
			initFurniture(houseInfo, furnitureObj);		
			this.onGetData(null);
		}	
		
		private function initAvatar(avatarStr:String):AvatarInfo
		{
			var avatarInfo:AvatarInfo = new AvatarInfo();
			trace("avatarStri~~~~~~~~~~~~" + avatarStr);
			avatarInfo.setAvatarInfoWithString(avatarStr);
			var userProp:UserProperty = ModelInfo.getUserProperty();
			trace("userProp:" + userProp);
			avatarInfo.setDefaultClothesBySex(userProp.sex == Sex.MALE);
			MainModelLocator.instance.addModel(AvatarInfo, avatarInfo);
			ModelInfo.getUsersSOProxy().refreshLocalAvatarInfo(avatarStr, userProp.sex.value);
			return avatarInfo;
		}	
		
		private function initClothes(avatarInfo:AvatarInfo, clotheObj:Object, favorClothes:Array):void
		{
			var id:int;
			var num:int;
			var getTime:Number;
			var material:Material;
			var avatarClothes:Array = avatarInfo.getClothes().concat();
			var userClothesData:UserClothesData = new UserClothesData();
			for each(var cloth:Object in clotheObj.list)
			{
				id = int(cloth.id);
				
				num = int(cloth.num);
				getTime = Number(cloth.t);
				material = ClothesFacade.instance.getMaterialById(id);
				var userClothes:UserClothes = new UserClothes(material, num, 0, getTime);
				var sameClothes:Clothes = hasSameClothes(userClothes, avatarClothes);
				if(sameClothes)
				{
					userClothes.usedUp = userClothes.usedUp + 1;
				}
				userClothes.isFavor = (favorClothes.indexOf(id) >= 0);
				userClothesData.addUserClothes(userClothes);
			}
			MainModelLocator.instance.addModel(UserClothesData, userClothesData);
			ClothesFacade.instance.initMyClothes();
		}	
		
		private function initHouseInfo(houseInfoStr:String, houseName:String):HouseInfo
		{
			trace("houseInfoStr~~~~~~~~~~~~" + houseInfoStr);
			var houseInfo:HouseInfo = new HouseInfo(ModelInfo.getUserInfo().userName, houseInfoStr);
			houseInfo.houseName = houseName;
			MainModelLocator.instance.addModel(HouseInfo, houseInfo);		
			return houseInfo;
		}	
		
		private function initFurniture(houseInfo:HouseInfo, furnitureObj:Object):void
		{
			var id:int;
			var num:int;
			var material:Material;
			var houseFurs:Array = houseInfo.getFurnitures();
			var userFurniturData:UserFurnitureData = new UserFurnitureData();
			//由于后端没有存入 默认房型, 所以前端自己增加, 以及默认背景
			var defaultHouse:Object = {"id":21, "num":1};
			var defaultGardeBack:Object = {"id":146, "num":1};
			(furnitureObj.list as Array).push(defaultHouse);
			(furnitureObj.list as Array).push(defaultGardeBack);
			for each(var furniture:Object in furnitureObj.list)
			{
				id = int(furniture.id);
				num = int(furniture.num);
				material = FurnitureFacade.instance.getMaterialById(id);
				var userFurniture:UserFurniture = new UserFurniture(material, num, 0);
				var sameFurnitures:Array = hasSameFurnitures(userFurniture, houseFurs);
				var usedUp:int = userFurniture.usedUp;
				for each(var sf:UserFurniture in sameFurnitures)
				{
					usedUp += sf.usedUp;
				}
				userFurniture.usedUp = usedUp;
				userFurniturData.addUserFurniture(userFurniture);
			}			
			MainModelLocator.instance.addModel(UserFurnitureData, userFurniturData);
			FurnitureFacade.instance.initMyFurnitures();
		}	
		
		//获得穿着的相同类型的衣服
		private function hasSameClothes(userClothes:UserClothes, avatarClothes:Array):Clothes
		{
			for each(var clothes:Clothes in avatarClothes)
			{
				if(clothes == userClothes.material)
				{
					avatarClothes.splice(avatarClothes.indexOf(clothes), 1);
					return clothes;
				}	
			}
			return null;
		}	
		
		//获得小屋装饰中相同类型的家具集合
		private function hasSameFurnitures(userFurniture:UserFurniture, houseFurnitures:Array):Array
		{
			var furs:Array = [];
			for(var i:int = houseFurnitures.length - 1; i >= 0; i--)
			{
				var uf:UserFurniture = houseFurnitures[i];
				if(uf.material == userFurniture.material)
				{
					houseFurnitures.splice(i, 1);
					furs.push(uf);
				}	
			}	
			return furs;
		}	
	}
}