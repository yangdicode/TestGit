package mmo.nurturance.nodehandle.node
{
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.play.helper.MoveHelper;
	
	public class MovieNode extends NurExtNode
	{
		private var _path:String;
		private var _name:String;
		public function MovieNode(xml:XML, variables:Object)
		{
			_path = xml.@path;
			_name = xml.@name;
			super(xml);
		}
		
		public override function execute(arg0:Object=null):void
		{
			new MoveHelper().loadAndPlayDialogMovie(_path, _name, onPlayMovie, 0, 0);
		}
		
		private function onPlayMovie():void
		{
			nodeEnd();
		}
	}
}