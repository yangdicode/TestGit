package mmo.framework.domain.petbreeding
{
	

	public class BreedingPet
	{
		/**
		 * 宠物的唯一标识，ID
		 */
		public var id:int;
		/**
		 * 名字
		 */
		public var name:String;
		/**
		 * 宠物类型， 如：普通宠物、骑宠、特殊动作的骑宠
		 */
		private var _type:String;
		/**
		 * 种族
		 */
		public var race:String;
		/**
		 * 兴趣爱好
		 */
		public var interest:String;
		/**
		 * 喜欢的道具ID,多个ID，用“,”隔开
		 */
		public var favouriteProps:String;
		/**
		 * 喜欢出没的地点
		 */
		public var favouritePlace:String;
		/**
		 * 饲养等级
		 */
		public var feedLevel:int;
		/**
		 * 合成公式，每个数组元素是一个合成公式的Id
		 */
		public var composingIds:Array
		/**
		 * 产出的宠物卡ID
		 */
		public var cardIds:Array;
		/**
		 * 成熟需要的成熟点数
		 */
		public var needMaturePoint:int;
		/**
		 * 额外属性的最大总和
		 */
		public var extPropertySumMax:int;
		
		/**
		 * 羽龄等级
		 * */
		public var featherAge:int;
		/**
		 * 收获获得的经验
		 */
		public var exp:int;
		/**
		 * 能否喂养
		 * */
		public var canFeed:Boolean;
		/**
		 * 初始编译概率
		 */
		public var orAberranceRate:int;
		
		public function BreedingPet(id:int, name:String, type:String, race:String, interest:String,
			favouriteProps:String, favouritePlace:String, feedLevel:int, composingIds:Array, cardIds:Array,
			needPoint:int, extPropertySumMax:int, featherAge:int, exp:int, orAberranceRate:int, canFeed:Boolean = false)
		{
			this.id = id;
			this.name = name;
			this.type = type;
			this.race = race;
			this.interest = interest;
			this.favouriteProps = favouriteProps;
			this.favouritePlace = favouritePlace;
			this.feedLevel = feedLevel;
			this.composingIds = composingIds;
			this.cardIds = cardIds;
			this.needMaturePoint = needPoint;
			this.extPropertySumMax = extPropertySumMax;
			this.featherAge = featherAge;
			this.exp = exp;
			this.orAberranceRate = orAberranceRate;
			this.canFeed = canFeed;
		}
		
		public function clone():BreedingPet
		{
			return new BreedingPet(this.id, this.name, this.type, this.race, this.interest, this.favouriteProps, 
				this.favouritePlace, this.feedLevel, this.composingIds, this.cardIds, this.needMaturePoint,
				this.extPropertySumMax, this.featherAge, this.exp, this.orAberranceRate, this.canFeed);
				
		}
		
		public function get type():String
		{
			var res:String = this._type;
			switch(this._type)
			{
				case PetTypeNames.BABY_TYPE:
					res = PetTypeNames.BABY_NAME;
					break;
				case PetTypeNames.AUDLT_TYPE:
					res = PetTypeNames.AUDLT_NAME;
					break;
				case PetTypeNames.RIDE_TYPE:
					res = PetTypeNames.RIDE_NAME;
					break;
				case PetTypeNames.SPECIAL_TYPE:
					res = PetTypeNames.SPECIAL_NAME;
					break;
				default:
					break;
			}
			return res;
		}
		
		public function set type(value:String):void
		{
			this._type = value;
		}
	}
}