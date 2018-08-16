package mmo.loader.scheduler {
	import flash.net.URLRequest;
	
	public class VersManager {
		public function VersManager() {
			
		}
		
		public static function getVerURLRequest(fileName:String, extenName:String="swf"):URLRequest {
			if (fileName.indexOf(".") == -1) 
			{
				fileName = fileName + "." + extenName;
			}
						
			var urlRequest:URLRequest;
			urlRequest=new URLRequest(fileName);				
		
			return urlRequest;			
		}
		
	}
}