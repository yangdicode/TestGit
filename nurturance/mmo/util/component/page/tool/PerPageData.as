package mmo.util.component.page.tool
{
	public class PerPageData
	{
		protected var _curPage:int;
		public var perPageNum:int;
		
		protected var _totalNum:int = int.MAX_VALUE;
		
		protected var _pageDataMap:Object = {};
		
		protected var hasDispose:Boolean = false;
				
		protected var _getPageNumEachTime:int;
		
		protected var _dataChangeCallBack:Function;
		
		protected var _forceNoFresh:Boolean = false;
		
		/**
		 * 每页都向后端取数据
		 */		
		public function PerPageData(getPageNumEachTime:int = 5){
			_getPageNumEachTime = getPageNumEachTime;
		}
		
		public function dispose():void{
			_dataChangeCallBack = null;
			hasDispose = true;
			_pageDataMap = null;
		}
		
		public function gotoPage(page:int, forceFresh:Boolean = false, forceNoFresh:Boolean = false):void{
			if(page > totalPage || page < 1){
				return;
			}
			_forceNoFresh = forceNoFresh;
			_curPage = page;
			if( (!forceFresh && _pageDataMap.hasOwnProperty(_curPage)) || forceNoFresh ){
				notifyPageDataChange();
				return;
			}
			
			getDataFromServer((_curPage -  1) * perPageNum, perPageNum * _getPageNumEachTime);
		}
		
		public function get totalPage():int{
			return Math.max((_totalNum - 1) / perPageNum + 1, 1);
		}
		
		public function get curPage():int{
			return _curPage;
		}
		
		public function get curPageData():Array{
			return _pageDataMap[_curPage];
		}
		
		public function setCurData(data:Array, forceNoFresh:Boolean = false):void{
			_curPage = 1;
			_forceNoFresh = forceNoFresh;
			//清空
		//	_pageDataMap = {};
		//	_pageDataMap[_curPage] = data;
		//	_totalNum = data.length;
		//	notifyPageDataChange();
			onGetData( data.length, data);
		}
		
		public function setDataChangeCallBackFunc( dataChangeCallBack:Function ):void{
			_dataChangeCallBack = dataChangeCallBack;
		}
		
		/**
		 * 从服务器获取数据。
		 * <br/>1、需要自己显示：ProgressFullSprite
		 * <br/>2、取完数据调用：onGetData
		 */		
		protected function getDataFromServer(o:int, l:int):void{
			throw new Error("重写getDataFromServer.");
		}
		
		/**
		 *	 取完数据回调 
		 * @param totalNum 总数据量
		 * @param data 数据信息
		 * 
		 */		
		final protected function onGetData(totalNum:int, data:Array):void{			
			_totalNum = totalNum;
			if(_curPage > 1 && (data == null || data.length <= 0)){
				gotoPage(_curPage - 1);
			}else{
				//清空
				_pageDataMap = {};
				
				var pageLen:int = _getPageNumEachTime;
				if( _forceNoFresh ){
					pageLen = totalPage;
				}
				
				var eachPage:Array;
				for(var i:int = 0; i < pageLen; i ++){
					eachPage = [];
					for(var j:int = 0; j < perPageNum; j ++){
						var index:int = i * perPageNum + j;
						if(data[index] != null){
							eachPage.push(data[index]);
						}else{
							break;
						}
					}
					_pageDataMap[_curPage + i] = eachPage;
				}
				
				notifyPageDataChange();
			}
		}
		
		final protected function notifyPageDataChange():void{
			if( _dataChangeCallBack != null ){
				_dataChangeCallBack.apply();
			}
		}
		
		public function get totalNum():int
		{
			return _totalNum;
		}
	}
}