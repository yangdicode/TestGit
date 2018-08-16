package mmo.framework.domain.npcbattle
{
	public class NpcBuffDefine
	{
		private var _npcId:int;
		private var _favor:int;
		private var _buffIds:Array = [];
		private var _buffParams:Array = [];
		
		public function NpcBuffDefine(npcId:int, favor:int, buffXML:XML = null){
			_npcId = npcId;
			_favor = favor;
			if(buffXML == null){
				return;
			}
			var list:XMLList = buffXML.b;
			for each(var e:XML in list){
				if( int(e.@invisible)<=0 ){
					_buffIds.push(e.@id);
					_buffParams.push(e.@param);
				}
			}
		}

		public function get npcId():int
		{
			return _npcId;
		}

		public function get favor():int
		{
			return _favor;
		}

		public function get buffIds():Array
		{
			return _buffIds;
		}

		public function get buffParams():Array
		{
			return _buffParams;
		}


	}
}