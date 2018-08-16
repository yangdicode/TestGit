package mmo.interfaces
{
	public class SingleLocator extends DefaultLocator
	{
		private var service:IService;
		
		public function SingleLocator(serviceInfo:ServiceInfo)
		{
			super(serviceInfo);
		}

		public override function getInstance():IService{
			if(service == null){
				service = super.getInstance();
			}
			
			return service;
		}
	}
}