package mmo.framework.domain.aoyatv
{
	public class UserAoYaTVCinemaWord implements IUserAoYaTVCinemaWord
	{
		private var _id:Number;
		private var _type:int;
		private var _userId:int;
		private var _fame:int;
		private var _name:String;
		private var _author:String;
		private var _cover:String;
		private var _len:int;
		private var _recommendCount:int;
		private var _appraiseScore:int;
		
		public function UserAoYaTVCinemaWord()
		{
		}
		
		public static function parse(info:Object):UserAoYaTVCinemaWord{
			var word:UserAoYaTVCinemaWord = new UserAoYaTVCinemaWord();
			word.parseInfo(info);
			return word;
		}
		
		public function parseInfo(info:Object):void{
			_id = info["key"];
			_type = info["t"];
			_userId = info["uid"];
			_fame = info["f"];
			_name = info["n"];
			_author = info["ar"];
			_cover = info["cr"];
			_len = info["l"];
			_recommendCount = info["rt"];
			_appraiseScore = info["s"];
		}
		
		public function get id():Number
		{
			return _id;
		}
		
		public function get type():int
		{
			return _type;
		}
		
		public function get userId():int
		{
			return _userId;
		}
		
		public function get fame():int
		{
			return _fame;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get author():String
		{
			return _author;
		}
		
		public function get cover():String
		{
			return _cover;
		}
		
		// 作品长度
		public function get len():int
		{
			return _len;
		}
		
		// 推荐人数
		public function get recommendCount():int
		{
			return _recommendCount;
		}
		
		// 评分
		public function get appraiseScore():int
		{
			return _appraiseScore;
		}
		
		
	}
}