package mmo.materialdata
{
	import mmo.framework.domain.cardmap.CardMapBuff;
	import mmo.framework.domain.cardmap.CardMapProperty;

	/**
	 * 晶卡图鉴BUFF解说数据
	 * 晶卡图鉴特性解说数据
	 * 晶卡图鉴兑换奖励数据
	 */	
	
	public class CardMapBuffData
	{
		//"{0}":new CardMapBuff({0},"{1}","{2}"),
		public static const buffData:Object = 
		{
			"1":new CardMapBuff(1,"灼烧","每回合结束时造成一定伤害。"),
			"2":new CardMapBuff(2,"冰冻","一定回合内无法行动。"),
			"5":new CardMapBuff(5,"弱魔","受到的魔法伤害增加。"),
			"6":new CardMapBuff(6,"恢复","每回合结束时恢复生命值。"),
			"23":new CardMapBuff(23,"睡眠","一定回合内无法行动。"),
			"29":new CardMapBuff(29,"过度疲劳","无法使用技能卡，伤害降低75%，受到伤害提升20%"),
			"25":new CardMapBuff(25,"伤害加强","造成的所有伤害增加。"),
			"28":new CardMapBuff(28,"攻击弱化","造成的伤害降低。"),
			"26":new CardMapBuff(26,"防御降低","防御力降低，受到的物理伤害提升。"),
			"31":new CardMapBuff(31,"命中降低","命中率降低。")
		}
		
		//"{0}":new CardMapProperty({0},"{1}","{2}"),
		public static const propertyData:Object = 
		{
			"1":new CardMapProperty(1,"匕首卡","敌人越是轻视它，灵巧的匕首越能够给予他们最有力的打击。当对方精力值越低的情况下，匕首卡的威力也会变得越强哦~"),
			"2":new CardMapProperty(2,"斧卡","沉重的斧头可以对敌人造成非常可观的伤害，但挥舞它需要一定的技巧。威力高，但是命中率低。"),
			"3":new CardMapProperty(3,"剑卡","命中率高，威力一般，是最标准的武器卡。"),
			"4":new CardMapProperty(4,"弓卡","弓卡可以轻易击中敌人的弱点，威力一般，附带暴击率提升的效果。"),
			"5":new CardMapProperty(5,"琴卡","通过琴声对敌人造成固定伤害的卡片，缺点是威力较弱。"),
			"6":new CardMapProperty(6,"奥能卡","蕴含最纯粹的魔法能量的卡片，使用它有一定几率可以使敌人受到的魔法伤害提升。"),
			"7":new CardMapProperty(7,"火焰卡","蕴含火焰元素之力的卡片，使用它有一定几率可以灼烧敌人。"),
			"8":new CardMapProperty(8,"寒水卡","蕴含寒水元素之力的卡片，使用它有一定几率可以冰冻敌人。"),
			"9":new CardMapProperty(9,"盾卡","攻击一般，使用成功后可以在数回合内抵消部分伤害。")
		}
		
		public static const cardMapGiftData:XML = 
			<cardbookbonus>
				<item id="1">
					<cards value="34,42,20" />
					<b type="item" items="2-323-1" />
				</item>
				<item id="2">
					<cards value="57,39,24" />
					<b type="item" items="2-324-1" />
				</item>
				<item id="3">
					<cards value="60,67,50" />
					<b type="item" items="2-325-1" />
				</item>
				<item id="4">
					<cards value="78,77,80" />
					<b type="item" items="2-326-1" />
				</item>
				<item id="5">
					<cards value="72,53,83" />
					<b type="item" items="2-332-1" />
				</item>
				<item id="6">
					<cards value="79,81,84" />
					<b type="item" items="2-333-1" />
				</item>
				<item id="7">
					<cards value="44,22,61" />
					<b type="item" items="2-331-1" />
				</item>
				<item id="8">
					<cards value="54,32,73" />
					<b type="item" items="2-334-1" />
				</item>
				<item id="9">
					<cards value="40,69,14" />
					<b type="item" items="2-330-1" />
				</item>
				<item id="10">
					<cards value="25,51,88" />
					<b type="item" items="2-329-1" />
				</item>
				<item id="11">
					<cards value="36,65,5" />
					<b type="item" items="2-327-1" />
				</item>
				<item id="12">
					<cards value="64,68,89" />
					<b type="item" items="2-328-1" />
				</item>
			</cardbookbonus>
	}
}