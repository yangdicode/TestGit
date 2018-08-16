package mmo.nurturance
{
	import flash.display.Sprite;
	
	import mmo.nurturance.gamemanager.config.NurCGDefines;
	import mmo.nurturance.gamemanager.config.NurChapterDefines;
	import mmo.nurturance.gamemanager.config.NurCustomNpcsConfig;
	import mmo.nurturance.gamemanager.config.NurEndingDefines;
	import mmo.nurturance.gamemanager.config.NurGameDefines;
	import mmo.nurturance.gamemanager.config.NurNpcName;
	
	public class NurturanceConfDoc extends Sprite
	{
		public function NurturanceConfDoc()
		{
			super();
		}
		
		private function compile():void{
			var nurCGDefines:NurCGDefines;
			var nurChapterDefines:NurChapterDefines;
			var nurEndingDefines:NurEndingDefines;
			var nurGameDefines:NurGameDefines;
			var nurNpcName:NurNpcName;
			var nurCustomNpcsConfig:NurCustomNpcsConfig;
		}
	}
}