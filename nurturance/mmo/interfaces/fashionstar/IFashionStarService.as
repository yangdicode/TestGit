package mmo.interfaces.fashionstar
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IFashionStarService extends IDownloadInitService
	{
		function enterFashionStar():void;
		
		function showVotePanel():void;
		
		function showUploadPanel():void;
		
		function showVoteByWorksId(worksId:int):void;
		
		function showBuyGift():void;
		
		function showAllGifts():void;
		
		function showAdvertise():void;
	}
}