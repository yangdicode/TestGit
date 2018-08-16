package mmo.framework.domain.union.info
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;
	import mmo.framework.domain.union.UnionChangeable;
	import mmo.framework.domain.union.Unions;
	import mmo.framework.domain.union.define.UnionJob;
	import mmo.framework.domain.union.define.UnionTitle;
	import mmo.framework.domain.union.events.UnionEvent;

	/**
	 * 联盟成员信息
	 * @author wangrentong
	 */	
	public class UnionMember extends UnionChangeable
	{
		public static const UnionId:String = "UnionId";
		public static const UnionName:String = "UnionName";
		public static const Job:String = "Job";
		public static const Reputation:String = "Reputation";
		public static const CurrentContribution:String = "CurrentContribution";
		public static const WeekCcontribution:String = "WeekCcontribution";
		public static const TotalContribution:String = "TotalContribution";
		
		private var _userName:String;
		
		public function UnionMember(info:Object = null){
			setMemberInfo(info);
		}
		
		public function setMemberInfo(info:Object):void{
			if(info == null){
				return;
			}
			unionId = info.unid;
			unionName = info.unin;
			jobId = info.role;
			reputation = info.prestige;
			currentContribution =  info.c;
			weekContribution = info.wc;
			totalContribution = info.sc;
			_userName = info.un;
		}
		
		public function onExit():void{
			unionName = "";
			jobId = 0;
			currentContribution = 0;
			weekContribution = 0;
			totalContribution = 0;
		}
		
		public function get hasJoinUnion():Boolean{
			return !StringUtil.isEmpty(unionName);
		}
		
		/** 爵位 */
		public function get title():UnionTitle{
			return Unions.getTitleByReputation(reputation);
		}
		
		public function get unionId():int{
			return getProperty(UnionId);
		}
		public function set unionId(value:int):void{
			setProperty(UnionId, value);
		}
		
		public function get unionName():String{
			return getProperty(UnionName);
		}
		public function set unionName(name:String):void{
			setProperty(UnionName, name);
		}
		
		/** 职务 */
		public function get job():UnionJob{
			return Unions.getJobByJonId(jobId);
		}
		public function get jobId():int{
			return getProperty(Job);
		}
		public function set jobId(jobId:int):void{
			setProperty(Job, jobId);
		}
		
		/** 声望 */
		public function get reputation():int{
			return getProperty(Reputation);
		}
		public function set reputation(reputation:int):void{
			setProperty(Reputation, reputation);
		}
		
		/** 本周贡献 */
		public function get weekContribution():int{
			return getProperty(WeekCcontribution);
		}
		public function set weekContribution(value:int):void{
			setProperty(WeekCcontribution, value);
		}
		
		/** 总贡献 */
		public function get totalContribution():int{
			return getProperty(TotalContribution);
		}
		public function set totalContribution(value:int):void{
			setProperty(TotalContribution, value);
		}
		
		/** 当前贡献 */
		public function get currentContribution():int{
			return getProperty(CurrentContribution);
		}
		public function set currentContribution(value:int):void{
			setProperty(CurrentContribution, value);
		}

		public function get userName():String{
			if(StringUtil.isEmpty(_userName)){
				_userName = UserInfo(MainModelLocator.instance.retrieveModel(UserInfo)).userName;
			}
			return _userName;
		}
		
		override protected function notifyObjectChange(params:Object):void{
			var event:UnionEvent = new UnionEvent(UnionEvent.OnMemberInfoChange, params);
			this.dispatchEvent(event);
		}

	}
}