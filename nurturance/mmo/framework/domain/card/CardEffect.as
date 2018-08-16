package mmo.framework.domain.card
{
	public class CardEffect
	{
		private var _movieType:String;
		private var _actionType:String;
		public function CardEffect(movieType:String, actionType:String)
		{
			_movieType = movieType;
			_actionType = actionType;
		}

		public function get movieType():String
		{
			return _movieType;
		}

		public function get actionType():String
		{
			return _actionType;
		}
	}
}