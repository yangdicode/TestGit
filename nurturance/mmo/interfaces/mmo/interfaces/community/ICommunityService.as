package mmo.interfaces.community
{
	import flash.display.MovieClip;
	
	import mmo.framework.domain.material.gitem.UserGItem;
	import mmo.interfaces.IInitService;
	import mmo.loader.scheduler.ResStorageType;
	
	public interface ICommunityService extends IInitService
	{
				
		//显示奥雅密语兑换功能
		function showAcFunGiftPanel():void;
		
		//显示舞会宣传面板
		function showDancePoster(poster:MovieClip):void;
		
		/**
		 * 显示运营活动的宣传台子或牌子 
		 * @param stageMC 台子或牌子的元件
		 * 
		 */		
		function showCommonStage(stageMC:MovieClip):void;
		/**
		 * 用户开始打工 
		 * @param workPlaceKey		打工点的Key
		 * @param time				打工的时间，毫秒为单位
		 * @param succFunc			成功回调函数
		 * @param failFunc			失败回调函数
		 * 
		 */		
		function startMyWork(workPlaceKey:String, time:int, succFunc:Function = null, failFunc:Function = null):void;
		
		/**
		 * 取消当前场景的某项打工
		 * @param workPlaceKey		该项打工的key，若传入Key为null则读取人物身上的WorkerVarKey用户变量
		 * 
		 */	
		function cancelMyWork(workPlaceKey:String = null):void;
		
		/**
		 * 当前用户开始某项行动（头上冒图标）
		 */
		function setMyState(state:String):void;
		
		/**
		 * 结束当前用户某项行动（头上冒图标）
		 */
		function removeMyState(state:String):void;
				
			
		function showStuffMap():void;
			
		/**
		 * 成长指南
		 */
		function openLevelUpGuide():void;
		
		/**
		 * 贝洛指引
		 */
		function showBeiLuoGuide(page:int):void;
		
		/**
		 * 奥雅指南
		 */
		function showAoyaGuide():void;
		
		/**
		 * 显示头上广播类 
		 * @param castType  显示类型 BroadCastType
		 * @param castMsg	显示文字
		 * @param clickFuc  点击文字回调函数
		 * @param isFirst   是否优先显示
		 */		
		function showBroadCast(castType:String,castMsg:String,clickFuc:Function = null,isFirst:Boolean = false):void
			
		/**
		 * 谍影重重任务接取点
		 */		
		function startFightSpy():void
		
		/**
		 * 谍影重重面板弹出 
		 */		
		function showSpyPanel():void
			
		/** 
		 * 处理洗点药方法
		 */			
		function handlePropChangeItem(userGItem:UserGItem):void
				
		/**
		 * 处理宝箱的接口，以后关于宝箱物品点击处理都可以用这个。 
		 * 
		 */			
		function handleTreasureBox(userGItem:UserGItem):void;
							 		 
		 /**
		  * 获取某个key的缓存用户运营活动数据
		  * @param key:CommunityInfoKey里面的某个key
		  * @defaultValue:后端没有key的时候返回的默认值，有时候需要区分无值跟0；
		  * @return key对应数值
		  */
		 function getCommunityDataByKey( key:String, defaultValue:int=0):int;
		
		 /**
		  * 获取某个key的缓存用户运营活动数据
		  * @param key:CommunityInfoKey里面的某个key
		  * @param callBack:回调函数
		  */
		 function getCommunityDataByKeyCallback( key:String, callBack:Function, callBackArgArray:Array = null ):void;
		 
		 /**
		 * 主动更新特殊缓存数据
		 */
		 function updateCommunityDataByKey(keys:Array, callBack:Function):void;
		 
		 /**
		  * 获取用户运营活动数据，直接向服务端取。
		  * (慎用！此方法仅适用数据被别人改变的情况.)
		  */			
		 function getCommunityDataFromServer( key:String, callBack:Function, callBackArgArray:Array = null ):void;
		 			 		 
		 /**
		  * 卡夫兑换
		  */		 
		 function showKafuExchange():void;
		 function showKafuInfo():void;
		 
		 /** 
		  * 处理职业洗点石方法
		  */	
		 function handleProfessionStone(userGItem:UserGItem):void;
		 		 		 
		 function showThreeTailCatPanel():void;
		 
		 /**
		  * 鲜花抽奖
		  */		 
		 function showFlowerLottery():void;
		 
		 /**
		  * 弹出热点活动面板 	共用接口
		  */		 
		 function showCommonPanel(key:String = "", params:* = null):void;
		 /**
		  * 弹出热点活动兑换面板 	共用接口
		  * key必须要全部小写
		  */		 
		 function showCommonExchangePanel(key:String = "common", params:* = null):void;
		 
		 /** 游戏王面板 **/
		 function showKingGamePanel():void;
		 		 
		 /**
		  * 显示知了提问面板
		  */		 
		 function showZhiLiaoQuizPanel():void;
			 
		 /**
		 * 显示今日可做之事面板
		 * */
		 function showTodayWorkPanel():void;
		 
		 /**		  
		  * 显示点击猫之后相应的面板 固定猫接口，相应内容内部更新
		  */		 
		 function showClickCatPanel():void;
		 
		 /**
		  * 为了避免CommunityDocService越来越大，尝试将代码绑回各自业务，只由CommunityDocService调用。
		  * 构造函数必定会调用，callFunctionName为空则不调用callBack。
		  * @param callFunctionName 要执行的方法名String类型
		  * @param params 参数
		  */		 
		 function loadFileAndExecute(fileName:String, className:String, callFunctionName:String = "", params:Array = null, resStorageType:ResStorageType = null):void;
		
	}
}