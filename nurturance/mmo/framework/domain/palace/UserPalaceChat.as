package mmo.framework.domain.palace
{
	public class UserPalaceChat
	{
		private var _newCount:int;
		private var _msgs:Array;
		private var _isTalking:Boolean;
		
		public function UserPalaceChat()
		{
			this._msgs = [];
			this.resetNewCount();
		}
		
		public function get newCount():int
		{
			return this._newCount;
		}
		
		public function addNewMsg(msg:UserPalaceChatMsg):void
		{
			this.addMsg(msg);
			if (!this._isTalking)
			{
				this._newCount++;
			}
		}
		
		public function addMsg(msg:UserPalaceChatMsg):void
		{
			if (this._msgs.length >= 500)
			{
				this._msgs.shift();
			}
			this._msgs.push(msg);
		}
		
		public function resetNewCount():void
		{
			this._newCount = 0;
			this._isTalking = false;
		}
		
		public function get msgs():Array
		{
			return this._msgs;
		}
		
		public function setIsTalking():void
		{
			this._isTalking = true;
		}
		
		public function get isTalking():Boolean
		{
			return this._isTalking;
		}
	}
}