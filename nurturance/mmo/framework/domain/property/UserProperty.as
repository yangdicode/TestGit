package mmo.framework.domain.property
{
	import flash.utils.getTimer;
	
	import mmo.common.DateUtil;
	import mmo.framework.domain.collegeprofession.CollegeProfessionDefines;
	import mmo.framework.domain.profession.UserProfession;
	import mmo.framework.model.changeable.ChangeableObject;
	import mmo.framework.model.changeable.IChangeableObject;

	public class UserProperty extends ChangeableObject implements IChangeableObject
	{		
		private static const NORMAL_TIME_SECOND:int = 3*60*60;
		private static const FESTIVAL_TIME_SECOND:int = 5*60*60;
		
		public static const MAXHP:String = "maxHp";
		public static const HP:String = "hp";
		public static const RACE:String = "race";
		public static const SEX:String = "sex";
		public static const FEATHERAGE:String = "featherAge";
		public static const EXP:String = "exp";
		public static const GAMETIME:String = "gameTime";
		public static const REALTIME:String = "realTime"
		public static const ENERGY:String = "energy";
		public static const MAX_ENERGY:String = "maxEnergy";
		public static const CHARM:String = "charm";
		public static const FASHION:String = "fashion";
		public static const INTELLIGENCE:String = "intelligence";
		public static const AGILITY:String = "agility";
		public static const STRENGTH:String = "strength";
		public static const MORALITY:String = "morality";
		public static const STAMINA:String = "stamina";
		public static const PROFESSION:String = "profession";
		public static const WING:String = "wing";
		public static const ACTIVE_TIME:String = "activeTime";
		
		public static const BADGE:String = "badge";
		public static const EFFORTS:String = "efforts";
		public static const SIGN:String = "sign";
		
		public static const IDCARD:String = "idcard";
		public static const HIDE_MEMBER:String = "hvip";
		public static const ProSlot:String = "proslot";
		
		public static const BlessBuff:String = "blessbuff";
		public static const Jewery:String = "jewelry";
		
		//星光总汇职业
		public static const COLLEGE_PRO_ID:String = "cpId";
		public static const COLLEGE_PRO_EXP:String = "cpExp";
		public static const COLLEGE_PRO_TITLE_ID:String = "cpTitle";
		
		private var _initGameTime:int;
		private var _initTimer:int;
		
		public function UserProperty()
		{
		}
		
		/**
		 * 最大生命值 
		 */		
		public function get maxHp():int
		{
			return int(this.getValue(MAXHP));
		}
		
		public function set maxHp(value:int):void
		{
			this.setValue(MAXHP, value);
		}
		
		/**
		 * 生命值
		 */		
		public function get hp():int
		{
			return int(this.getValue(HP));
		}
		
		public function set hp(value:int):void
		{
			this.setValue(HP, value);
		}
		
		/**
		 * 种族
		 */		
		public function get race():Race
		{
			return Race(this.getValue(RACE));	
		}
		
		public function set race(race:Race):void
		{
			this.setValue(RACE, race);
		}
		
		/**
		 * 性别
		 */		
		public function get sex():Sex
		{
			return Sex(this.getValue(SEX));
		}
		
		public function set sex(sex:Sex):void
		{
			this.setValue(SEX, sex);
		}
		
		/**
		 * 羽龄
		 */	
		public function get featherAge():int
		{
			return FeatherAges.getAttrFeatherAge(getNurtureAttrSum);
		}	
				
		/**
		 * 总经验值
		 */	
		public function get exp():int
		{
			return int(this.getValue(EXP));
		}
		
		public function set exp(exp:int):void
		{
			this.setValue(EXP, exp);	
		}
		
		/**
		 * 全部游戏时间
		 */		
		public function get gameTime():int
		{
			return int(this.getValue(GAMETIME));
		}
		
		public function set gameTime(value:int):void
		{
			this.setValue(GAMETIME, value);
			_initGameTime = onlineTime;
			_initTimer = getTimer();
		}
		
		public function get onlineSecond():int
		{
			return _initGameTime + (getTimer() - _initTimer) / 1000;
		}
		
		/** 
		 * 玩家在线时长（消耗时间，秒,一分钟更新一次）
		 * */
		 public function get onlineTime():int
		 {
			 if( DateUtil.isFestival() )			 
				 return (FESTIVAL_TIME_SECOND-gameTime);			 
			 else
				 return (NORMAL_TIME_SECOND-gameTime);	 
		 }
		
		/**
		 * 剩余游戏时间，防沉迷剩余时间
		 */
		public function get realTime():int
		{
			return int(this.getValue(REALTIME));
		}
		public function set realTime(value:int):void
		{
			this.setValue(REALTIME, value);
		}
		
		/**
		 * 体力
		 */		
		public function get energy():int
		{
			return int(this.getValue(ENERGY));
		}	
		
		public function set energy(energy:int):void
		{
			this.setValue(ENERGY, energy);
		}	
		
		/**
		 * 最大体力值
		 */		
		public function get maxEnergy():int
		{
			return int(this.getValue(MAX_ENERGY));	
		}
		
		public function set maxEnergy(maxEnergy:int):void
		{
			this.setValue(MAX_ENERGY, maxEnergy);
		}
		
		/**
		 * 魅力
		 */		
		public function get charm():int
		{
			return int(this.getValue(CHARM));
		}	
		
		public function set charm(charm:int):void
		{
			this.setValue(CHARM, charm);
		}	
		
		/**
		 * 时尚
		 */	
		public function get fashion():int
		{
			return int(this.getValue(FASHION));
		}	
		
		public function set fashion(fashion:int):void
		{
			this.setValue(FASHION, fashion);
		}	
		
		/**
		 * 智慧
		 */	
		public function get intelligence():int
		{
			return int(this.getValue(INTELLIGENCE));
		}	
		
		public function set intelligence(intelligence:int):void
		{
			this.setValue(INTELLIGENCE, intelligence);
		}	
		
		/**
		 * 敏捷
		 */		
		public function get agility():int
		{
			return int(this.getValue(AGILITY));
		}	
		
		public function set agility(agility:int):void
		{
			this.setValue(AGILITY, agility);
		}	
		
		/**
		 * 力量
		 */		
		public function get strength():int
		{
			return int(this.getValue(STRENGTH));
		}	
		
		public function set strength(strength:int):void
		{
			this.setValue(STRENGTH, strength);
		}	
		
		/**
		 * 道德
		 */		
		public function get morality():int
		{
			return int(this.getValue(MORALITY));
		}	
		
		public function set morality(morality:int):void
		{
			this.setValue(MORALITY, morality);
		}	
		
		/**
		 * 体质
		 */		
		public function get stamina():int
		{
			return int(this.getValue(STAMINA));
		}	
		
		public function set stamina(stamina:int):void
		{
			this.setValue(STAMINA, stamina);
		}
		
		/**
		 * 返回所有基础属性和
		 */		
		public function get getNurtureAttrSum():int
		{
			return this.intelligence + this.agility + this.strength + this.morality + this.stamina;
		}
		
		/**
		 * 职业 
		 */			
		public function get userProfession():UserProfession
		{
			return UserProfession(this.getValue(PROFESSION));
		}
		
		public function set userProfession(profession:UserProfession):void
		{
			this.setValue(PROFESSION,profession);
		}
		
		/**
		 * 光之翼级别
		 */			
		public function get wing():int
		{
			return int(this.getValue(WING));
		}
		
		public function set wing(wing:int):void
		{
			this.setValue(WING, wing);
		}
		
		/**
		 * 称号
		 */			
		public function get badge():int
		{
			return int(this.getValue(BADGE));
		}
		
		public function set badge(badge:int):void
		{
			this.setValue(BADGE, badge);
		}
		
		/**
		 * 成就勋章列表
		 */			
		public function get efforts():Array
		{
			return this.getValue(EFFORTS) as Array;
		}
		
		public function set efforts(efforts:Array):void
		{
			this.setValue(EFFORTS, efforts);
		}
		
		/**
		 *  个性签名编号
		 */		
		public function get sign():int
		{
			return int(this.getValue(SIGN));
		}
		
		public function set sign(sign:int):void
		{
			this.setValue(SIGN, sign);
		}
		
		/**
		 * 身份证号码 
		 */		
		public function get idCard():String
		{
			return String(this.getValue(IDCARD));
		}
		
		public function set idCard(value:String):void
		{
			this.setValue(IDCARD, value);
		}
		
		/**
		 * 隐藏vip显示
		 */
		public function get hideMember():Boolean
		{
			return Boolean(this.getValue(HIDE_MEMBER));
		}
		
		public function set hideMember(value:Boolean):void
		{
			this.setValue(HIDE_MEMBER, value);
		}
		
		/**
		 * 职业卡槽数量
		 */
		public function get proSlot():int
		{
			return int(this.getValue(ProSlot));
		}
		
		public function set proSlot(value:int):void
		{
			this.setValue(ProSlot, value);
		}
		
		/**
		 * 注册时间
		 */		
		public function get activeTime():Number
		{
			return Number(this.getValue(ACTIVE_TIME));
		}
		
		public function set activeTime(activeTime:Number):void
		{
			this.setValue(ACTIVE_TIME, activeTime);
		}
		
		
		private static const LIMIT_DAYS:int = 28;
		/** 
		 * 是不是注册28天内的新手
		 **/
		public function isFreshPlayer():Boolean
		{
			return (getLoadedDays()<=LIMIT_DAYS);
		}
		
		/** 
		 * 是不是注册N天内的新手用户
		 **/
		public function isFreshNDayPlayer( limitDay:int = 40 ):Boolean
		{
			return (getLoadedDays()<=limitDay);
		}
		
		/**
		 * 玩家从注册到当前的天数,向上取整,最小天数为1
		 */		
		public function getLoadedDays():int{
			var curTime:Date = DateUtil.getServerTime();
			var maxCurTime:Date = new Date(curTime.fullYear,curTime.month,curTime.date,23,59,59);			
			var days:int = int((maxCurTime.time-activeTime)/(24*60*60*1000))+1;
			if( days<1 )
				days = 1;			
			return days;
		}
		
		public function set blessBuff(id:int):void{
			this.setValue(BlessBuff, id);
		}
		/**
		 * 占卜buff
		 */		
		public function get blessBuff():int{
			return int(getValue(BlessBuff));
		}
		
		public function set jewelry(id:int):void{
			this.setValue(Jewery, id);
		}
		/**
		 * 珠宝祝福
		 * */
		public function get jewelry():int{
			return int(getValue(Jewery));
		}
		
		public function get collegeProId():int{
			return int(getValue(COLLEGE_PRO_ID));
		}
		/**
		 * 星光总汇展示职业id 
		 */		
		public function set collegeProId(id:int):void{
			this.setValue(COLLEGE_PRO_ID, id);
		}
		
		/**
		 * 星光总汇展示职业等级，设置经验来改变 
		 */	
		public function get collegeProLv():int{
			var exp:int = int(getValue(COLLEGE_PRO_EXP));
			return CollegeProfessionDefines.getCollegeProfessionLvByExp(collegeProId,exp);
		}
		/**
		 * 星光总汇展示职业经验 
		 */		
		public function set collegeProExp(exp:int):void{					
			this.setValue(COLLEGE_PRO_EXP, exp);
		}
		
		public function get collegeProTitleId():int{
			return int(getValue(COLLEGE_PRO_TITLE_ID));
		}
		/**
		 * 星光总汇展示职业title(职位id) 
		 */		
		public function set collegeProTitleId(id:int):void{
			this.setValue(COLLEGE_PRO_TITLE_ID, id);
		}
	}
}