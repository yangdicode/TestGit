package mmo.materialdata.fairy
{
	import mmo.framework.domain.fairy.FairyEnemyBuff;

	public class FairyEnemyBuffData
	{
		public function FairyEnemyBuffData()
		{
		}
		/**
		 *"buffId":1, "isEndless":false, "round":3, "buffTypeId":1, "artId":1,为常用属性
		 * isEndless：永久持续 round ：持续回合（永久持续时可不配） buffTypeId：处理器类型 artId：美术图标类型
		 */		
		public static const extData:Object = {
			"1":{"buffId":1, "isEndless":false, "round":5, "buffTypeId":1, "artId":1, "rate":0.5},
			"2":{"buffId":2, "isEndless":true, "buffTypeId":2, "artId":2, "rate":2},
			"3":{"buffId":3, "isEndless":true, "buffTypeId":2, "artId":2, "rate":5},
			"4":{"buffId":4, "isEndless":true, "buffTypeId":3, "artId":3, "damage":2530},
			"5":{"buffId":5, "isEndless":false, "round":3, "buffTypeId":1, "artId":1, "rate":0},
			"6":{"buffId":6, "isEndless":true, "buffTypeId":3, "artId":3, "damage":3320},
			"7":{"buffId":7, "isEndless":true, "buffTypeId":3, "artId":3, "damage":3900},
			"8":{"buffId":8, "isEndless":true, "buffTypeId":3, "artId":3, "damage":5800},
			"9":{"buffId":9, "isEndless":true, "buffTypeId":3, "artId":3, "damage":16000},
			"10":{"buffId":10, "isEndless":true, "buffTypeId":3, "artId":3, "damage":20000},
			"11":{"buffId":11, "isEndless":true, "buffTypeId":3, "artId":3, "damage":23081},
			"12":{"buffId":12, "isEndless":true, "buffTypeId":3, "artId":3, "damage":3550},
			"13":{"buffId":13, "isEndless":true, "buffTypeId":3, "artId":3, "damage":7000},
			"14":{"buffId":14, "isEndless":true, "buffTypeId":3, "artId":3, "damage":5100},
			"15":{"buffId":15, "isEndless":true, "buffTypeId":3, "artId":3, "damage":5000},
			"16":{"buffId":16, "isEndless":true, "buffTypeId":3, "artId":3, "damage":13000},
			"17":{"buffId":17, "isEndless":true, "buffTypeId":3, "artId":3, "damage":15000},
			"18":{"buffId":18, "isEndless":true, "buffTypeId":3, "artId":3, "damage":12000},
			"19":{"buffId":19, "isEndless":true, "buffTypeId":3, "artId":3, "damage":7500},
			"20":{"buffId":20, "isEndless":true, "buffTypeId":3, "artId":3, "damage":11500},
			"21":{"buffId":21, "isEndless":true, "buffTypeId":3, "artId":3, "damage":11500},
			"22":{"buffId":22, "isEndless":false, "round":1, "buffTypeId":1, "artId":1, "rate":0.5}
		};
		
		/**
		 * linesFormat表达式如下:
		 * "{0}": new FairyEnemyBuff({0}, "{1}", "{2}", "{4}", extData[{0}]),
		 */		
		public static const data:Object = {
			"1": new FairyEnemyBuff(1, "护甲损坏", "5回合内，所有敌人的防御力减少50%", "破防", extData[1]),
			"2": new FairyEnemyBuff(2, "毒", "中毒，直至死亡", "毒", extData[2]),
			"3": new FairyEnemyBuff(3, "剧毒", "中剧毒，直至死亡", "毒", extData[3]),
			"4": new FairyEnemyBuff(4, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[4]),
			"5": new FairyEnemyBuff(5, "护甲破碎", "3回合内，所有敌人的防御力减少100%", "破防", extData[5]),
			"6": new FairyEnemyBuff(6, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[6]),
			"7": new FairyEnemyBuff(7, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[7]),
			"8": new FairyEnemyBuff(8, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[8]),
			"9": new FairyEnemyBuff(9, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[9]),
			"10": new FairyEnemyBuff(10, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[10]),
			"11": new FairyEnemyBuff(11, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[11]),
			"12": new FairyEnemyBuff(12, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[12]),
			"13": new FairyEnemyBuff(13, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[13]),
			"14": new FairyEnemyBuff(14, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[14]),
			"15": new FairyEnemyBuff(15, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[15]),
			"16": new FairyEnemyBuff(16, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[16]),
			"17": new FairyEnemyBuff(17, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[17]),
			"18": new FairyEnemyBuff(18, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[18]),
			"19": new FairyEnemyBuff(19, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[19]),
			"20": new FairyEnemyBuff(20, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[20]),
			"21": new FairyEnemyBuff(21, "蓄力", "蓄力状态，下次行动发动强力攻击", "蓄力", extData[21]),
			"22": new FairyEnemyBuff(22, "霸", "1回合内，所有敌人的防御力减少50%", "破防", extData[1])
		};
		
		public static const buffTypeClassMap:Object = {
			//破防 "rate":破防百分比
			"1":"mmo.fairybattle.buff.enemybuff.FairyEnemyBreakDefBuff",
			//中毒 "rate":造成施放单位攻击力多少倍的中毒伤害
			"2":"mmo.fairybattle.buff.enemybuff.FairyEnemyPoisonBuff",
			//蓄力 "damage":蓄力攻击的伤害
			"3":"mmo.fairybattle.buff.enemybuff.FairyEnemyChangeAtkBuff"
		};
	}
}