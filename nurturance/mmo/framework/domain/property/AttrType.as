package mmo.framework.domain.property
{
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.profession.ProfessionLv;
	import mmo.framework.domain.profession.ProfessionLvs;
	import mmo.socketserver.data.User;

	/**
	 * 人物属性类型编号
	 * @author liyawei
	 */	
	
	public class AttrType
	{
		/**总属性**/
		public static const NurtureAttrSum:int = 0;
		/**力量**/
		public static const STRENGTH:int = 1;
		/**智慧**/
		public static const INTELLIGENCE:int = 2;
		/**体质**/
		public static const STAMINA:int = 3;
		/**道德**/
		public static const MORALITY:int = 4;
		/**灵敏**/
		public static const AGILITY:int = 5;
		
		private static const AttrNoToKey:Object = 
		{
			1:"strength",
			2:"intelligence",
			3:"stamina",
			4:"morality",
			5:"agility"
		}
		
		//属性tips显示内容
		private static const attrTipsInfoMsg:Object = 
		{
			1:"影响战斗中的物理攻击力哟~",
			2:"影响战斗中的魔法攻击力哟~",
			3:"影响战斗中的生命总值哟~",
			4:"影响战斗中的物理防御哟~",
			5:"影响战斗中的出卡顺序、命中率和暴击率哟~"
		}
		
		public function AttrType()
		{
		}
		
		/**
		 * 返回属性名称
		 * @param type
		 */		
		public static function getAttrName(type:int):String
		{
			switch(type){
				case NurtureAttrSum:
					return "总属性";
				case STRENGTH:
					return "力量";
				case INTELLIGENCE:
					return "智慧";
				case STAMINA:
					return "体质";
				case MORALITY:
					return "道德";
				case AGILITY:
					return "灵敏";
			}
			return "";
		}
		
		/**
		 * 根据类型返回属性数值(UserProperty内)
		 * @return 
		 */		
		public static function getAttrValue(type:int):int
		{
			var userProperty:UserProperty = MainModelLocator.instance.retrieveModel(UserProperty);
			switch(type){
				case NurtureAttrSum:
					return userProperty.getNurtureAttrSum;
				case STRENGTH:
					return userProperty.strength;
				case INTELLIGENCE:
					return userProperty.intelligence;
				case STAMINA:
					return userProperty.stamina;
				case MORALITY:
					return userProperty.morality;
				case AGILITY:
					return userProperty.agility;
			}
			return 0;
		}
		
		/**
		 * 根据属性类型获得属性编号
		 */		
		public static function getAttrNoByKey(attrKey:String):int
		{
			for(var key:String in AttrNoToKey)
			{
				if(AttrNoToKey[key] == attrKey)
				{
					return int(key);
				}
			}
			
			return -1;
		}
		
		/**
		 * 根据属性编号获得属性类型
		 */		
		public static function getAttrKeyByNo(attrNo:int):String
		{
			return AttrNoToKey[attrNo];
		}
		
		/**
		 * 检查属性key是否存在 
		 */		
		public static function hasAttrKey(key:String):Boolean
		{
			for each(var attrKey:String in AttrNoToKey){
				if(attrKey == key){
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 获得各个属性tips介绍 
		 */		
		public static function getTipsInfoByAttrType(type:int):String
		{
			return attrTipsInfoMsg[type];
		}
		
		/**
		 * 根据类型返回职业属性添加数值
		 * @return 
		 */		
		public static function getProAttrAdd(type:int,proId:int,proLv:int):int
		{
			var professionLv:ProfessionLv = ProfessionLvs.getProfessionLv(proId,proLv);
			switch(type){
				case STRENGTH:
					return professionLv.phyAtatck;
				case INTELLIGENCE:
					return professionLv.magAttack;
				case STAMINA:
					return professionLv.life;
				case MORALITY:
					return professionLv.phyDefense;
				case AGILITY:
					return professionLv.speed;
			}
			return 0;
		}
	}
}