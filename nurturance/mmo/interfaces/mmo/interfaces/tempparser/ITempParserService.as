package mmo.interfaces.tempparser
{
	import mmo.common.OrderedObject;
	import mmo.interfaces.IDownloadInitService;
	
	public interface ITempParserService extends IDownloadInitService
	{
		function getTempParse(xml:XML):OrderedObject;
	}
}