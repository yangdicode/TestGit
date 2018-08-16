package mmo.framework.domain.skill.base
{
	/**
	 * 用户技能基础数据
	 * @author liyawei
	 */	
	
	public class UserRaceSkillData
	{
		/** 技能经验 **/
		private var _skillExp:int;
		
		/** 技能等级 **/
		private var _skillLevel:int;
		
		private var _skillPhase:int;
		
		/** 所获得的子技能id数组 **/ 
		private var _skills:Array;
		
		public function UserRaceSkillData(exp:int,level:int,phase:int,skillStr:String)
		{
			this._skillExp = exp;
			this._skillLevel = level;
			this._skillPhase = phase;
			this._skills = initSkills(skillStr);
		}
		
		/** 种族技能经验 **/
		public function get skillExp():int
		{
			return _skillExp;
		}
		
		/** 种族技能等级 **/
		public function get skillLevel():int
		{
			return _skillLevel;
		}
		
		/** 种族技能阶段 **/
		public function get skillPhase():int
		{
			return _skillPhase;
		}
		
		/** 
		 *  获取用户拥有的子技能Id
		 * */
		public function get skills():Array
		{
			return this._skills;
		}
		
		/**
		 * 获取用户是否拥有某个子技能
		 * */
		public function hasUserSkill(skillId:int):Boolean
		{
			return (this.skills.indexOf(skillId) >= 0);
		}
		
		/**
		 * 更新前端用户数据缓存，慎用，有统一更新点！
		 * */
		public function updateUserData(exp:int = -1, level:int=-1, phase:int=-1):void
		{
			if(exp != -1){
				this._skillExp = exp;
			}
			
			if(level != -1){
				this._skillLevel = level;
			}
			
			if(phase != -1){
				this._skillPhase = phase;
			}
		}
		
		/**
		 * 更新前端用户数据缓存，慎用，有统一更新点！
		 * */
		public function upPhaseClient():void
		{
			this._skillPhase += 1;
		}
		
		/**
		 * 新增子技能
		 */	
		public function addUserSkill(skillId:int):void
		{
			if(this.hasUserSkill(skillId)){
				return;
			}
			this._skills.push(skillId);
		}
		
		/**
		 * 初始化技能列表
		 */		
		private function initSkills(str:String):Array
		{
			var skillsArray:Array = new Array();
			if(str == null || str == ""){
				return skillsArray;
			}
			var strArray:Array = str.split(",");
			for(var i:int = 0; i < strArray.length; i++){
				skillsArray.push(int(strArray[i]));
			}
			return skillsArray;
		}

	}
}