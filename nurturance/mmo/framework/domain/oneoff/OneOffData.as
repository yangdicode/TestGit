package mmo.framework.domain.oneoff
{
	import flash.utils.ByteArray;

	public class OneOffData
	{
//		public static const STEPNUM:int = 4;
		public static const STEPNUM:int = 32;
		public static const PERSTEP_POS:int = 64;
		public static const TOTAL_POS:int = STEPNUM * PERSTEP_POS;
		public static const BYTEPOS:int = 8;
		private var _states:Array;
		private var _keyState:Object;
		public function OneOffData(state:ByteArray)
		{
			parse(state);
		}
		
		public function hasDone(type:int):Boolean
		{
			if(type > TOTAL_POS)
			{
				throw new Error(type + " OneOff Pos Out Of Range!");
			}	
			var byteIndex:int = type / BYTEPOS;
			var pos:int = type % BYTEPOS;
			
			var state:int = _states[byteIndex];
			return (state & (0x01 << pos)) > 0;
		}
		
		public function setDone(type:int):void
		{
			if(type > TOTAL_POS)
			{
				throw new Error(type + " OneOff Pos Out Of Range!");
			}	
			var byteIndex:int = type / BYTEPOS;
			var pos:int = type % BYTEPOS;
			var state:int = _states[byteIndex];
			_states[byteIndex] = state | (0x01 << pos);
		}
		
		public function getCommonState(key:String, indexs:Array):Object{
			if(indexs == null){
				return getAllCommonState(key);
			}
			var obj:Object = new Object();
			var state:Array = _keyState[key];
			for each(var index:int in indexs)
			{
				var byteIndex:int = index / BYTEPOS;
				var pos:int = index % BYTEPOS;
				obj[index] = (state[byteIndex] & (0x01 << pos)) > 0;
			}
			return obj;
		}
		
		public function getAllCommonState(key:String):Object{
			var obj:Object = new Object();
			var state:Array = _keyState[key];
			var k:int;
			for(var i:int = 0; i < state.length; i ++){
				for(var j:int = 0; j < BYTEPOS; j ++){
					k = i * BYTEPOS + j;
					var byteIndex:int = k / BYTEPOS;
					var pos:int = k % BYTEPOS;
					obj[k] = (state[byteIndex] & (0x01 << pos)) > 0;
				}
			}
			return obj;
			
		}
		
		public function setCommonStateByByte(key:String, state:ByteArray):void
		{
//			if(!_keyState.hasOwnProperty(key))
			_keyState[key] = [];
			while(state.bytesAvailable > 0){
				(_keyState[key] as Array).push(state.readByte());
			}
		}
		
		public function setCommonDoneByIndex(key:String, index:int):void{
			setCommonStateByIndex(key, index, 1);
		}
		
		public function setCommonStateByIndex(key:String, index:int, state:int):void
		{
			if(!_keyState.hasOwnProperty(key))
				_keyState[key] = [];
			var states:Array = _keyState[key];
			var byteIndex:int = index / BYTEPOS;
			var pos:int = index % BYTEPOS;
			var oldState:int =  states[byteIndex];
			states[byteIndex] = oldState | (state << pos);
		}
		
		public function hasCommonState(key:String, indexs:Array = null):Boolean{
			if(!_keyState.hasOwnProperty(key)){
				return false;
			}
			if(indexs == null){
				return true;
			}
			var state:Array = _keyState[key];
			for each(var index:int in indexs){
				var byteIndex:int = index / BYTEPOS;
				if(!state.hasOwnProperty(byteIndex)){
					return false;
				}
			}
			return true;
		}
		
		private function parse(state:ByteArray):void
		{
			_states = [];
			_keyState = new Object();
			while(state.bytesAvailable > 0)
			{
				_states.push(state.readByte());				
			}	
		}	
	}
}