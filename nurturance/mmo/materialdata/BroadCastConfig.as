package mmo.materialdata
{
	import mmo.framework.domain.broadcast.BroadCastType;

	/**
	 * 运营广播配置类
	 * @author liyawei
	 */	
	
	public class BroadCastConfig
	{
		public function BroadCastConfig()
		{
		}
		
		public static const config:Array = 
		[
			{"type":BroadCastType.Task,"version":"1","msg":"世上另一个“我”！曾经感情很好的双子姐弟，究竟是因为什么原因而关系变差呢？"},
			{"type":BroadCastType.ReDian,"version":"1","msg":"紧急！双子危机？让吵架的夏希和夏纪和好吧！还有机会获得套装奖励哦！"},
			{"type":BroadCastType.ReDian,"version":"1","msg":"月下清辉 雪奈尔冬季发布会！预购服装立即获得珍藏礼盒，梦幻商业街约定你！"},
			{"type":BroadCastType.ReDian,"version":"1","msg":"奇迹珍品 首发收集有礼！收集齐珍品赠送大屏背景卡，快来梦幻商业街看看吧！"}
		];
	}
}



