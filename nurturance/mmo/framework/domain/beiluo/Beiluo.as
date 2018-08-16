package mmo.framework.domain.beiluo
{
	/***
	* 贝洛问题搜索的数据
	* @author hanjun
	* */
	public class Beiluo
	{
		private var _beiluoId:int;
		private var _beiluoType:String;
		private var _beiluoQuestion:String;
		private var _beiluoAnswer:String;
		
		public function Beiluo(beiluoId:int,beiluoType:String,beiluoQuestion:String,beiluoAnswer:String)
		{
			this._beiluoId = beiluoId;
			this._beiluoType = beiluoType;
			this._beiluoQuestion = beiluoQuestion;
			this._beiluoAnswer = beiluoAnswer;
		}
		
		/**
		 * 问题id号
		 * */
		public function get id():int
		{
			return this._beiluoId;
		}
		
		/***
		 * 问题类型
		 * */
		public function get type():String
		{
			return this._beiluoType;
		}
		
		/***
		 * 问题内容
		 * */
		public function get question():String
		{
			return this._beiluoQuestion;
		}
		
		/***
		 * 问题的答案
		 * */
		public function get answer():String
		{
			return this._beiluoAnswer;
		}
	}
}