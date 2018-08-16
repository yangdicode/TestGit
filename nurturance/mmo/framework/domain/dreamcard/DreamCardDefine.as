package mmo.framework.domain.dreamcard
{
	public class DreamCardDefine
	{
		private var _id:int;
		private var _name:String;
		private var _cardType:int;
		private var _score:int;
		private var _launchDate:String;
		private var _subjectId:int;
		private var _gainWay:String;
		private var _outDate:String;
		
		public function DreamCardDefine(id:int, name:String, cardType:int, score:int, 
			launchDate:String, subjectId:int, gainWay:String, outDate:String){
			_id = id;
			_name = name;
			_cardType = cardType;
			_score = score;
			_launchDate = launchDate;
			_subjectId = subjectId;
			_gainWay = gainWay;
			_outDate = outDate;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get cardType():int
		{
			return _cardType;
		}

		public function get score():int
		{
			return _score;
		}

		public function get launchDate():String
		{
			return _launchDate;
		}

		public function get subjectId():int
		{
			return _subjectId;
		}

		public function get gainWay():String
		{
			return _gainWay;
		}

		public function get outDate():String
		{
			return _outDate;
		}


	}
}