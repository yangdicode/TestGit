package mmo.interfaces.magicfairytale
{
	import mmo.interfaces.IDownloadInitService;

	public interface IMagicFairytaleService extends IDownloadInitService
	{
		function debugMagicFairytale():void;
		
		/** 童话国度  */
		function showStoryEntrance():void;
		
		/** 竞技的木马  */
		function competitionHorse():void;
		
		/** 王子基地  */
		function princeBase():void;
		
		/** 王子礼物  */
		function princeGift():void;
		
		/** 八卦摩天轮  */
		function ferrisWheel():void;
		
		/** 0首次进入场景新手动画指引 **/
		function startSceneNewHand():void;
	}
}