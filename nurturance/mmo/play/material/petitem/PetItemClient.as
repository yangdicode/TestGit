package mmo.play.material.petitem
{
	import flash.events.EventDispatcher;
	
	import mmo.framework.comm.ExtMessageClient;
	import mmo.play.petbreeding.PetBreedingClient;
	
	public class PetItemClient extends EventDispatcher
	{
		private static var _instance:PetItemClient;
		
		public static function get instance():PetItemClient
		{
			if(_instance == null)
			{
				_instance = new PetItemClient();
			}
			return _instance;
		}
		
		public function PetItemClient()
		{
		}
		
		public function getMyPetItem():void
		{
			PetBreedingClient.instance.getMyPetItems();
		}
		
		public function useMyPetItem(mid:int, upid:int, userName:String=null):void
		{
			if(userName == null)
			{
				PetBreedingClient.instance.usePetProp(upid, mid);
			}
			else
			{
				PetBreedingClient.instance.usePetPropForOthers(userName, upid, mid);
			}
		}
	}
}