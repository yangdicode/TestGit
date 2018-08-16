package mmo.interfaces.materialschange
{
	import mmo.framework.domain.materialschange.MaterialsChange;
	import mmo.interfaces.IInitService;
	
	public interface IMaterialsChangeService extends IInitService
	{
		function getMaterialsChange():MaterialsChange;
		function getMaterialsChangeByTypes(types:Array):MaterialsChange;
	}
}