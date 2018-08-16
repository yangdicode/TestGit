package mmo.framework.domain.petbreeding
{
	import flash.system.ApplicationDomain;

	public class PetBreedingDomain
	{
		private static var _domain:ApplicationDomain;
		
		public static function get myDomain():ApplicationDomain
		{
			if(_domain == null)
			{
				_domain = new ApplicationDomain();
			}
			return _domain;
		}
		
		public function PetBreedingDomain()
		{
		}
		
		public static function release():void
		{
			_domain = null;
		}
	}
}