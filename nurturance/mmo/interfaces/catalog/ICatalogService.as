package mmo.interfaces.catalog
{
	import mmo.interfaces.IService;
	
	public interface ICatalogService extends IService
	{
		/**
		 * 显示catalogNo对应的册子
		 */	
		function showCatalog(catalogNo:String,hasCover:Boolean = true,defaultPage:int = 0):void
			
	}
}