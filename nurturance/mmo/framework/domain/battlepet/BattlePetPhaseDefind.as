package mmo.framework.domain.battlepet
{
	public class BattlePetPhaseDefind
	{
		
		private var _id:int;
		private var _battleType:String;
		private var _phaseName1:String;
		private var _phaseStartLv1:int;
		private var _phaseName2:String;
		private var _phaseStartLv2:int;
		private var _phaseName3:String;
		private var _phaseStartLv3:int;
		private var _gainWay:String;
		
		/**
		 * 新增
		 */		
		private var _phaseArr:Array;
		
		public function BattlePetPhaseDefind(id:int, battleType:String,
										   phaseName1:String, phaseStartLv1:int, 
										   phaseName2:String, phaseStartLv2:int,
										   phaseName3:String, phaseStartLv3:int,
										   gainWay:String)
		{
			_id = id;
			_battleType = battleType;
			_phaseName1 = phaseName1;
			_phaseStartLv1 = phaseStartLv1;
			_phaseName2 = phaseName2;
			_phaseStartLv2 = phaseStartLv2;
			_phaseName3 = phaseName3;
			_phaseStartLv3 = phaseStartLv3;
			_phaseArr = [{"lv":_phaseStartLv1, "name":_phaseName1},
						 {"lv":_phaseStartLv2, "name":_phaseName2},
						 {"lv":_phaseStartLv3, "name":_phaseName3}];
			_gainWay = gainWay;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get phaseName1():String
		{
			return _phaseName1;
		}
		
		public function get phaseStartLv1():int
		{
			return _phaseStartLv1;
		}
		
		public function get phaseName2():String
		{
			return _phaseName2;
		}
		
		public function get phaseStartLv2():int
		{
			return _phaseStartLv2;
		}
		
		public function get phaseName3():String
		{
			return _phaseName3;
		}
		
		public function get phaseStartLv3():int
		{
			return _phaseStartLv3;
		}
		
		public function get phaseArr():Array
		{
			return _phaseArr;
		}

		public function get battleType():String
		{
			return _battleType;
		}

		public function get gainWay():String
		{
			return _gainWay;
		}

		
	}
}