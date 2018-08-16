package mmo.framework
{
	import flash.display.Sprite;
	
	import mmo.framework.comm.SocketClient;
	import mmo.framework.control.AoyaEventCenter;
	import mmo.framework.control.Command;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.community.CommunityInfoKey;
	import mmo.framework.domain.community.LanternRiddleClient;
	import mmo.framework.domain.tempprop.PropKeyTypes;
	import mmo.framework.model.changeable.CompileChangeables;
	import mmo.framework.view.Mediator;
	import mmo.framework.view.ViewMediatorConfig;
	
	public class FrameworkDocClass extends Sprite
	{
		public function FrameworkDocClass()
		{
		}
		
		private function compileMe():void
		{
			var mainModelLoactor:MainModelLocator;
			var changables:CompileChangeables;
			var command:Command;
			var mediator:Mediator;
			var vmc:ViewMediatorConfig;
			var socketClient:SocketClient;
			var eventCenter:AoyaEventCenter;
			
			var lanternRiddle:LanternRiddleClient;
			
			var propKeyTypes:PropKeyTypes;
			var communityInfoKey:CommunityInfoKey;
		}	
	}
}