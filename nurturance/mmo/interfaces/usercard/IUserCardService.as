package  mmo.interfaces.usercard
{
	import flash.display.DisplayObject;
	
	import mmo.interfaces.IInitService;
	import mmo.interfaces.IService;

	public interface IUserCardService extends IInitService
	{
		/**
		 * 显示用户拥有的宠物蛋
		 */		
		function showUserPetEgg(x:Number = 0, y:Number = 0):void;
		 /**
		 *显示用户拥有的宠物幼崽和宠物蛋 
		 * */
		function showUserPetAndEgg(x:Number = 0, y:Number = 0):void;
		/**
		 * 显示用户背包信息
		 * 在  UserCardPages
		 */		
		function showUserBag(pageName:String = ""):void;
		
		/**
		 * 显示用户养成属性
		 * 在  UserCardPages
		 * */
		function showUserProp(pageName:String = ""):void;
		
		/**
		 * 显示其他用户属性信息
		 * 在  UserCardPages
		 * */
		function showOtherUserProp(userName:String, pageName:String = ""):void;
		
		/**
		 * 锁住个人属性面板的弹出。
		 * 主要是交互中使用 
		 */
		function lockUserProp():void;
			
		/**
		 * 解锁个人属性面板的弹出。
		 * 主要是交互中使用 
		 */
		function unLockUserProp():void;
		
		/**
		 * 显示用户拥有的鲜花
		 */		
		function showUserFlower(x:Number = 0, y:Number = 0):void;
		
		/**
		 * 衣服页
		 * @params catalogs : 要显示的物品类型，参数必须为双数：(title:String),(catalog:int/Array)...
		 * @return view用于关闭
		 * @needClose 点击物品后需要关闭
		 */		
		function showClothesBag(x:Number = 0, y:Number = 0, dispatcherClick:Boolean = false, catalogs:Array = null, afterCloseFun:Function = null, needClose:Boolean = true):DisplayObject;
		
		/**
		 *	购买TA的衣服 
		 * @param userName 用户名
		 * 
		 */		
		function showBuyClothesPanel(userName:String):void;
		
		function tryCloseBag(bagName:String):void;
		
		/**
		 * 
		 * 打开形象卡，与默认有关
		 */
		function showUserBagWithDefault(userName:String, pageName:String = ""):void;
		
		
		function showDoubleUserCard(userName:String):void;
		
	}
}