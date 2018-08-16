package mmo.framework.domain.union.info
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;
	import mmo.framework.domain.union.UnionChangeable;
	import mmo.framework.domain.union.UnionClient;
	import mmo.framework.domain.union.Unions;
	import mmo.framework.domain.union.define.UnionLevel;
	import mmo.framework.domain.union.events.UnionEvent;
	
	/**
	 * 联盟信息
	 * @author wangrentong
	 */	
	public class UnionInfo extends UnionChangeable
	{
		public static const Id:String = "Id";
		public static const Name:String = "Name";
		public static const Logo:String = "Logo";
		public static const Host:String = "Host";
		public static const Level:String = "Level";
		public static const Honor:String = "Honor";
		public static const Fund:String = "Fund";
		public static const Announcement:String = "Announcement";
		public static const Ranking:String = "Ranking";
		public static const Population:String = "Population";
		public static const CreateTime:String = "CreateTime";
		
		public function UnionInfo(){
		}
		
		public function onCreateUnion(name:String):void{
			this.name = name;
		}
		/** 同步我的联盟信息 */
		public function synchronizeMyUnionInfo(callBack:Function = null):void{
			UnionClient.sendExtMsg("105_17", 
				{"un":UserInfo(MainModelLocator.instance.retrieveModel(UserInfo)).userName}, onGetInfo);
			function onGetInfo(params:Object):void{
				setUnionInfo(params.info);
				if(callBack != null){
					callBack.apply();
				}
			}
		}
		
		public static function getInfoFromServer(unionName:String, callBack:Function):void{
			UnionClient.sendExtMsg("105_19", {"unin":unionName}, onGetInfo);
			function onGetInfo(params:Object):void{
				var union:UnionInfo = new UnionInfo();
				union.setUnionInfo(params.info);
				callBack.apply(null, [union]);
			}
		}
		
		public function setUnionInfo(info:Object = null):void{
			if(info == null){
				return;
			}
			name = info.name;
			id = info.id;
			announcement = info.notice;
			honor = info.honor;
			fund = info.money;
			lv = info.lv;
			ranking = info.ranking + 1;
			population = info.memberNum;
			host = info.host;
			logo = new UnionLogo(info.logo);
			createTime = info.ct;
		}
		
		public function onExit():void{
			name = "";
			announcement = "";
			honor = 0;
			fund = 0;
			lv = 0;
			ranking = -1;
			population = 0;
			host = "";
			logo = new UnionLogo("");
			createTime = 0;
		}
		
		/** 升级需要资金 */
		public function get levelUpNeedFund():int{
			return level.needFund;
		}
		/** 升级需要荣耀 */
		public function get levelUpNeedHonor():int{
			return level.needHonor;
		}
		
		/** 是否有联盟（自建或加入） */
		public function get hasJoinUnion():Boolean{
			return !StringUtil.isEmpty(name);
		}
		/** 名字 */
		public function get name():String{
			return getProperty(Name);
		}
		public function set name(value:String):void{
			setProperty(Name, value);
		}
		
		public function get id():int{
			return getProperty(Id);
		}
		
		public function set id(value:int):void{
			setProperty(Id, value);
		}
		
		/** 等级 */
		public function get level():UnionLevel{
			return Unions.getUnionLevelByLv(lv);
		}
		public function set lv(lv:int):void{
			setProperty(Level, lv);
		}
		public function get lv():int{
			return getProperty(Level);
		}

		/** 人口上限 */
		public function get maxPopulation():int{
			return level.population;
		}
		
		/** 公告 */
		public function get announcement():String{
			return getProperty(Announcement);
		}
		public function set announcement(value:String):void{
			setProperty(Announcement, value);
		}
		
		/** 徽章 */
		public function get logo():UnionLogo{
			return getProperty(Logo);
		}
		public function set logo(logo:UnionLogo):void{
			setProperty(Logo, logo);
		}
		
		/** 荣誉值 */
		public function get honor():int{
			return getProperty(Honor);
		}
		public function set honor(value:int):void{
			setProperty(Honor, value);
		}
		
		/** 资金 */
		public function get fund():int{
			return getProperty(Fund);
		}
		public function set fund(value:int):void{
			setProperty(Fund, value);
		}
		
		/** 会长 */
		public function get host():String{
			return getProperty(Host);
		}
		public function set host(value:String):void{
			setProperty(Host, value);
		}
		
		/** 创建时间 **/
		public function get createTime():Number{
			return getProperty(CreateTime);
		}
		public function set createTime( value:Number ):void{
			setProperty(CreateTime, value);
		}
		
		public function get ranking():int{
			return getProperty(Ranking);
		}
		public function set ranking(rk:int):void{
			setProperty(Ranking, rk);
		}
		public function get rankTip():String{
			if(ranking <= 0 || ranking >= 99999){
				return "未上榜.";
			}
			return String(ranking);
		}

		public function get population():int{
			return getProperty(Population);
		}
		public function set population(value:int):void{
			setProperty(Population, value);
		}

		override protected function notifyObjectChange(params:Object):void{
			dispatchEvent(new UnionEvent(UnionEvent.OnUnionInfoChange, params));;
		}
		
	}
}