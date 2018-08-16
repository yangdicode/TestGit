package mmo.framework.domain.petbreeding
{
	import mmo.framework.domain.petbreeding.StuffInfo;

	public class StuffComposingFormula
	{
		public var id:int;
		public var stuffs:Array;
		public var compound:StuffInfo;
		
		public function StuffComposingFormula(id:int, stuffs:Array, target:StuffInfo)
		{
			this.id = id;
			this.stuffs = stuffs;
			this.compound = target;
		}
	}
}