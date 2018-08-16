package mmo.materialdata
{
	import mmo.framework.domain.battleitem.BattleItem;

	/**
	 * 
	 *  "{0}":new BattleItem({0}, "{1}", 300, {4}, {5}, 0, 0, "{2}", "{6}", "{3}", {7}),   	
	 */	
	public class BattleItemsData
	{
		public static const data:Object = {

			//exportData part begin

			"1":new BattleItem(1, "菠萝面包", 300, 80, 16, 0, 0, "菠萝味的面包，好吃又实惠。使用恢复50点HP。", "HpMp", "Scene", <r><hp min="50"/></r>),
			"2":new BattleItem(2, "火腿三明治", 300, 120, 24, 0, 0, "夹着大片火腿的面包。使用恢复80点HP。", "HpMp", "Scene", <r><hp min="80"/></r>),
			"3":new BattleItem(3, "千层蛋糕", 300, 180, 36, 0, 0, "华丽的蛋糕。使用恢复150点HP。", "HpMp", "Scene", <r><hp min="150"/></r>),
			"4":new BattleItem(4, "生命恢复糖", 300, 250, 50, 0, 0, "浓缩了生命精华的糖果。使用恢复220点HP。", "HpMp", "Scene", <r><hp min="220"/></r>),
			"5":new BattleItem(5, "水晶糕", 300, 180, 36, 0, 0, "晶莹剔透的糕点。使用恢复200点HP（限战斗外）。", "HpMp", "Scene", <r><hp min="200"/></r>),
			"6":new BattleItem(6, "饭团套餐", 300, 250, 50, 0, 0, "饭团组合，露营时的最佳选择。使用恢复350点HP（限战斗外）。", "HpMp", "Scene", <r><hp min="350"/></r>),
			"7":new BattleItem(7, "开心乐园餐", 300, 360, 72, 0, 0, "深受孩子们喜爱的套餐。使用恢复500点HP（限战斗外）。", "HpMp", "Scene", <r><hp min="500"/></r>),
			"8":new BattleItem(8, "神圣药水", 300, 0, 0, 0, 0, "饱含奥雅之光能量的药水。使用HP全回复（限战斗外）。", "HpMp", "Scene", <r><hp min="100000000"/></r>),
			"9":new BattleItem(9, "柠檬茶", 300, 30, 6, 0, 0, "大众化的饮料，止渴又解暑。使用恢复30点HP。", "HpMp", "Scene", <r><hp min="30"/></r>),
			"10":new BattleItem(10, "鲜榨果汁", 300, 60, 12, 0, 0, "新鲜的水果榨制的饮料，有美容的效果。使用恢复40点HP。", "HpMp", "Scene", <r><hp min="40"/></r>),
			"11":new BattleItem(11, "缤纷蔬果茶", 300, 90, 18, 0, 0, "营养好喝的健康饮料。使用恢复70点HP。", "HpMp", "Scene", <r><hp min="70"/></r>),
			"12":new BattleItem(12, "小恢复糖", 300, 120, 24, 0, 0, "浓缩了精华的小糖果。使用恢复80点HP。", "HpMp", "Scene", <r><hp min="80"/></r>),
			"13":new BattleItem(13, "蜜桃果冻", 300, 180, 20, 0, 0, "蜜桃味的果冻。使用恢复200点HP（限战斗外）。", "HpMp", "Scene", <r><hp min="200"/></r>),
			"14":new BattleItem(14, "蔬菜沙拉", 300, 250, 32, 0, 0, "蔬菜沙拉。使用恢复350点HP（限战斗外）。", "HpMp", "Scene", <r><hp min="350"/></r>),
			"15":new BattleItem(15, "能量圣水", 300, 360, 64, 0, 0, "饱含神圣力量的泉水。使用恢复500点HP（限战斗外）。", "HpMp", "Scene", <r><hp min="500"/></r>),
			"16":new BattleItem(16, "圣魔药水", 300, 0, 0, 0, 0, "受到女神祝福的药水。使用HP全回复（限战斗外）。", "HpMp", "Scene", <r><hp min="100000000"/></r>),
			"17":new BattleItem(17, "草莓月饼", 300, 120, 24, 0, 0, "草莓馅儿的水果月饼，女孩子们比较喜欢。使用回复120点HP。", "HpMp", "Scene", <r><hp min="120"/></r>),
			"18":new BattleItem(18, "蓝莓月饼", 300, 60, 12, 0, 0, "蓝莓馅儿的水果月饼，据说有美容养颜的功效。使用回复80点HP。", "HpMp", "Scene", <r><hp min="80"/></r>),
			"19":new BattleItem(19, "浓缩糖果", 300, 360, 70, 0, 0, "浓缩了各种营养的糖果。使用回复350点HP。", "HpMp", "Scene", <r><hp min="350"/></r>),
			"20":new BattleItem(20, "伢牙乐草莓王", 300, 0, 0, 0, 0, "伢牙乐亲亲草莓，有营养，好味道！回复50%生命值，最少回复350点。", "HpMp", "Scene", <r><hp min="350" rate="0.5"/></r>),
			"21":new BattleItem(21, "伢牙乐芒果王", 300, 0, 0, 0, 0, "伢牙乐抱抱芒果，有营养，好味道！回复50%生命值，最少回复350点。", "HpMp", "Scene", <r><hp min="350" rate="0.5"/></r>),
			"22":new BattleItem(22, "生命凝露（小）", 300, 0, 0, 0, 0, "下一场战斗自身受到物理伤害降低15%，竞技场不可用", "Buff", "Scene", <r><buff id="255" params="x=0.15"/></r>),
			"23":new BattleItem(23, "魔力凝露（小）", 300, 0, 0, 0, 0, "下一场战斗自身受到魔法伤害降低15%，竞技场不可用", "Buff", "Scene", <r><buff id="256" params="x=0.15"/></r>),
			"24":new BattleItem(24, "光之凝露（小）", 300, 0, 0, 0, 0, "下一场战斗自身受到所有伤害降低10%，竞技场不可用", "Buff", "Scene", <r><buff id="257" params="x=0.1"/></r>),
			"25":new BattleItem(25, "生命凝露（中）", 300, 0, 0, 0, 0, "下一场战斗自身受到物理伤害降低20%，竞技场不可用", "Buff", "Scene", <r><buff id="255" params="x=0.2"/></r>),
			"26":new BattleItem(26, "魔力凝露（中）", 300, 0, 0, 0, 0, "下一场战斗自身受到魔法伤害降低20%，竞技场不可用", "Buff", "Scene", <r><buff id="256" params="x=0.2"/></r>),
			"27":new BattleItem(27, "光之凝露（中）", 300, 0, 0, 0, 0, "下一场战斗自身受到所有伤害降低15%，竞技场不可用", "Buff", "Scene", <r><buff id="257" params="x=0.15"/></r>),
			"28":new BattleItem(28, "生命凝露（大）", 300, 0, 0, 0, 0, "下一场战斗自身受到物理伤害降低25%，竞技场不可用", "Buff", "Scene", <r><buff id="255" params="x=0.25"/></r>),
			"29":new BattleItem(29, "魔力凝露（大）", 300, 0, 0, 0, 0, "下一场战斗自身受到魔法伤害降低25%，竞技场不可用", "Buff", "Scene", <r><buff id="256" params="x=0.25"/></r>),
			"30":new BattleItem(30, "光之凝露（大）", 300, 0, 0, 0, 0, "下一场战斗自身受到所有伤害降低20%，竞技场不可用", "Buff", "Scene", <r><buff id="257" params="x=0.2"/></r>),
			"31":new BattleItem(31, "双倍奥光瓶（小）", 300, 0, 0, 0, 0, "拥有神奇的魔力，使用后可获得15分钟双倍奥光时间", "DoubleAG", "Scene", <r time="900"/>),
			"32":new BattleItem(32, "双倍奥光瓶（大）", 300, 0, 0, 0, 0, "拥有神奇的魔力，使用后可获得30分钟双倍奥光时间", "DoubleAG", "Scene", <r time="1800"/>),
			"33":new BattleItem(33, "奥光果实", 300, 0, 0, 0, 0, "奥雅之树的果实，使用后可获得5000奥雅之光", "AG", "Scene", <r num="5000"/>),
			"34":new BattleItem(34, "学院午餐", 300, 0, 0, 0, 0, "营养的学院午餐。使用恢复380点HP。", "HpMp", "Scene", <r><hp min="380"/></r>),
			"35":new BattleItem(35, "皇家薄饼", 300, 0, 0, 0, 0, "皇家成员才能吃到的极品薄饼！使用恢复500点HP。", "HpMp", "Scene", <r><hp min="500"/></r>),
			"36":new BattleItem(36, "印度咖喱饭", 300, 0, 0, 0, 0, "又辛又辣的咖喱饭，吃完就出汗了！使用恢复500点HP", "HpMp", "Scene", <r><hp min="500"/></r>),
			"37":new BattleItem(37, "黄油烤鱼", 300, 0, 0, 0, 0, "采用新鲜黄油烤制的淡水鱼。使用恢复300点HP。", "HpMp", "Scene", <r><hp min="300"/></r>),
			"38":new BattleItem(38, "炸鱼薯条", 300, 0, 0, 0, 0, "炸新鲜银鳕鱼和大根炸薯条，又脆又香。使用恢复350点HP。", "HpMp", "Scene", <r><hp min="350"/></r>),
			"39":new BattleItem(39, "尼诺自动战斗仪", 300, 0, 0, 0, 0, "召唤出尼诺，自动帮你战斗。", "AutoBattle", "Scene", <r><npc id="165" lv="50" prolv="30" /></r>),
			"40":new BattleItem(40, "忍王自动战斗仪", 300, 0, 0, 0, 0, "召唤出忍王，自动帮你战斗。", "AutoBattle", "Scene", <r><npc id="166" lv="50" prolv="30" /></r>),
			"41":new BattleItem(41, "斯塔那手工曲奇", 300, 0, 100, 0, 0, "斯塔那亲手制作的美味曲奇饼。使用后HP、MP回满。", "HpMp", "Scene", <r><hp min="100000000"/><mp min="100000000"/></r>),
			"42":new BattleItem(42, "伢牙乐成长果实", 300, 0, 0, 0, 0, "直接点击使用可获得5000奥雅之光", "AG", "Scene", <r num="5000"/>),
			"43":new BattleItem(43, "大奥光果实", 300, 0, 0, 0, 0, "拥有更强能量的奥光果实，使用后可获得20000奥雅之光", "AG", "Scene", <r num="20000"/>)

			//exportData part end
		};
	}
}
