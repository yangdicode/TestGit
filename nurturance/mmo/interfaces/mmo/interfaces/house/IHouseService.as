package mmo.interfaces.house
{
	import mmo.framework.domain.house.HouseInfo;
	import mmo.interfaces.IInitService;
		
	/**
	 * 小屋展示服务 
	 * @author hekehui
	 * 
	 */
	public interface IHouseService extends IInitService
	{
		/**
		 * 进入小屋, 不传表示自己的小屋
		 * */
		function enterHouse(houseOwner:String = null):void;
		function showVistorsPanel(owner:String):void;
		function get currentHouseInfo():HouseInfo;
		function get houseSceneName():String;
		function get isInGarden():Boolean;
		
		
		
		//----------内部功能
		//线上不会用到
		//重构的时候假如因为这里碰到麻烦请果断删掉。
		
		
		/**
		 * 通过scene1的接口进入一个假的房间，用于截取花园具体的样子。 
		 * @param houseData			房间摆设数据。
		 */
		function enterFakeHouse(houseData:String):void;
	}
}