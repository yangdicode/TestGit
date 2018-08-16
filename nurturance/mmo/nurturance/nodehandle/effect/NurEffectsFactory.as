package mmo.nurturance.nodehandle.effect
{
	import com.adobe.utils.StringUtil;
	
	import mmo.interfaces.IDispose;

	public class NurEffectsFactory
	{
		private static const EffectConfig:Array = 
			[
				NurEffect0,
				NurEffect1,
				NurEffect2
			];
		
		private static var _effects:Array;
		
		public function NurEffectsFactory()
		{
		}
		
		public static function showEffect(info:XML):void
		{
			if (StringUtil.isEmpty(info.@effect))
			{
				return;
			}
			var effectId:int = int(info.@effect);
			var cls:Class = EffectConfig[effectId];
			var effect:IDispose = new cls(info);
			
			if (_effects == null)
			{
				_effects = [];
			}
			_effects.push(effect);
		}
		
		public static function hideEffect():void
		{
			for each(var effect:IDispose in _effects)
			{
				effect.dispose();
			}
			_effects = null;
		}
	}
}