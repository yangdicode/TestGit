package mmo.framework.domain.collegeprofession
{
	public class CollegeProfessionTaskDefine
	{
		private var _id:int;
		private var _taskName:String;
		private var _proId:int;
		private var _limitLv:int;
		private var _commonTimes:int;
		private var _vipTimes:int;
		private var _timesMcKey:String;
		private var _buyTimesTempKey:String;
		private var _selectMcKey:String;
		
		private var _expInc:int;//成长值，经验
		private var _contrInc:int;//贡献值
		private var _voteInc:int;//学院积分
		private var _objItemBonus:Object;//xx币、学院币
		
		public function CollegeProfessionTaskDefine(id:int,taskName:String,proId:int,limitLv:int,
						commonTimes:int,vipTimes:int,timesMcKey:String,buyTimesTempKey:String,selectMcKey:String,
						expInc:int,contrInc:int,voteInc:int,strItemBonus:String )
		{
			_id = id;
			_taskName = taskName;
			_proId = proId;
			_limitLv = limitLv;
			_commonTimes = commonTimes;
			_vipTimes = vipTimes;
			_timesMcKey = timesMcKey;
			_buyTimesTempKey = buyTimesTempKey;
			_selectMcKey = selectMcKey;
			
			_expInc = expInc;
			_contrInc = contrInc;
			_voteInc = voteInc;
			
			initItemNumberMap(strItemBonus);
		}
		
		
		public function get id():int
		{
			return _id;
		}

		public function get taskName():String
		{
			return _taskName;
		}

		public function get proId():int
		{
			return _proId;
		}

		public function get limitLv():int
		{
			return _limitLv;
		}

		public function get commonTimes():int
		{
			return _commonTimes;
		}

		public function get vipTimes():int
		{
			return _vipTimes;
		}

		public function get timesMcKey():String
		{
			return _timesMcKey;
		}

		public function get buyTimesTempKey():String
		{
			return _buyTimesTempKey;
		}

		public function get selectMcKey():String
		{
			return _selectMcKey;
		}

		/** XX成长值  **/
		public function get expInc():int{
			return _expInc;
		}
		
		/** XX贡献值  **/
		public function get contrInc():int{
			return _contrInc;
		}
		
		/** 学院积分  **/
		public function get voteInc():int{
			return _voteInc;
		}
		
		/** 物品奖励数目：如XX币、学院币等等  **/
		public function getBonusItemNumber(itemId:int):int{
			if( _objItemBonus.hasOwnProperty(itemId.toString())){
				return int(_objItemBonus[itemId.toString()]);
			}			
			return 0;				
		}
		
		private function initItemNumberMap(strItems:String):void{
			_objItemBonus = {};
			var arrayItems:Array = strItems.split(",");
			for( var i:int=0;i<arrayItems.length;i++ ){
				var itemData:Array = String(arrayItems[i]).split("-");
				if( itemData.length!=3 )
					continue;
				_objItemBonus[String(itemData[1])] = int(itemData[2]);
			}
		}

	}
}