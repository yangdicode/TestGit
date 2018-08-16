package mmo.framework.domain.fillword
{
	/***
	 * 填字游戏的数据
	 * @author hanjun
	 * */
	public class FillWord
	{
		private var _id:int;
		private var _weekly:int;
		private var _word:String;
		private var _firstX:int;
		private var _firstY:int;
		private var _isHorize:Boolean;
		private var _number:int;
		private var _depict:String;
		
		public function FillWord(id:int, //id编号
								 weekly:int, //第几期周刊
								 word:String, //词组
								 firstRow:int, //首字在第几行
								 firstLine:int, //首字在第几列
								 isHorize:int, //方向，横向为true
								 number:int, //几个字
								 depict:String //描述
								)
		{
			this._id = id;
			this._weekly = weekly;
			this._word = word;
			this._firstX = firstRow;
			this._firstY = firstLine;
			this._isHorize =Boolean(isHorize);
			this._number = number;
			this._depict = depict;
		}
		
		/***
		 * 数据编号
		 * */
		public function get id():int
		{
			return this._id;
		}
		
		/***
		 * 周刊号
		 * */
		public function get weekly():int
		{
			return this._weekly;
		}
		
		/***
		 * 词组
		 * */
		public function get word():String
		{
			return this._word;
		}
		
		/***
		 * 首字横坐标
		 * */
		public function get firstX():int
		{
			return this._firstX;
		}
		
		/***
		 * 首字纵坐标
		 * */
		public function get firstY():int
		{
			return this._firstY;
		}
		
		/***
		 * 词组方向
		 * */
		public function get isHorize():Boolean
		{
			return this._isHorize;
		}
		
		/***
		 * 字数
		 * */
		public function get number():int
		{
			return this._number;
		}
		
		/***
		 * 描述
		 * */
		public function get depict():String
		{
			return this._depict;
		}
		
		public function getGroupArry(horSize:int,verSize:int):Array
		{
			var groupArry:Array = [];
			
			var index:int = (this.firstX-1)+(this.firstY-1)*verSize;
			groupArry.push(index);//首个字
			for(var i:int=1; i<this.number; i++)
			{
				index += 1*(int(!this.isHorize)) + verSize*(int(this.isHorize));
				groupArry.push(index);
			}
			
			return groupArry;
		}
	}
}