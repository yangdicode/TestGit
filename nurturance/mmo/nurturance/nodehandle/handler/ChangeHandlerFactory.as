package mmo.nurturance.nodehandle.handler
{
	public class ChangeHandlerFactory
	{
		public function ChangeHandlerFactory()
		{
		}
		
		public static function createHandler(type:String):IChange
		{
			var handler:IChange;
			switch(type)
			{
				case "favor":
					handler = new FavorHandler();
					break;
				case "specialfavor":
					handler = new SpecialFavorHandler();
					break;
				case "branchFavor":
					handler = new BranchFavorHandler();
					break;
				case "otherFavor":
					handler = new OtherFavorHandler();
					break;
				default:
					handler = new FavorHandler();
			}
			return handler;
		}
	}
}