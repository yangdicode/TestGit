package mmo.play.material
{
	import flash.events.Event;

	public class MaterialViewCreatorEvent extends Event
	{
		/**
		 * 创建视图完成 
		 * view:MovieClip
		 */
		public static const onGetView:String = "onCreateView";
		/**
		 * 获取缩略图完成
		 * sketch:Sprite 
		 */
		public static const onGetIcon:String = "onCreateIcon";
		
		public var id:int;
		public var params:Object = {};
		
		public function MaterialViewCreatorEvent(type:String, id:int, parmas:Object
			, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.id = id;
			this.params = parmas;
		}
		
	}
}