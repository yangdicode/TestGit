package mmo.framework.domain.fillword
{
	import flash.system.ApplicationDomain;

	/***
	 *  填字游戏的数据	
	 * @author hanjun
	 * */
	public class FillWords
	{
		private var _curAllData:Object; //保存当前weekly期的所有数据
		private var _parseData:ParseFillWordData;
		private var _nHor:int; //横向格子数
		private var _nVer:int; //纵向格子数
		
		/***
		 * 当前点击响应的词组,在获取响应格子数组时同步更新
		 * */
		private var _cunFillWord:FillWord; 
		
		
		/***
		 * @param weekly:周刊号
		 * */
		public function FillWords(weekly:int)
		{
			getData(weekly);
			getSize(weekly);
			initParseData();
		}
		// 读取当期所有配置信息
		private function getData(weekly:int):void
		{
			_curAllData = new Object();
			
			var FillWordDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.FillWordData") as Class;
		
			for each ( var fillWordInfo:FillWord in FillWordDataClass["data"])
			{
				if( fillWordInfo.weekly == weekly )
				{
					_curAllData[fillWordInfo.id] = fillWordInfo;
				}
			}
		}
		// 获取面板需要X*Y的规格大小 
		private function getSize(weekly:int):void
		{
			var sizeDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.FillWordData") as Class;
			var sizeArry:Array = sizeDataClass["sizeData"][weekly];
			this._nHor = int(sizeArry[0]);
			this._nVer = int(sizeArry[1]);
				
		}		
		private function initParseData():void
		{
			_parseData = new ParseFillWordData(this._curAllData, this._nHor, this._nVer);
		}
		
		//设置当前响应的词组
		private function setCurFillWord( index:int, isExtFlag:Boolean ):void
		{
			var curWordId:int = 0;
			
			if( !isExtFlag )
			{
				curWordId = _parseData.getIndexMapId(index);
			}else
			{
				curWordId = _parseData.getIndexMapIdExt(index);
			}
			
			_cunFillWord = _curAllData[curWordId];
			
			if( !_cunFillWord )
			{
				trace("**ERROR！_cunFillWord为null！");
				trace("****index:"+index);
				trace("**curWordId:"+curWordId);
			}
		}
		
		
		
		/***
		 * 获取横向的格子数
		 * */
		public function get horSize():int
		{
			return this._nHor;
		}
		/***
		 * 获取纵向的格子数
		 * */
		public function get verSize():int
		{
			return this._nVer;
		}
		
		/***
		 * 获取响应格子数组
		 * @param index:格子引索
		 * @param clickFlag:点击是否需要切换到扩展词组标记
		 * */
		public function getGroupDataArry( index:int, isExtFlag:Boolean ):Array
		{
			setCurFillWord(index,isExtFlag); // 同步更新当前词组
			
			trace("*****isExtFlag:"+isExtFlag);
			
			if( !isExtFlag ) //默认词组
			{
				return _parseData.getGroupArry(index);
			}else //扩展词组
			{
				return _parseData.getGroupArryExt(index);
			}
		}
		
		/***
		 * 获取布局数组
		 * */
		public function getLayoutArry():Array
		{
			return _parseData.getAnswerLayout();
		}
		/***
		 * 获取答案数组
		 * */
		public function getAnswerArry():Array
		{
			return _parseData.getAnswerLayout();
		}
		
		/***
		 * 获取当前词组长度
		 * */
		public function getWordLength():int
		{
			return _cunFillWord.number;
		}
		/***
		 * 获取当前词组的方向
		 * */
		public function get isHorize():Boolean
		{
			return _cunFillWord.isHorize;
		}
		/***
		 * 获取当前词组的描述
		 * */
		public function get depict():String
		{
			return _cunFillWord.depict;
		}
		
		
		public function dispose():void
		{			
			_parseData.dispose();
			_parseData = null;
			
			_curAllData = null;
			
		}
	}
}