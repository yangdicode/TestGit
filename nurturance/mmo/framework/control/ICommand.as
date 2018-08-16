package mmo.framework.control
{
	public interface ICommand
	{
		/**
		 * control的核心
		 * 无状态的行为封状类, 主要负责前端复杂的流程封装, 
		 * 它并不包含业务逻辑的处理(后者放在后端以及model中)
		 * 用到的context需要从参数中传入
		 * 某些ioc框架提供了根据元数据注入的方式, 暂不引进
		 * 
		 * */
		function execute(evt:*):void
	}
}