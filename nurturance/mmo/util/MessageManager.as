package mmo.util
{
	/**
	 * @author xuguowei
	 * 创建时间：2016-3-28 上午10:33:29
	 * 功能：事件派发管理器
	 */
	public class MessageManager
	{
		private var _list:Array = [];	

		public function MessageManager()
		{

		}

		public function addEventListener(key:String,fun:Function):void{
			if(_list.indexOf(key) == - 1){
				_list[key] = [fun];
			}else{
				var funs:Array = _list[key];
				if(funs.indexOf(fun) == -1){
					funs.push(fun);
				}
			}
		}

		public function dispachEvent(key:String,datas:Array = null):void{
			var funs:Array = _list[key];
			for each(var fun:Function in funs){
				fun.apply(null,datas);
			}
		}

		public function removeEventListener(key:String,fun:Function):void{
			var funs:Array = _list[key];
			if(funs == null){
				return;
			}
			for(var i:int = 0; i < funs.length; i++){
				var fn:Function = funs[i];
				if(fn == fun){
					funs.splice(i,1);
					break;
				}
			}
		}

		public function dispose():void{
			_list = [];
		}

	}

}

