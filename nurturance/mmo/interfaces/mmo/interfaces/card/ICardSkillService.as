package mmo.interfaces.card
{
	import mmo.interfaces.IService;
	
	public interface ICardSkillService extends IService
	{
		function showPanel(firstPanel:String):void;
	}
}