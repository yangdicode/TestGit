package mmo.materialdata
{
	import mmo.framework.domain.face.BuglePatternDefine;
	import mmo.framework.domain.face.FaceDefine;

	public class BugleData
	{
		//表情
		public static const faceData:Object = {
			"1":new FaceDefine(1, "", 0),
			"2":new FaceDefine(2, "", 0),
			"3":new FaceDefine(3, "", 0),
			"4":new FaceDefine(4, "", 0),
			"5":new FaceDefine(5, "", 0),
			"6":new FaceDefine(6, "", 0),
			"7":new FaceDefine(7, "", 0),
			"8":new FaceDefine(8, "", 0),
			"9":new FaceDefine(9, "", 0),
			"10":new FaceDefine(10, "", 0),
			"11":new FaceDefine(11, "", 0),
			"12":new FaceDefine(12, "", 0),
			"13":new FaceDefine(13, "", 0),
			"14":new FaceDefine(14, "", 0),
			"15":new FaceDefine(15, "", 0),
			"16":new FaceDefine(16, "", 0),
			
			"17":new FaceDefine(17, "", 1),
			"18":new FaceDefine(18, "", 1),
			"19":new FaceDefine(19, "", 1),
			"20":new FaceDefine(20, "", 1),
			"21":new FaceDefine(21, "", 1),
			"22":new FaceDefine(22, "", 1),
			"23":new FaceDefine(23, "", 1),
			"24":new FaceDefine(24, "", 1),
			
			"25":new FaceDefine(25, "", 3),
			"26":new FaceDefine(26, "", 3),
			"27":new FaceDefine(27, "", 3),
			"28":new FaceDefine(28, "", 3),
			"29":new FaceDefine(29, "", 3),
			"30":new FaceDefine(30, "", 3)
		};
		
		//花边
		public static const patternData:Object = {
			//type 0普通(神羽) 1炫动(年费)
			"1":new BuglePatternDefine(1, 0, 4244),
			"2":new BuglePatternDefine(2, 0, 4245),
			"3":new BuglePatternDefine(3, 0, 4246),
			"4":new BuglePatternDefine(4, 0, 4247),
			"5":new BuglePatternDefine(5, 0, 4248),
			"6":new BuglePatternDefine(6, 1, 4249),
			"7":new BuglePatternDefine(7, 1, 4250),
			"8":new BuglePatternDefine(8, 1, 4251),
			"9":new BuglePatternDefine(9, 1, 5001),
			"10":new BuglePatternDefine(10, 1, 5002),
			"11":new BuglePatternDefine(11, 1, 5003),
			"12":new BuglePatternDefine(12, 1, 5004),
			"13":new BuglePatternDefine(13, 0, 5005),
			"14":new BuglePatternDefine(14, 0, 5006),
			"15":new BuglePatternDefine(15, 0, 0, "神羽周年庆花边"),
			"16":new BuglePatternDefine(16, 0, 0, "新年快乐花边"),
			"17":new BuglePatternDefine(17, 0, 0, "樱花之恋花边"),
			"18":new BuglePatternDefine(18, 0, 0, "血族主题花边")
		};
		
		public function BugleData()
		{
		}
	}
}