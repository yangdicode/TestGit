package mmo.framework.domain.plant
{
	public class Flowerpot
	{
		private var _potNum:int;
		private var _needScore:int;
		private var _needlevel:int;
		private var _gainExp:int;
		private var _needYubi:int;
		
		public function Flowerpot(potNum:int, needScore:int, needlevel:int, gainExp:int, needYubi:int)
		{
			this._potNum = potNum;
			this._needScore = needScore;
			this._needlevel = needlevel;
			this._gainExp = gainExp;
			this._needYubi = needYubi;
		}
		
		/**
		 * 开放的花盆数量
		 * @return 
		 */
		public function get potNum():int {
			return this._potNum;
		}
		
		/**
		 * 需要的种植等级
		 * @return 
		 */
		public function get needlevel():int {
			return this._needlevel;
		}
		
		/**
		 * 需要花费的金钱
		 * @return 
		 */
		public function get needScore():int {
			return this._needScore;
		}
		
		/**
		 *  获得经验
		 * @return 
		 */
		public function get gainExp():int {
			return this._gainExp;
		}
		
		/**
		 *  未到种植等级开启需要羽贝
		 * @return 
		 */
		public function get needYubi():int {
			return this._needYubi;
		}
	}
}