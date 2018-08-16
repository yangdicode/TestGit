package mmo.play.tips.commands {
	
	import mmo.util.command.ISceneCommand;
	import mmo.util.command.SceneMacroCommand;
	
	public class ShowTipsCommand extends SceneMacroCommand implements ISceneCommand {
		
		//~ public methods ----------------------------------------------------
		
		public function ShowTipsCommand() {
			super();
		}
		
		//~ protected function ------------------------------------------------
		
		override protected function initializeMacroCommand():void {
			addSubCommand(DelayCommand);
			addSubCommand(DownloadTipCommand);
			addSubCommand(PopUpTipsCommand);
			super.initializeMacroCommand();
		}
		
	}
}