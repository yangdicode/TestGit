package mmo.framework.domain.palace
{
	import flash.events.EventDispatcher;
	
	import mmo.common.DateUtil;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.IChangeableObject;

	public class UserPalaceInfo extends EventDispatcher implements IChangeableObject
	{
		public static const propertyId:String = "id";
		public static const propertyName:String = "name";
		public static const propertyCrownId:String = "crownid";
		public static const propertyCrowns:String = "crowns";
		public static const propertyMemberCount:String = "memberCount";
		public static const propertyStarLevel:String = "starlevel";
		public static const propertyRank:String = "rank";
		public static const propertyDeadline:String = "deadline";
		
		private var _identity:int;
		private var _master:String;
		private var _logoId:int;
		private var _values:Object;
		
		public function UserPalaceInfo(info:Object=null)
		{
			this._values = {};

			this.id = 0;
			if (info != null)
			{
				this.id = info.pid;
				this._identity = info.type;
				this.deadline = info.dl;
			}
		}
		
		public function getMyPalaceBaseInfo(callback:Function):void
		{
			this.getPalaceBaseInfo(PalaceClient.onGetMyPalaceInfo, callback);
		}
		
		public function getOtherPalaceBaseInfo(callback:Function):void
		{
			this.getPalaceBaseInfo(PalaceClient.onGetOtherPalaceInfo, callback);
		}
		
		public function setPalaceBaseInfo(info:Object):void
		{
			this.id = int(info.pid);
			this.name = String(info.pn);
			this._master = String(info.host);
			this.rank = int(info.r);
			this._logoId = int(info.logo);
			
			this.crownId = int(info.cid);
			var arr:Array = [];
			for each(var crowinfo:Object in info.crowns)
			{
				arr.push(PalaceCrownIdAndLevel.parse(crowinfo));
			}
			this.setValue(propertyCrowns, arr);
			
			this.memberCount = int(info["mn"]);
		}
		
		private function clearPalaceInfo():void
		{
			this._master = "";			
			this.name = "";
			this.crownId = 0;
			this.memberCount = 0;
			this.rank = 0;
			this.setValue(propertyCrowns, []);
		}
		
		public function get isExist():Boolean
		{
			if (this.id == 0)
			{
				return false;
			}
			return true;
		}
		
		public function get identity():int
		{
			return this._identity;
		}
		
		public function get id():int
		{
			return int(this.getValue(propertyId));
		}

		public function set id(value:int):void
		{
			if (value == 0)
			{
				this.clearPalaceInfo();
			}
			this.setValue(propertyId, value);
		}

		public function get deadline():Number
		{
			return Number(this.getValue(propertyDeadline));
		}
		
		public function set deadline(value:Number):void
		{
			this.setValue(propertyDeadline, value);
		}
		
		public function get isDated():Boolean
		{
			if (DateUtil.getServerTime().time < this.deadline)
			{
				return false;
			}
			return true;
		}
		
		public function get logoId():int
		{
			return this._logoId;
		}
		
		public function get isUsable():Boolean
		{
			if (!this.isDated && this.isExist)
			{
				return true;
			}
			return false;
		}
		
		public function get leftDay():int
		{
			var leftDay:int = 0;
			if (!this.isDated)
			{
				leftDay = Math.ceil((this.deadline - DateUtil.getServerTime().time) / DateUtil.DAY);
			}
			return leftDay;
		}
		
		public function get name():String
		{
			return String(this.getValue(propertyName)) + "的宫殿";
		}
		
		public function set name(value:String):void
		{
			this.setValue(propertyName, value);
		}
		
		public function get master():String
		{
			return this._master;
		}
		
		public function get starLevel():int
		{
			return int(this.getValue(propertyStarLevel));
		}
		public function get gloryPower():int
		{
			return this.crownPower + this.countPower;
		}
		
		public function get crownId():int
		{
			return int(this.getValue(propertyCrownId));
		}
		public function set crownId(value:int):void
		{
			this.setValue(propertyCrownId, value);
		}
		public function get crowns():Array
		{
			return this.getValue(propertyCrowns) as Array;
		}
		public function changeCrown(id:int, level:int):void
		{
			var oldCrowns:Array = this.crowns.concat();
			var crown:PalaceCrownIdAndLevel = this.getCrownById(id);
			if (crown == null)
			{
				crown = new PalaceCrownIdAndLevel(id, level);
				this.crowns.push(new PalaceCrownIdAndLevel(id, level));
			}
			else
			{
				crown.level = level;
			}
			
			if (this.crownId == 0)
			{
				this.crownId = id;
				PalaceClient.sendXtMessage(PalaceClient.onSetPalaceCrownShow, null, {"pid":this.id, "cid":id});
			}
			this.setStarLevel();
			this.dispatchChangeableEvent(propertyCrowns, oldCrowns, this.crowns);
		}
		public function getCrownLvById(id:int):int
		{
			for each(var info:PalaceCrownIdAndLevel in this.crowns)
			{
				if (info.id == id)
				{
					return info.level;
				}
			}
			return 0;
		}
		public function getCrownById(id:int):PalaceCrownIdAndLevel
		{
			for each(var info:PalaceCrownIdAndLevel in this.crowns)
			{
				if (info.id == id)
				{
					return info;
				}
			}
			return null;
		}
		public function get crownLv():int
		{
			return getCrownLvById(this.crownId);
		}
		public function get crownPower():int
		{
			var count:int = 0;
			for each(var info:PalaceCrownIdAndLevel in this.crowns)
			{
				count += info.levelInfo.gloryPower;
			}
			return count;
		}
		
		public function get memberCount():int
		{
			return int(this.getValue(propertyMemberCount));
		}
		public function set memberCount(value:int):void
		{
			this.setValue(propertyMemberCount, value);
			this.setStarLevel();
		}
		public function get countPower():int
		{
			return this.memberCount * 10;
		}
		
		public function get rank():int
		{
			return int(this.getValue(propertyRank));
		}
		public function set rank(value):void
		{
			this.setValue(propertyRank, value);
		}
		
		public function get currLevelInfo():PalaceLevel
		{
			return PalaceDataFacade.getPalaceLevel(this.starLevel);
		}
		
		private function setStarLevel():void
		{
			var level:int = PalaceDataFacade.maxPalaceLevel;
			for (; level>=1; level--)
			{
				var info:PalaceLevel = PalaceDataFacade.getPalaceLevel(level);
				if (this.gloryPower >= info.needExp)
				{
					break;
				}
			}
			this.setValue(propertyStarLevel, level);
		}
		
		private function getPalaceBaseInfo(cmd:String, callback:Function):void
		{
			if (this.isExist)
			{
				PalaceClient.sendXtMessage(cmd, function(params:Object):void{
					if (params.ret == 0)
					{
						setPalaceBaseInfo(params.palace);
					}
					else
					{
						id = 0;
					}
					callback.apply();
				}, {"pid":this.id});
			}
			else
			{
				callback.apply();
			}
		}
		
		public function dispatchChangeableEvent(property:String, orgValue:Object, newValue:Object):void
		{
			var params:Object = {"property":property, "orgValue":orgValue, "newValue": newValue};
			this.dispatchEvent(new ChangeableEvent(ChangeableEvent.onObjectPropertyChanged,
				this, params));
		}
		
		public function setValue(property:String, value:Object):void
		{
			var orgValue:Object = null;
			if(this._values.hasOwnProperty(property))
			{
				orgValue = this._values[property];
			}	
			
			if(value == orgValue)
			{
				return;
			}
			
			this._values[property] = value;
			
			this.dispatchChangeableEvent(property, orgValue, value);
		}
		
		public function getValue(property:String):Object
		{
			return this._values[property];
		}
	}
}