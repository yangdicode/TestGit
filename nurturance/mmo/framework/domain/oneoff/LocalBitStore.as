package mmo.framework.domain.oneoff
{
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;
	import mmo.framework.domain.shareobject.LocalStore;

	/**
	 *	利用flash本地缓存 保存一下简单数据
	 *  比如：只能点开一次漫画 之类的。
	 * （注意：用户清除flash缓存时或者设置flash不能写文件时会失败。） 
	 * 在LocalOneOffTypes类配置所需的type值
	 * @author hanjun
	 * 
	 */
	public class LocalBitStore
	{
		private static var Stores:Object = {};
		public static function getStoreByKey(key:String):LocalBitStore{
			if(!Stores.hasOwnProperty(key)){
				Stores[key] = new LocalBitStore(key);
			}
			return Stores[key];
		}
		
		private const TOTAL_POS:int = 32;
		
		private var _key:String;
		
		public function LocalBitStore(key:String)
		{
			_key = key;
		}
		
		public function hasDone(type:int):Boolean
		{
			var keyIndex:int = int(type/TOTAL_POS);
			var pos:int = type % TOTAL_POS;		
			var arrayValue:Array = getValue();
			if( !arrayValue[keyIndex] )
				return false;			
			var state:int = arrayValue[keyIndex];			
			return ((state>>pos) & 0x01) > 0;
		}
		
		public function setDone(type:int):void
		{
			var keyIndex:int = type / TOTAL_POS;
			var pos:int = type % TOTAL_POS;
			var arrayValue:Array = getValue();
			var state:int = arrayValue[keyIndex];
			arrayValue[keyIndex] = state | (0x01 << pos);
			
			var state2:int = arrayValue[keyIndex];
			setValue(arrayValue);
		}
		
		public function setUndo(type:int):void{
			var keyIndex:int = type / TOTAL_POS;
			var pos:int = type % TOTAL_POS;
			var arrayValue:Array = getValue();
			var state:int = arrayValue[keyIndex];
			arrayValue[keyIndex] = state & (~(0x01 << pos));
			var state2:int = arrayValue[keyIndex];
			setValue(arrayValue);
		}
		
		private function setValue(value:Array):void
		{
			var userName:String = UserInfo(MainModelLocator.instance.retrieveModel(UserInfo)).userName;
			LocalStore.setValue(userName, value, _key);
		}
		
		private function getValue():Array
		{
			var userName:String = UserInfo(MainModelLocator.instance.retrieveModel(UserInfo)).userName;
			var arrayValue:Array = LocalStore.getValue(userName, _key) as Array;
			if( !arrayValue )
				arrayValue = [];
			return arrayValue;
		}
		
	}
}