package mmo.interfaces.garden
{
	import mmo.interfaces.garden.event.GardenDataEvent;
	import mmo.interfaces.garden.event.GardenInteractEvent;
	import mmo.interfaces.garden.event.GardenServiceEvent;
	import mmo.interfaces.garden.gardenplant.IGardenPlantService;
	import mmo.interfaces.garden.gardenui.IGardenControlBar;
	import mmo.interfaces.garden.gardenui.IGardenUIService;

	public class CompileGarden
	{
		public function CompileGarden()
		{
		}
		
		public static function compileMe(){
			var d1:IGardenDataService;
			var d2:IGardenInteract;
			var d3:IGardenService;
			var d4:IGardenUIService;
			var d5:IGardenPlantService;
			var d6:GardenDataEvent;
			var d7:GardenInteractEvent;
			var d8:GardenServiceEvent;
			var d9:IGardenControlBar;
		}
	}
}