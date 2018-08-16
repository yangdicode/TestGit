package mmo.framework.domain.plant
{
	public class UserPlant
	{
		private var _locationId:int;
		private var _seed:Seed;
		private var _curOutput:int;
		private var _expectOutput:int;
		private var _remaingTime:int;
		private var _gainExp:int;
		
		private var _hasPest:Boolean;
		private var _hasWeed:Boolean;
		private var _isMature:Boolean;
		private var _canPick:Boolean;
		
		private var _starExp:int;
		private var _incVarRate:int;
		private var _isVar:Boolean;
		
		public function UserPlant()
		{
		}
		
		public static function parse(data:Object):UserPlant
		{
			var userPlant:UserPlant = new UserPlant();	
			userPlant.parseData(data);
			return userPlant;
		}
		
		public function parseData(data:Object):void
		{
			this._seed = Plants.getSeedDefine(data.sid);
			this._locationId = data.fpid;
			this._curOutput = data.foutput;
			this._expectOutput = data.eoutput;
			this._remaingTime = Math.ceil(data.rtime / 1000 / 60);
			this._gainExp = data.exp;
			
			this._hasPest = data.worm;
			this._hasWeed = data.weed;
			this._isMature = data.ismature;
			
			this._starExp = data.starExp;
			this._incVarRate = data.incVarRate;
			this._isVar = data.isVar;
		}
		
		/**
		 * 当前种在哪个位置上,id为[1-16]
		 * @return 
		 */		
		public function get locationId():int {
			return this._locationId;
		}
		
		public function get seed():Seed
		{
			return this._seed;
		}
		
		/**
		 * 植物id
		 * @return 
		 */		
		public function get plantId():int {
			return this._seed.id;
		}
		
		/**
		 * 当前产出量
		 * @return 
		 */		
		public function get currentOutput():int {
			return this._curOutput;
		}
		
		/**
		 * 期望出量
		 * @return 
		 */		
		public function get expectOutput():int {
			return this._expectOutput;
		}
		
		/**
		 * 作物成熟剩余时间
		 * @return 
		 */		
		public function get remaingTime():int {
			return this._remaingTime;
		}
		
		/**
		 * 收获可得到的经验
		 * @return 
		 */		
		public function get gainExp():int {
			return this._gainExp;
		}
		
		/**
		 * 生长所需天描述
		 * @return 
		 */		
		public function get needDayDesc():String {
			return GardenHelper.min2DHM(this._remaingTime);
		}
		
		/**
		 * 成长进度
		 * @return 
		 */		
		public function get growRate():int {
			return Math.floor((Seed(this._seed).needTime - this._remaingTime) / Seed(this._seed).needTime * 100);
		}
		
		/**
		 * 获取植物的成长阶段
		 * @return 
		 */		
		public function get growPhase():int {
			if (this._isMature && this._isVar)
			{
				return 4;
			}
			return PlantGrowPhase.getPlantGrowPhase(this.growRate);
		}
		
		/**
		 * 成长阶段描述
		 * @return 
		 */		
		public function get growPhaseDesc():String {
			return PlantGrowPhase.Grow_Desc[this.growPhase];
		}
		
		/**
		 * 是否有虫子
		 * @return 
		 */		
		public function get hasPest():Boolean {
			return this._hasPest;
		}
		public function removePest():void {
			this._hasPest = false;
		}
		
		/**
		 * 是否有杂草
		 * @return 
		 */		
		public function get hasWeed():Boolean {
			return this._hasWeed;
		}
		public function removeWeed():void {
			this._hasWeed = false;
		}
		
		/**
		 * 是否成熟
		 * @return 
		 */
		public function get isMature():Boolean
		{
			return this._isMature;
		}
		
		/**
		 * 是否可偷摘
		 * @return 
		 */
		public function get canPick():Boolean
		{
			if (Math.floor(this._seed.expectOutput/2) == this._curOutput)
			{
				return false;
			}
			return this._canPick;
		}
		public function set canPick(value:Boolean):void
		{
			this._canPick = value;
		}
		
		/**
		 * 收获可得到的星辉经验
		 * @return 
		 */
		public function get starExp():int
		{
			return this._starExp;
		}
		/**
		 * 提升的变异概率
		 * @return 
		 */
		public function get incVarRate():int
		{
			return this._incVarRate;
		}
		/**
		 * 是否变异
		 * @return 
		 */
		public function get isVar():Boolean
		{
			return this._isVar;
		}
	}
}