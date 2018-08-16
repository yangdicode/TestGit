package mmo.framework.domain.fillword
{
	/***
	 * 解析数据，匹配具体某个格子的相应。
	 * */
	public class ParseFillWordData
	{
		/***
		 * 保存原始数据
		 * */
		private var _parseData:Object; 		
		/***
		 * 点击每个格子相应相应格子数组
		 * */
		private var _parseGroupData:Object;
		private var _indexMapId:Object; //保存格子对应词组id
		/***
		 *  点击每个格子相应相应格子数组（扩展）,保存两个词共用的格子
		 * */
		private var _parseGroupDataExt:Object;
		private var _indexMapIdExt:Object; //保存格子对应词组id（扩展）,可能公共同一个格子的另一个词组
		/***
		 * 保存答案布局数据，空的为“”，否则为标准答案
		 * */
		private var _parseAnsewrLayoutData:Array = [];
		
		private var _horNumber:int; //横向格子数目
		private var _verNumber:int; //纵向格子数目
		
		/***
		 * 解析数据，匹配具体某个格子的相应。
		 * @param data:当期的所有原始数据
		 * */
		public function ParseFillWordData( data:Object, horNumber:int, verNumber:int )
		{
			_parseData = data;
			_horNumber = horNumber;
			_verNumber = verNumber;				
			
			initParam();
			parseData();
		}
		
		//初始化参数
		private function initParam():void
		{
			_parseGroupData = new Object();
			_parseGroupDataExt = new Object();
			_indexMapId = new Object();
			_indexMapIdExt = new Object();
			_parseAnsewrLayoutData = [];
		}
		
		private function get horNumber():int
		{
			return this._horNumber;
		}
		private function get verNumber():int
		{
			return this._verNumber;
		}
		
		/***
		 *  解析数据
		 * */
		private function parseData():void
		{			
			for each( var fillWord:FillWord in this._parseData )
			{
				parseGroupArry(fillWord);
				parseAnswerLayoutArry(fillWord);
			}	
			
		}
		
		/***
		 * 解析响应格子index数组
		 * */
		private function parseGroupArry( fillWord:FillWord):void
		{
			var groupArry:Array = fillWord.getGroupArry(horNumber,verNumber);
			
			trace("*********groupArry:"+groupArry);
			
			for each( var index:int in groupArry )
			{
				if( !this._parseGroupData[index] ) //首要配置库里面没数据，
				{
					//则保存在首要配置库
					_parseGroupData[index] = groupArry;
					_indexMapId[index] = fillWord.id;
					
				}
				else //保存在扩展配置库
				{
					_parseGroupDataExt[index] = groupArry;
					_indexMapIdExt[index] = fillWord.id;
				}
			}						
		}
		
		/****
		 * 解析格子答案布局数组
		 * */
		private function parseAnswerLayoutArry(fillWord:FillWord):void
		{
			var groupArry:Array = fillWord.getGroupArry(horNumber,verNumber);
			var strName:String = fillWord.word;
			
			if( groupArry.length != strName.length ) //只报错，不处理
			{
				trace("ERROR！********长度不一样啊啊！");
				trace("**groupArry.length ："+groupArry.length );
				trace("**strName.length："+strName.length);
			}
			
			for(var i:int=0; i<groupArry.length; i++ )
			{
				_parseAnsewrLayoutData[groupArry[i]]=strName.substr(i,1);
			}			
		}
		
		
		
		
		/***
		 * 获取响应格子数组
		 * */
		public function getGroupArry( index:int ):Array
		{
			return _parseGroupData[index];
		}
		/***
		 * 获取响应格子数组（扩展）
		 * */
		public function getGroupArryExt( index:int ):Array
		{
			if( _parseGroupDataExt[index] )
			{
				return _parseGroupDataExt[index];
			}
			else //不存在就返回默认的
			{
				return _parseGroupData[index];
			}
		}
		
		/***
		 * 获取格子对应词组id
		 * */
		public function getIndexMapId(index:int):int
		{
			return _indexMapId[index];
		}
		/***
		 * 获取格子对应词组id（扩展）
		 * */
		public function getIndexMapIdExt(index:int):int
		{
			if( _indexMapIdExt[index] )
			{
				return _indexMapIdExt[index];								
			}
			else
			{
				return _indexMapId[index];
			}
		}
		
		/***
		 * 获取格子答案布局数组
		 * */
		public function getAnswerLayout():Array
		{
			return _parseAnsewrLayoutData;
		}
		
		
		public function dispose()
		{
			_parseGroupData = null;
			_parseGroupDataExt = null;
			_indexMapId = null;
			_indexMapIdExt = null;
			_parseAnsewrLayoutData = null;
			
			_parseData = null;
		}
	}
}