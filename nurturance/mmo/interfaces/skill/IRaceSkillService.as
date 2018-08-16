package mmo.interfaces.skill
{
	/**
	 * 种族技能基础接口
	 * @author liyawei
	 */	
	import flash.display.MovieClip;
	
	import mmo.framework.domain.skill.base.RacePhase;
	import mmo.framework.domain.skill.base.RaceSkill;
	import mmo.framework.domain.skill.base.UserRaceSkillData;
	import mmo.interfaces.IService;
	
	public interface IRaceSkillService extends IService
	{
		/**
		 * 获取技能定义
		 * @params skillId
		 * */
		function getSkillData(skillId:int):RaceSkill
		
		/**
		 * 获取用户可以学习的技能
		 * @param showLearn 是否显示可学的，否的话显示全部
		 * @param type 显示固定类别。默认all显示全部
		 */		
		function getLearnSkills(showLearn:Boolean = false,type:String = "all"):Array
		
		/**
		 * 是否可以学习该技能
		 */	
		function isCanLearnSkill(skillId:int):Boolean	
		
		/**
		 * 学习种族技能
		 * @params skillId
		 * */
		function learnSkill(skillId:int):void
		
		/**
		 * 获取已经学会的制作技能 
		 * @param type
		 */			
		function getMakeSkills(type:String = "all"):Array
		
		/**
		 * 使用种族技能
		 * @params skillId
		 * */
		function useSkill(skillId:int,num:int = 1):void
		
		/**
		 * 获取用户技能数据,通过回调函数返回
		 * @return fuc(UserRaceSkillData)
		 */
		function getUserSkillData(fuc:Function):void
		
		/**
		 * 显示种族技能学习面板
		 */		
		function showLearnPanel():void
		
		/**
		 * 显示种族制作面板
		 */		
		function showMakePanel():void
			
		/**
		 * 设置图标Tips显示内容 
		 */		
		function setTipsInfo(tip:MovieClip,raceSkill:RaceSkill):void
		
		/**
		 * 种族技能最高阶段
		 */			
		function getMaxPhase():int
		
		/**
		 * 获得阶段提升数据 
		 */		
		function getPhaseData(phaseId:int):RacePhase
			
		/**
		 * 显示阶段提升面板 
		 */
		function showPhaseUpPanel():void;
		
		/**
		 * 无验证向服务端发送阶段提升命令，慎用，除了特殊面板
		 */
		function racePhaseUp():void
	}
}