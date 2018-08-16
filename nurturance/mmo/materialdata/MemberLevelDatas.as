package mmo.materialdata
{
	import mmo.framework.domain.member.MemberLevel;

	public class MemberLevelDatas
	{
		public function MemberLevelDatas()
		{
		}
		
		public static const data:Object = {
			"0" : new MemberLevel(0, 0, "神羽见习骑士"),
			"1" : new MemberLevel(1, 0, "神羽骑士"),
			"2" : new MemberLevel(2, 25, "神羽爵士"),
			"3" : new MemberLevel(3, 80, "神羽子爵"),
			"4" : new MemberLevel(4, 240, "神羽伯爵"),
			"5" : new MemberLevel(5, 480, "神羽侯爵"),
			"6" : new MemberLevel(6, 800, "神羽公爵"),
			"7" : new MemberLevel(7, 1200, "神羽亲王"),
			"8" : new MemberLevel(8, 1680, "神羽大公"),
			"9" : new MemberLevel(9, 2240, "神羽君王"),
			"10" : new MemberLevel(10, 2880, "神羽帝王")
		}
	}
}