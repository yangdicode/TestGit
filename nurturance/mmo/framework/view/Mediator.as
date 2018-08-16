package mmo.framework.view
{
	import flash.display.DisplayObject;
	
	import mmo.framework.view.IMediator;
	
	public class Mediator implements IMediator
	{
		private var _view:DisplayObject;
		public function Mediator()
		{
		}
		
		public function initialize():void
		{
			
		}	
		
		public function get view():DisplayObject
		{
			return _view;
		}
		
		public function set view(_view:DisplayObject):void
		{
			this._view = _view;
		}
		
		public function dispose():void
		{
			_view = null;
		}	
	}
}