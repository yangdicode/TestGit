package mmo.interfaces.course
{
	import mmo.framework.domain.course.Course;
	import mmo.interfaces.IService;

	public interface ICourseService extends IService
	{
		/**
		 * 获取课程定义
		 */		
		function getCourseData(courseId:int):Course
		
		/**
		 * 根据类型Id取得课程数据
		 */		
		function getCourseByType(typeId:int,isShowCanLearn:Boolean=true):Array		
			
		/**
		 * 显示学习课程面板
		 */
		function showCoursePanel(courseType:int,groupType:int):void
			
		/**
		 * 显示用户课程面板
		 */	
		function showUserCoursePanel():void
			
		/**
		 * 获得课程剩余次数 
		 * 课程类型type: CourseMainType
		 * 回调函数 func(cTime:int):void
		 */
		function getCourseTimes(type:int,fuc:Function):void;
		
		/**
		 * 显示新的课程学习面版
		 */		
		function showAttrCoursePanel():void
	}
}