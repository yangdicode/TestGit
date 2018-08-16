package mmo.framework.domain.palace
{
	public class UserPalaceChatMsg
	{
		private var _userName:String;
		private var _content:String;
		
		public function UserPalaceChatMsg(userName:String, content:String)
		{
			this._userName = userName;
			this._content = content;
		}
		
		public function get userName():String
		{
			return this._userName;
		}
		
		public function get content():String
		{
			return this._content;
		}
	}
}