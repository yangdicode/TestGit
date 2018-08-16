package mmo.interfaces.divinebless
{
	import mmo.interfaces.IInitService;

	public interface IDivineBlessService extends IInitService
	{
		function startDivine():void;
		
		function enterDivineHouse():void;
		
		function enterDivineStore():void;
	}
}