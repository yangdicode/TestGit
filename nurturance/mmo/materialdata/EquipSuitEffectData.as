package mmo.materialdata
{
	import mmo.framework.domain.card.EquipSuitEffect;

	public class EquipSuitEffectData
	{
		
		//"{0}":new EquipSuitEffect({0}, "{1}", "{2}", "{3}"),
		//EquipSuitEffect
		public static const data:Object = {
			"1":new EquipSuitEffect(1, "梦境流光套装", "74,75,76,77,78", "魔攻+100，行动力+300，有5%的几率格挡伤害"),
			"2":new EquipSuitEffect(2, "虚空圣辉套装", "79,80,81,82,83", "魔攻+100，物攻+100，每回合结束有5%的几率清除自己身上的所有不利状态"),
			"3":new EquipSuitEffect(3, "寒光百炼套装", "86,87,88,89,90", "魔攻+100，物攻+100，附加10%的攻击吸血，受到伤害时20%概率本回暂时提升10%全属性"),
			"4":new EquipSuitEffect(4, "萌萌哒套装", "96,97,98,99,100", "行动力+200，双防+100，减少10%受到的伤害")
			
		};
	}
}