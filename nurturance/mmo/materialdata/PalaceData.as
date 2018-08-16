package mmo.materialdata
{
	import mmo.framework.domain.palace.PalaceCrown;
	import mmo.framework.domain.palace.PalaceCrownLevel;
	import mmo.framework.domain.palace.PalaceLevel;

	public class PalaceData
	{
		public function PalaceData()
		{
		}
		
		/**
		 * new PalaceLevel({0}, {1}, {2}, {3}),
		 */
		public static const Levels:Array = 
			[
				new PalaceLevel(1, 0, 50, 5),
				new PalaceLevel(2, 1001, 80, 10),
				new PalaceLevel(3, 1701, 120, 20),
				new PalaceLevel(4, 3501, 180, 25),
				new PalaceLevel(5, 5501, 300, 30),
				new PalaceLevel(6, 10501, 350, 35),
				new PalaceLevel(7, 15501, 380, 38)
			];
		
		/**
		 * "{0}":new PalaceCrown({0}, {1}, {2}, "{3}"),
		 */
		public static const Crowns:Object = 
			{
				"1":new PalaceCrown(1, 7720, "辉夜琉璃冠"),
				"2":new PalaceCrown(2, 8406, "大魔法师神冕"),
				"3":new PalaceCrown(3, 8843, "幻影血裔王冠"),
				"4":new PalaceCrown(4, 9369, "苏菲亚智慧神冠")
			};
		
		/**
		 * "{0}_{1}":new PalaceCrownLevel({0}, {1}, {4}, {3}),
		 */
		public static const CrownLevels:Object = 
			{
				"1_1":new PalaceCrownLevel(1, 1, 500, 7660),
				"1_2":new PalaceCrownLevel(1, 2, 1000, 7661),
				"1_3":new PalaceCrownLevel(1, 3, 1500, 7662),
				"1_4":new PalaceCrownLevel(1, 4, 2400, 7815),
				"1_5":new PalaceCrownLevel(1, 5, 3200, 7816),
				"1_6":new PalaceCrownLevel(1, 6, 4000, 7817),
				"2_1":new PalaceCrownLevel(2, 1, 500, 8435),
				"2_2":new PalaceCrownLevel(2, 2, 1000, 8436),
				"2_3":new PalaceCrownLevel(2, 3, 1500, 8437),
				"2_4":new PalaceCrownLevel(2, 4, 2400, 8438),
				"2_5":new PalaceCrownLevel(2, 5, 3200, 8439),
				"2_6":new PalaceCrownLevel(2, 6, 4000, 8440),
				"3_1":new PalaceCrownLevel(3, 1, 500, 9066),
				"3_2":new PalaceCrownLevel(3, 2, 1000, 9067),
				"3_3":new PalaceCrownLevel(3, 3, 1500, 9068),
				"3_4":new PalaceCrownLevel(3, 4, 2400, 9069),
				"3_5":new PalaceCrownLevel(3, 5, 3200, 9070),
				"3_6":new PalaceCrownLevel(3, 6, 4000, 9071),
				"4_1":new PalaceCrownLevel(4, 1, 500, 9366),
				"4_2":new PalaceCrownLevel(4, 2, 1000, 9367),
				"4_3":new PalaceCrownLevel(4, 3, 1500, 9368),
				"4_4":new PalaceCrownLevel(4, 4, 2400, 9369),
				"4_5":new PalaceCrownLevel(4, 5, 3200, 9370),
				"4_6":new PalaceCrownLevel(4, 6, 4000, 9371)
			};
	}
}