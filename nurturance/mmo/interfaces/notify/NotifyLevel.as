package mmo.interfaces.notify
{
	public class NotifyLevel
	{
		//必须连续，外面用数组循环
		public static const Normal:int = 0;
		public static const Member:int = 1;
		public static const Fight:int = 2;
		
		public static const size:int = 3;
		public function NotifyLevel()
		{
		}

	}
}