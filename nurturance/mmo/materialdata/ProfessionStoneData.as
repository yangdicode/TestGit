package mmo.materialdata
{
	public class ProfessionStoneData
	{
		/**
		 * "GItemID" : {"职业ID","力量比例","智慧比例","体质比例","道德比例","敏捷比例"}
		 * 		
		 */	
/*		SELECT CONCAT('"',T.ItemId, '" : {"proId": ', T.ProId, ', "strengthRate": ', T.StrengthRate,
			' ,"intellectRate": ', T.IntellectRate, ', "staminaRate": ', T.StaminaRate,
			', "moralRate": ', T.MoralRate, ', "agilityRate": ', T.AgilityRate, '},') FROM aox1.ProfessionStone T*/
		public static const data:Object = {
			
			//exportData part begin

			"684" : {"proId": 2, "strengthRate": 25 ,"intellectRate": 10, "staminaRate": 20, "moralRate": 20, "agilityRate": 25},
			"685" : {"proId": 3, "strengthRate": 35 ,"intellectRate": 5, "staminaRate": 20, "moralRate": 20, "agilityRate": 20},
			"683" : {"proId": 4, "strengthRate": 5 ,"intellectRate": 35, "staminaRate": 20, "moralRate": 20, "agilityRate": 20},
			"689" : {"proId": 5, "strengthRate": 29 ,"intellectRate": 6, "staminaRate": 18, "moralRate": 17, "agilityRate": 30},
			"688" : {"proId": 6, "strengthRate": 10 ,"intellectRate": 18, "staminaRate": 23, "moralRate": 21, "agilityRate": 28},
			"690" : {"proId": 7, "strengthRate": 25 ,"intellectRate": 10, "staminaRate": 25, "moralRate": 25, "agilityRate": 15},
			"691" : {"proId": 8, "strengthRate": 35 ,"intellectRate": 5, "staminaRate": 22, "moralRate": 18, "agilityRate": 20},
			"687" : {"proId": 9, "strengthRate": 5 ,"intellectRate": 45, "staminaRate": 18, "moralRate": 17, "agilityRate": 15},
			"686" : {"proId": 10, "strengthRate": 5 ,"intellectRate": 36, "staminaRate": 21, "moralRate": 18, "agilityRate": 20},
			"657" : {"proId": 11, "strengthRate": 5 ,"intellectRate": 35, "staminaRate": 25, "moralRate": 15, "agilityRate": 20},
			"692" : {"proId": 12, "strengthRate": 35 ,"intellectRate": 5, "staminaRate": 17, "moralRate": 13, "agilityRate": 30},
			"722" : {"proId": 13, "strengthRate": 28 ,"intellectRate": 10, "staminaRate": 22, "moralRate": 12, "agilityRate": 28},
			"755" : {"proId": 14, "strengthRate": 25 ,"intellectRate": 20, "staminaRate": 20, "moralRate": 15, "agilityRate": 20},
			"776" : {"proId": 15, "strengthRate": 5 ,"intellectRate": 40, "staminaRate": 25, "moralRate": 14, "agilityRate": 16},
			"856" : {"proId": 16, "strengthRate": 10 ,"intellectRate": 10, "staminaRate": 25, "moralRate": 25, "agilityRate": 30},
			"873" : {"proId": 17, "strengthRate": 38 ,"intellectRate": 7, "staminaRate": 25, "moralRate": 10, "agilityRate": 20},
			"939" : {"proId": 18, "strengthRate": 5 ,"intellectRate": 32, "staminaRate": 25, "moralRate": 13, "agilityRate": 25},
			"1047" : {"proId": 19, "strengthRate": 28 ,"intellectRate": 22, "staminaRate": 25, "moralRate": 10, "agilityRate": 15},
			"1262" : {"proId": 20, "strengthRate": 5 ,"intellectRate": 25, "staminaRate": 23, "moralRate": 27, "agilityRate": 20}

			//exportData part end
			
		} 
			
		public function ProfessionStoneData()
		{
		}
	}
}
