package mmo.materialdata
{
	import mmo.framework.domain.halos.Halo;
	import mmo.framework.domain.halos.HaloColor;
	import mmo.framework.domain.halos.HaloFrame;

	public class HalosData
	{		
		public static const haloConfig:Object = {
			"1":new Halo(1, "银圈光环", 6595 , 0, false, 80),
			"2":new Halo(2, "天使光环", 6596, 24, true, 81),
			"3":new Halo(3, "炫动光环", 6597, 24, true, 82),
			"4":new Halo(4, "星光光环", 6743, 24, true, 83),
			"5":new Halo(5, "榄叶光环", 7121, 48, true, 84),
			"6":new Halo(6, "3周年飞翔光环", 0, 1, true, 85),
			"7":new Halo(7, "流光幻影", 7171, 48, true, 86),
			"8":new Halo(8, "奥雅新星人光环", 0, 168, true, 95),
			"9":new Halo(9, "心愿天使光环", 8115, 0, false, 103),	
			"10":new Halo(10, "百变萌哒光环", 8284, 72, false, 104),	
			"11":new Halo(11, "旋光蓝花蝶光环", 0, 360, false, 111)
		};
		
		public static const colorConfig:Object = {
			"1":new HaloColor(1, "红", 6598),
			"2":new HaloColor(2, "黄", 6598),
			"3":new HaloColor(3, "蓝", 6598),
			"4":new HaloColor(4, "绿", 6598),
			"5":new HaloColor(5, "紫", 6598)
		};
		
		public static const frameConfig:Object = {
			"1":new HaloFrame(1, "雪花飞舞", 6599, HaloFrame.MainFrame, "", "", false),
			"2":new HaloFrame(2, "榄叶环珠", 6600, HaloFrame.MainFrame, "2", "", false),
			"3":new HaloFrame(3, "紫蝠飞翼", 6601, HaloFrame.MainFrame, "2", "", false),
			"4":new HaloFrame(4, "雪花点点", 6602, HaloFrame.OtherFrame, "", "", false),
			"5":new HaloFrame(5, "星星闪闪", 6603, HaloFrame.OtherFrame, "2", "", false),
			"6":new HaloFrame(6, "紫珠点点", 6604, HaloFrame.OtherFrame, "2", "", false),
			"7":new HaloFrame(7, "紫蝶飞舞", 6605, HaloFrame.MainFrame, "3", "", false),
			"8":new HaloFrame(8, "闪耀皇冠", 6606, HaloFrame.MainFrame, "3", "", true),
			"9":new HaloFrame(9, "紫绕星光", 6607, HaloFrame.OtherFrame, "3", "", false),
			"10":new HaloFrame(10, "黄珠闪闪", 6608, HaloFrame.OtherFrame, "3", "", false),
			"11":new HaloFrame(11, "樱花纷飞", 6744, HaloFrame.MainFrame, "", "", false),
			"12":new HaloFrame(12, "在一起", 6745, HaloFrame.MainFrame, "4", "", false),
			"13":new HaloFrame(13, "求交友", 6746, HaloFrame.MainFrame, "4", "", false),
			"14":new HaloFrame(14, "黄星闪耀", 6747, HaloFrame.OtherFrame, "4", "", false),
			"15":new HaloFrame(15, "粉粉桃心", 6748, HaloFrame.OtherFrame, "4", "", false),
			"16":new HaloFrame(16, "鸟语花香", 7122, HaloFrame.MainFrame, "5,4,3", "", false),
			"17":new HaloFrame(17, "喵喵白猫", 7123, HaloFrame.MainFrame, "5,4,3", "", false),
			"18":new HaloFrame(18, "蝶儿飞飞", 7124, HaloFrame.OtherFrame, "5,4,3", "", false),
			"19":new HaloFrame(19, "鱼儿畅游", 7125, HaloFrame.OtherFrame, "5,4,3", "", false),			
			"20":new HaloFrame(20, "求安慰", 7172, HaloFrame.MainFrame, "7,4,3", "", false),
			"21":new HaloFrame(21, "很开心", 7173, HaloFrame.MainFrame, "7,4,3", "", false),
			"22":new HaloFrame(22, "求花花", 7174, HaloFrame.MainFrame, "7,4,3", "", false),
			"23":new HaloFrame(23, "蓝点小雨滴", 7175, HaloFrame.OtherFrame, "7,4,3", "", false),
			"24":new HaloFrame(24, "飘飘粉花瓣", 7176, HaloFrame.OtherFrame, "7,4,3", "", false),
			"25":new HaloFrame(25, "萌兔乖乖",8285 , HaloFrame.MainFrame, "10", "", false),
			"26":new HaloFrame(26, "暖云嘻嘻",8286 , HaloFrame.MainFrame, "10", "", true),
			"27":new HaloFrame(27, "偶好开森",8287 , HaloFrame.MainFrame, "10", "", false),
			"28":new HaloFrame(28, "俏皮星星",8288 , HaloFrame.MainFrame, "10", "", false),
			"29":new HaloFrame(29, "兔晕晕哒",8289 , HaloFrame.MainFrame, "10", "", false),
			"30":new HaloFrame(30, "天然猫呆",8290 , HaloFrame.MainFrame, "10", "", false),
			"31":new HaloFrame(31, "粉红小花",8291 , HaloFrame.OtherFrame, "10", "", false),
			"32":new HaloFrame(32, "蓝色星星",8292 , HaloFrame.OtherFrame, "10", "", false),
			"33":new HaloFrame(33, "百合蝶飞",0 , HaloFrame.MainFrame, "11", "", false)
			
		};
		
		
		/** 这个已废弃 **/
		public static const newHaloIdConfig:Array = [			
		];
	}
}