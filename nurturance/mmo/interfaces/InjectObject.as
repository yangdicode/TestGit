package mmo.interfaces
{
	/**
	 * 注入定义 
	 * @author hekehui
	 * 
	 */
	public class InjectObject
	{
		public var property:String = "";
		public var serviceNames:Array = [];
		
		public function InjectObject(property:String, services:*)
		{
			this.property = property;
			
			if(services is String)
			{
				this.serviceNames.push(services);
			}
			if(services is Array)
			{
				this.serviceNames = services;
			}
		}

	}
}