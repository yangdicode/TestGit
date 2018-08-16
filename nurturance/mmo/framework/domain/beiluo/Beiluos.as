package mmo.framework.domain.beiluo
{
	import flash.system.ApplicationDomain;

	/***
	 * 贝洛问题搜索的数据
	 * @author hanjun
	 * */
	public class Beiluos
	{
		private var _data:Object; //保存所有数据
		private var _tempIdData:Array = []; //保存外部请求的数组,保存问题的id号
		
		public function Beiluos()
		{
			getData();
		}
		
		
		// 读取所有数据		 
		private function getData():void
		{
			_data = new Object();
			
			var beiluoDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.BeiluoData") as Class;
			_data = beiluoDataClass["data"];
			
		}
		
		private function getBeiluoById( id: int):Beiluo
		{
			return _data[id];
		}
		
		//由类型获取问题数组
		private function getQustionByType( type:String ):void 
		{
			_tempIdData = [];
			
			for each( var beiluo:Beiluo in _data)
			{
				if( type =="全部" || beiluo.type == type )
				{
					_tempIdData.push(beiluo.id);
				}
			}			
		}
		
		//搜索关键字获取问题数组
		private function getQuestionByKey( key:String ):void
		{
			_tempIdData = [];
			
			for each( var beiluo:Beiluo in _data)
			{
				if( beiluo.question.search(key)!= -1 )
				{
					_tempIdData.push(beiluo.id);
				}				
			}
		}
		
		/***
		 * 获取引索号数组长度
		 * @param type:问题类型
		 * @return 数组长度
		 * */
		public function getIndexArryLengthByType(type:String):int
		{
			getQustionByType(type);
			
			return _tempIdData.length;
		}
		
		/***
		 * 获取引索号数组长度
		 * @param key:问题的关键字
		 * @return 数组长度
		 * */
		public function getIndexArryLengthByKey(key:String):int
		{
			getQuestionByKey(key);
			
			return _tempIdData.length;
		}
		
		/***
		 * 由引索号返回问题的名字数组
		 * @param quesIndex:引索数组，存放的是问题id的引索号
		 * */
		public function getQuesNameByIndex( quesIndex:Array ):Array
		{
			var nameArry:Array = [];
			var beiluo:Beiluo;
			
			for( var i:int =0; i<quesIndex.length; i++ )
			{
				beiluo = getBeiluoById(_tempIdData[quesIndex[i]]);
				nameArry.push(beiluo.question);
			}
			
			return nameArry
		}
		
		/***
		 * 获取问题数据by引索
		 * */
		public function getQuestionDataByIndex(index: int):Array
		{			
			var quesData:Array = [];			
			var beiluodata:Beiluo = getBeiluoById(_tempIdData[index]);
			
			quesData[0]=(index+1)+"、"+beiluodata.question;
			quesData[1]=beiluodata.answer;
			
			return quesData;
		}
		
		
		public function dispose():void
		{
			_tempIdData = null;
			_data = null;
		}
	}
}