package mmo.nurturance.ui.multi
{
	import mmo.play.multipage.LoadPageBase;
	
	public class NurMultiPage1 extends LoadPageBase
	{
		private const needCost:Array = [];
		public function NurMultiPage1()
		{
			super();
		}
		
		override protected function get file():String{
			return "nurturance/nursysui/resmulti";
		}
		
		override protected function get className():String{
			return "mmo.nurturance.sysui.MutilPage" + _key;
		}
		
		override public function dispose():void{
			
		}
		
		override protected function initPage():void{
			//todo 有空再写，主要是领奖励条件而已。。。
			super.initPage();
		}
	}
}