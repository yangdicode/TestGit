package mmo.framework.domain.plant
{
	public class PlantGrowPhase
	{
		public function PlantGrowPhase()
		{
		}
		
		/** 幼苗 */
		public static const Seed:int = 1;
		
		/** 叶子 */
		public static const Leaf:int = 2;
		
		/** 成熟 */
		public static const Mature:int = 3;
		
		public static const Grow_Desc:Object = {"1":"幼苗", "2":"叶子", "3":"成熟", "4":"变异"};
		
		public static function getPlantGrowPhase(growRate:int):int
		{
			if (growRate >= 0 && growRate <= 49)
			{
				return 1;
			}
			else if (growRate >= 50 && growRate <= 99)
			{
				return 2;
			}
			else
			{
				return 3;
			}
		}
	}
}