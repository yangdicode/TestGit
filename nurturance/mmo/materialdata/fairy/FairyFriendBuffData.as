package mmo.materialdata.fairy
{
	import mmo.framework.domain.fairy.FairyFriendBuff;
	import mmo.framework.domain.fairy.FairysType;
	import mmo.framework.domain.fairy.FairysUseType;

	public class FairyFriendBuffData
	{
		public function FairyFriendBuffData()
		{
		}
		/**
		 *"buffId":1, "isEndless":false, "round":3, "buffTypeId":1, "artId":1,为常用属性
		 * isEndless：永久持续 round ：持续回合（永久持续时可不配） buffTypeId：处理器类型 artId：美术图标类型
		 */		
		public static const extData:Object = {
			"1":{"buffId":1, "isEndless":false, "round":3, "buffTypeId":1, "artId":1, "forAll":true, "rate":0.5},
			"2":{"buffId":2, "isEndless":false, "round":2, "buffTypeId":2, "artId":2, "types":[FairysType.Fire], "rate":1.5},
			"3":{"buffId":3, "isEndless":false, "round":2, "buffTypeId":2, "artId":3, "types":[FairysType.Water], "rate":1.5},
			"4":{"buffId":4, "isEndless":false, "round":2, "buffTypeId":2, "artId":4, "types":[FairysType.Wood], "rate":1.5},
			"5":{"buffId":5, "isEndless":false, "round":2, "buffTypeId":2, "artId":5, "types":[FairysType.Light],  "rate":1.5},
			"6":{"buffId":6, "isEndless":false, "round":2, "buffTypeId":2, "artId":6, "types":[FairysType.Dark], "rate":1.5},
			"7":{"buffId":7, "isEndless":false, "round":3, "buffTypeId":1, "artId":1, "forAll":true, "rate":0.25},
			"8":{"buffId":8, "isEndless":false, "round":3, "buffTypeId":1, "artId":7, "types":[FairysType.Fire], "rate":0},
			"9":{"buffId":9, "isEndless":false, "round":3, "buffTypeId":1, "artId":8, "types":[FairysType.Wood], "rate":0},
			"10":{"buffId":10, "isEndless":false, "round":4, "buffTypeId":3, "artId":9, "rate":1.5},
			"11":{"buffId":11, "isEndless":false, "round":1, "buffTypeId":1, "artId":1, "forAll":true, "rate":0.25},
			"12":{"buffId":12, "isEndless":false, "round":3, "buffTypeId":4, "artId":10},
	
			"13":{"buffId":13, "isEndless":false, "round":1, "buffTypeId":2, "artId":3, "types":[FairysType.Water], "rate":2.5},
			"14":{"buffId":14, "isEndless":false, "round":1, "buffTypeId":2, "artId":5, "types":[FairysType.Light], "rate":2.5},
			"15":{"buffId":15, "isEndless":false, "round":1, "buffTypeId":2, "artId":6, "types":[FairysType.Dark], "rate":2.5},
		
			"16":{"buffId":16, "isEndless":false, "round":1, "buffTypeId":2, "artId":11, "useTypes":[FairysUseType.Recover], "rate":1.5},
			"17":{"buffId":17, "isEndless":false, "round":1, "buffTypeId":2, "artId":12, "useTypes":[FairysUseType.PhysicalPower], "rate":1.5},
			"18":{"buffId":18, "isEndless":false, "round":1, "buffTypeId":2, "artId":13, "useTypes":[FairysUseType.Attack], "rate":1.5},
			
			"19":{"buffId":19, "isEndless":false, "round":1, "buffTypeId":2, "artId":11, "useTypes":[FairysUseType.Recover], "rate":2},
			"20":{"buffId":20, "isEndless":false, "round":1, "buffTypeId":2, "artId":12, "useTypes":[FairysUseType.PhysicalPower], "rate":2},
			"21":{"buffId":21, "isEndless":false, "round":1, "buffTypeId":2, "artId":13, "useTypes":[FairysUseType.Attack], "rate":2},
			"22":{"buffId":22, "isEndless":false, "round":5, "buffTypeId":1, "artId":1, "forAll":true, "rate":0.5},
		
			"23":{"buffId":23, "isEndless":false, "round":1, "buffTypeId":2, "artId":14, "useTypes":[FairysUseType.Balance], "rate":1.5},
			"24":{"buffId":24, "isEndless":false, "round":1, "buffTypeId":2, "artId":15, "useTypes":[FairysUseType.Elite], "rate":1.5},
			
			"25":{"buffId":25, "isEndless":false, "round":1, "buffTypeId":1, "artId":1, "forAll":true, "rate":0},
			"26":{"buffId":26, "isEndless":false, "round":1, "buffTypeId":1, "artId":1, "forAll":true, "rate":0},
			
			"27":{"buffId":27, "isEndless":false, "round":1, "buffTypeId":2, "artId":16, "types":[FairysType.Wood, FairysType.Light], "rate":2},
			"28":{"buffId":28, "isEndless":false, "round":2, "buffTypeId":1, "artId":1, "forAll":true, "rate":0.4}
		};
		
		/**
		 * linesFormat表达式如下:
		 * "{0}": new FairyFriendBuff({0}, "{1}", "{2}", "{4}", extData[{0}]),
		 */		
		public static const data:Object = {
			"1": new FairyFriendBuff(1, "防御姿态", "受到伤害减少50%", "防御", extData[1]),
			"2": new FairyFriendBuff(2, "火之强化", "2回合内，火属性精灵的攻击力变为1.5倍", "攻击", extData[2]),
			"3": new FairyFriendBuff(3, "水之强化", "2回合内，水属性精灵的攻击力变为1.5倍", "攻击", extData[3]),
			"4": new FairyFriendBuff(4, "木之强化", "2回合内，木属性精灵的攻击力变为1.5倍", "攻击", extData[4]),
			"5": new FairyFriendBuff(5, "光之强化", "2回合内，光属性精灵的攻击力变为1.5倍", "攻击", extData[5]),
			"6": new FairyFriendBuff(6, "暗之强化", "2回合内，暗属性精灵的攻击力变为1.5倍", "攻击", extData[6]),
			"7": new FairyFriendBuff(7, "高等防御", "3回合内，受到伤害降低75%", "防御", extData[7]),
			"8": new FairyFriendBuff(8, "玲珑幻化术", "3回合内，火属性伤害完全无效", "防御", extData[8]),
			"9": new FairyFriendBuff(9, "南瓜烟雾", "3回合内，木属性伤害完全无效", "防御", extData[9]),
			"10": new FairyFriendBuff(10, "战女神的意志", "4回合内，队伍的回复力变为1.5倍", "回复", extData[10]),
			"11": new FairyFriendBuff(11, "大地神护", "1回合内，受到的所有伤害减少75%", "防御", extData[11]),
			"12": new FairyFriendBuff(12, "冰淇淋群攻", "3回合内，所有攻击转化为全体攻击", "全体攻击", extData[12]),			
			"13": new FairyFriendBuff(13, "碧水圣光", "1回合内，水属性精灵的攻击力变为2.5倍", "攻击", extData[13]),
			"14": new FairyFriendBuff(14, "烈阳圣光", "1回合内，光属性精灵的攻击力变为2.5倍", "攻击", extData[14]),
			"15": new FairyFriendBuff(15, "混沌圣光", "1回合内，暗属性精灵的攻击力变为2.5倍", "攻击", extData[15]),
		
			"16": new FairyFriendBuff(16, "白羊之印", "1回合内，回复类型精灵攻击力变为1.5倍", "攻击", extData[16]),
			"17": new FairyFriendBuff(17, "金牛之印", "1回合内，体力类型精灵攻击力变为1.5倍", "攻击", extData[17]),
		
			"18": new FairyFriendBuff(18, "摩羯之印", "1回合内，攻击类型精灵攻击力变为1.5倍", "攻击", extData[18]),
		
			"19": new FairyFriendBuff(19, "圣·白羊之印", "1回合内，回复类型精灵攻击力变为2倍", "攻击", extData[19]),
			"20": new FairyFriendBuff(20, "圣·金牛之印", "1回合内，体力类型精灵攻击力变为2倍", "攻击", extData[20]),
			"21": new FairyFriendBuff(21, "圣·摩羯之印", "1回合内，攻击类型精灵攻击力变为2倍", "攻击", extData[21]),
			"22": new FairyFriendBuff(22, "酷蛋之盾", "5回合内，受到所有伤害降低50%", "防御", extData[22]),
			
			"23": new FairyFriendBuff(23, "巨蟹之印", "1回合内，平衡类型精灵攻击力变为1.5倍", "攻击", extData[23]),
			"24": new FairyFriendBuff(24, "天蝎之印", "1回合内，精英类型精灵攻击力变为1.5倍", "攻击", extData[24]),
	
			"25": new FairyFriendBuff(25, "处女之印", "一回合内，受到伤害降低100%", "防御", extData[25]),
		
			"26": new FairyFriendBuff(26, "射手之印", "一回合内，受到伤害降低100%", "防御", extData[26]),
			"27": new FairyFriendBuff(27, "箭风诛杀", "一回合内，木属性和光属性精灵攻击力2倍", "攻击", extData[27]),
			"28": new FairyFriendBuff(28, "天付良缘", "2回合内受到的伤害降低60%", "防御", extData[28])
		};
		
		public static const buffTypeClassMap:Object = {
			//减伤加防 rate：按照字面把造成伤害乘以这个的倍率， "forAll":对全属性 "types":对某些属性
			"1":"mmo.fairybattle.buff.friendbuff.FairyFriendBuffDefenseUp",
			//加攻击 "types":属性, "useTypes":类型, "rate":攻击加成倍率
			"2":"mmo.fairybattle.buff.friendbuff.FairyFriendBuffAtkUp",
			//加回复力"rate":回复力加成倍率
			"3":"mmo.fairybattle.buff.friendbuff.FairyFriendBuffRecoverUp",
			//把单体攻击转化为群攻
			"4":"mmo.fairybattle.buff.friendbuff.FairyFriendBuffOneBeAllAtk"
		};
	}
}