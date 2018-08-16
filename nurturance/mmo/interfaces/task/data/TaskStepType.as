package mmo.interfaces.task.data
{

	public class TaskStepType
	{
		//和客户端有关的任务类型
		/**
		 * 纯客户端类型，触发即完成，不验证
		 * */
		public static const CLIENT:int = 1;
		
		/**
		 * 战斗类型(杀死某只怪之类的)
		 * */
		public static const FIGHTER:int = 2
		
		/**
		 * 收集品收集
		 * */
		public static const GATHER:int = 3;
		
		/**
		 * 进入场景触发
		 * */
		public static const ENTER_SCENE = 4;
		
		public function TaskStepType()
		{
		}
	}
}