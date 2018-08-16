package mmo.util.command {
	
	import flash.events.IEventDispatcher;

	public interface ISceneCommand extends IEventDispatcher {

		function execute(content:Object):void;
		
		function cancel():void;
		
	}
}