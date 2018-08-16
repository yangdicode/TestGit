package mmo.nurturance.nodehandle.handler.limit
{
	public class LimitHandlerFactory
	{
		public function LimitHandlerFactory()
		{
		}
		
		public static function createHandler(type:String):ILimit
		{
			var handler:ILimit;
			switch(type)
			{
				case "favor":
					handler = new FavorLimit();
					break;
				case "specialfavor":
					handler = new SpecialFavorLimit();
					break;
				case "max":
					handler = new MaxLimit();
					break;
				case "time":
					handler = new TimeLimit();
					break;
				case "branchFavor":
					handler = new BranchLimit();
					break;
				case "otherFavor":
					handler = new OtherLimit();
					break;
				default:
					handler = new FavorLimit();
			}
			return handler;
		}
	}
}