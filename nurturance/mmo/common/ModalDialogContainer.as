package mmo.common
{
	import flash.display.Sprite;

	public class ModalDialogContainer extends Sprite
	{
		public function ModalDialogContainer(container:Sprite, grayBackground:Boolean)
		{
			super();
			
//			// 已经有模态框，绘制白色透明背景
//			for(var index:int = 0; index < container.numChildren; index ++){
//				if(container.getChildAt(index) is ModalDialogContainer){
//					grayBackground = false;
//					break;
//				}
//			}
			
			if(grayBackground){
				this.graphics.beginFill(0x000000, 0.6);
			}
			else{
				this.graphics.beginFill(0xFFFFFF, 0.01);
			}
			this.graphics.drawRect(0, 0, 960, 560);
			this.graphics.endFill();			
			
			container.addChild(this);
		}
	}
}