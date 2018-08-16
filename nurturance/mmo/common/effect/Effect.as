package mmo.common.effect
{
	import mmo.common.effect.appear.AppearEffect;
	import mmo.common.effect.appear.DisappearEffect;
	import mmo.common.effect.fade.FadeInEffect;
	import mmo.common.effect.fade.FadeOutEffect;
	import mmo.common.effect.popup.PopDownEffect;
	import mmo.common.effect.popup.PopUpEffect;

	public class Effect
	{
		public function Effect()
		{
			var popupEffect:PopUpEffect;
			var popdownEffect:PopDownEffect;
			
			var fadeInEffect:FadeInEffect;
			var fadeOutEffect:FadeOutEffect;
			
			var appear:AppearEffect;
			var disappear:DisappearEffect;
		}
		
		public function dispose():void
		{
			
		}	
	}
}