package mmo.loader.scheduler
{
	import flash.display.Loader;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	public class ResStorageType
	{
		/**
		 * 主要是指资源的应用程序域的问题
		 * 如果是共享库文件，则加载到主域，
		 * 如果是动态资源，则加载到子域
		 * 
		 * */
		public static const PERSISTENT:ResStorageType = new ResStorageType(1);
		
		public static const TEMPORARY:ResStorageType = new ResStorageType(2);
		
		private var _domain:*;
		public function ResStorageType(domain:*)
		{
			_domain = domain;
		}
		
		public function get loaderContext():LoaderContext
		{
			return new LoaderContext(false, applicationDomain);
		}	
		
		public function releaseDomain():void
		{
			if(_domain is ApplicationDomain)
			{
				_domain = null;
			}	
		}	
		
		public function get applicationDomain():ApplicationDomain
		{
			if(_domain is int)
			{
				switch(int(_domain))
				{
					case 1:
						return ApplicationDomain.currentDomain;
					case 2:
						return null;
				}	
			}	
			
			if(_domain is ApplicationDomain)
			{
				return _domain as ApplicationDomain;
			}
			return null;
		}	
	}
}