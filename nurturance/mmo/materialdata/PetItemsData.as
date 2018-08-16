package mmo.materialdata
{
	import mmo.framework.domain.material.petitem.PetItem;

	public class PetItemsData
	{
		public function PetItemsData()
		{
		}
		
		//注意：不要一下全部覆盖之前数据，最后一个字段是用来标识是否能使用的。
		/*  宠物道具定义
		SELECT CONCAT('"',T.Id, '":new PetItem(',T.Id,',',T.Type,',"',T.Name,'",',
		P.MaxOwnNum,',',P.Value,',',P.SellPrice,',',P.IsBind,',',P.IsVip,',"',
		P.Description,'",',P.CanTrade,',',P.IsOutOfPrint,',""),')
		FROM aox1.PetItem T ,aox1.PetArticles P where  T.Id=P.ItemId;
		*/
		/*  宠物物品定义
		SELECT CONCAT('"',T.Id, '":new PetItem(',T.Id,',40,"',T.Name,'",',
		P.MaxOwnNum,',',P.Value,',',P.SellPrice,',',P.IsBind,',',P.IsVip,',"',
		P.Description,'",',P.CanTrade,',',P.IsOutOfPrint,',""),')
		FROM aox1.PetMaterial T ,aox1.PetArticles P where  T.Id=P.ItemId;
		*/
		/*  宠物家具定义
		SELECT CONCAT('"',T.ItemId, '":new PetItem(',T.ItemId,',',T.Type,',"',T.Name,'",',
		P.MaxOwnNum,',',P.Value,',',P.SellPrice,',',P.IsBind,',',P.IsVip,',"',
		P.Description,'",',P.CanTrade,',',P.IsOutOfPrint,',""),') FROM aox1.PetFurnitures T,aox1.PetArticles P
		where  T.ItemId=P.ItemId;
		*/
		public static const data:Object = {				
			"1":new PetItem(1,40,"湖草",10000,10,2,0,0,"仙子湖的水孕育出的草，就像仙女的长发，宠物探险获得。",0,0,""),
			"2":new PetItem(2,40,"幽影花",10000,10,2,0,0,"生长在洞穴的深处，闪烁着黑色幽光的花朵，宠物探险获得。",0,0,""),
			"3":new PetItem(3,40,"蝠鼠草",10000,10,2,0,0,"或许是因为生长在蝙蝠比较多的地方，所以形状也有点相似，宠物探险获得。",0,0,""),
			"4":new PetItem(4,40,"火焰花",10000,10,2,0,0,"传说中是从岩浆中生长出的花朵，形状似摇曳的火焰，宠物探险获得。",0,0,""),
			"5":new PetItem(5,40,"精灵泉水",10000,10,2,0,0,"被精灵们祝福的泉水，直接饮用会发生难以预测的后果，宠物探险获得。",0,0,""),
			"6":new PetItem(6,40,"云溶精华",10000,10,2,0,0,"液体中漂浮着像云朵一样的絮状物体，宠物探险获得。",0,0,""),
			"7":new PetItem(7,40,"凝光露",10000,10,2,0,0,"迷光森林的特产，金色的光点散落在露水中，宠物探险获得。",0,0,""),
			"8":new PetItem(8,40,"暗色微尘",10000,10,2,0,0,"紫黑色的细小微粒，常常藏在洞穴的深处，宠物探险获得。",0,0,""),
			"9":new PetItem(9,40,"迷光微尘",10000,10,2,0,0,"金色的细小微粒，不仔细看实在是难以分辨，宠物探险获得。",0,0,""),
			"10":new PetItem(10,40,"灼焰微尘",10000,10,2,0,0,"赤红的细小微粒，泛着火焰般的色泽，宠物探险获得。",0,0,""),
			"11":new PetItem(11,40,"轮回碎片",10000,30,6,0,0,"瑰丽的五彩碎片，可以合成轮回宝石，宠物探险获得。",0,0,""),
			"12":new PetItem(12,40,"力碎片",10000,20,4,0,0,"红色碎片，可以合成力宝石，宠物探险获得。",0,0,""),
			"13":new PetItem(13,40,"智碎片",10000,20,4,0,0,"蓝色碎片，可以合成智宝石，宠物探险获得。",0,0,""),
			"14":new PetItem(14,40,"敏碎片",10000,20,4,0,0,"黄色碎片，可以合成敏宝石，宠物探险获得。",0,0,""),
			
			"15":new PetItem(15,1,"蓝色皮球",300,40,8,0,0,"简单的蓝色皮球，宠物玩耍的好伙伴，可以恢复10点满意度。",1,0,""),
			"16":new PetItem(16,2,"汉堡",300,40,8,0,0,"看起来很美味，吃起来不知道是不是一样，可以恢复10点满意度。",1,0,""),
			"17":new PetItem(17,3,"肥皂",300,40,8,0,0,"普通的肥皂，弄脏的宠物要洗干净哦。可以恢复10点满意度。",1,0,""),
			"18":new PetItem(18,1,"小金球",300,120,24,0,0,"金色的皮球，很受宠物喜爱~可以恢复30点满意度。",1,0,""),
			"19":new PetItem(19,2,"冰激凌甜筒",300,120,24,0,0,"在宠物当中深受喜爱~可以恢复30点满意度。",1,0,""),
			"20":new PetItem(20,3,"沐浴露",300,120,24,0,0,"有着淡淡的香气~可以恢复30点满意度。",1,0,""),
			"21":new PetItem(21,3,"清新香皂",300,80,16,0,0,"恢复20点满意度，喂给喜爱它的宠物会增加更多满意度并额外增加魂值，宠物合成获得。",1,0,""),
			"22":new PetItem(22,2,"草木汁",300,80,16,0,0,"恢复20点满意度，喂给喜爱它的宠物会增加更多满意度并额外增加魂值，宠物合成获得。",1,0,""),
			"23":new PetItem(23,2,"甜风派",300,80,16,0,0,"恢复20点满意度，喂给喜爱它的宠物会增加更多满意度并额外增加魂值，宠物合成获得。",1,0,""),
			"24":new PetItem(24,2,"糖浆蛋糕",300,80,16,0,0,"恢复20点满意度，喂给喜爱它的宠物会增加更多满意度并额外增加魂值，宠物合成获得。",1,0,""),
			"25":new PetItem(25,2,"森林精粹",300,80,16,0,0,"恢复20点满意度，喂给喜爱它的宠物会增加更多满意度并额外增加魂值，宠物合成获得。",1,0,""),
			"26":new PetItem(26,2,"深水凝露",300,80,16,0,0,"恢复20点满意度，喂给喜爱它的宠物会增加更多满意度并额外增加魂值，宠物合成获得。",1,0,""),
			"27":new PetItem(27,5,"轮回宝石",300,2000,400,0,0,"使用之后会使宠物回到初始成长状态，所有增长的属性和魂值会被清空，并重置宠物的资质，目前资质不影响变异概率。宠物合成获得。只能对宠物屋内的宠物使用哦~",1,0,""),
			"28":new PetItem(28,4,"力宝石",300,800,160,0,0,"可以直接增加宠物的力属性1点，宠物合成获得。",1,0,""),
			"29":new PetItem(29,4,"智宝石",300,800,160,0,0,"可以直接增加宠物的智属性1点，宠物合成获得。",1,0,""),
			"30":new PetItem(30,4,"敏宝石",300,800,160,0,0,"可以直接增加宠物的敏属性1点，宠物合成获得。",1,0,""),
			
			"31":new PetItem(31,31,"噜噜猪沙发",300,2500,500,0,0,"噜噜猪形状的沙发，很可爱哦~宠物合成获得。",1,0,""),
			"32":new PetItem(32,31,"小草灵座椅",300,2500,500,0,0,"翠绿翠绿的椅子，符合小草灵的爱好~宠物合成获得。",1,0,""),
			"33":new PetItem(33,32,"黑风哈比钟",300,2500,500,0,0,"黑风哈比告诉你：不要浪费时间~宠物合成获得。",1,0,""),
			"34":new PetItem(34,31,"小蛮牛柜子",300,2500,500,0,0,"牛牛的柜子，很牢靠！宠物合成获得。",1,0,""),
			"35":new PetItem(35,31,"尤卡斯镜子",300,2500,500,0,0,"火焰环绕的镜子。宠物合成获得。",1,0,""),
			"36":new PetItem(36,31,"摇摇小白马",300,2500,500,0,0,"摇啊摇，摇啊摇~宠物合成获得。",1,0,""),
			"37":new PetItem(37,31,"梦幻缤纷炮",300,1200,240,0,0,"轰一炮会怎么样呢？",1,1,""),
			"38":new PetItem(38,31,"弹弹惊喜桌",300,1000,200,0,0,"这个是……弹球游戏？",1,1,""),
			"39":new PetItem(39,31,"尖叫小箱",300,800,160,0,0,"里~面~有~什~么~呢~",1,1,""),
			"40":new PetItem(40,32,"缤纷小丑镜",300,800,160,0,0,"照出来的不是你的脸而是小丑的脸~",1,1,""),
			"41":new PetItem(41,31,"粉色跷跷板",300,1200,240,0,0,"找个好朋友一起来玩吧~",1,1,""),
			"42":new PetItem(42,31,"小丑气球",300,800,160,0,0,"不要逗我笑，我不会笑的，噗噗~",1,1,""),
			
			"43":new PetItem(43,33,"绿叶地板",1,0,0,1,0,"散落的绿叶有种零落的美。",0,0,""),
			"44":new PetItem(44,34,"典雅绿色墙纸",1,0,0,1,0,"典雅至极。",0,0,""),
			"45":new PetItem(45,35,"典雅木门",1,0,0,1,0,"简约典雅风格的木质门框，带着宠物的印记。",0,0,""),
			
			"46":new PetItem(46,31,"糖糖抱枕",300,2500,500,0,0,"抱着它就像是抱着糖糖兔一样~",1,0,""),
			"47":new PetItem(47,31,"百花床垫",300,2500,500,0,0,"睡在百花环绕间~",1,0,""),
			"48":new PetItem(48,31,"船长小灯",300,2500,500,0,0,"带着船长帽的小灯，可惜不能在大海中指明方向。",1,0,""),
			"49":new PetItem(49,31,"金翅浴盆",300,2500,500,0,0,"在浴盆里睡着的话会梦到飞翔的感觉吧~",1,0,""),
			"50":new PetItem(50,32,"幽灵挂画",300,1500,300,0,0,"有幽灵在飘~",1,0,""),
			"51":new PetItem(51,32,"蝙蝠墙饰",300,1500,300,0,0,"哇，以假乱真~",1,0,""),
			"52":new PetItem(52,32,"黑猫贴画",300,1500,300,0,0,"猫好像在动！",1,0,""),
			"53":new PetItem(53,31,"小墓碑装饰",300,2500,500,0,0,"谁的墓？",1,0,""),
			"54":new PetItem(54,31,"南瓜灯装饰",300,1800,360,0,0,"亮堂堂的南瓜灯~",1,0,""),
			"55":new PetItem(55,32,"水色盾牌装饰",300,2500,500,0,0,"幽蓝色的盾牌，仿佛映照着水的倒影。",1,0,""),
			"56":new PetItem(56,31,"奇奇高脚凳",300,2500,500,0,0,"坐上去很不容易",1,0,""),
			"57":new PetItem(57,31,"战马吉他",300,2500,500,0,0,"弹奏时充满铿锵的音色。",1,0,""),
			"58":new PetItem(58,31,"珊瑚立灯",300,2500,500,0,0,"优雅的造型，梦幻般的色彩。",1,0,"")
		}
	}
}