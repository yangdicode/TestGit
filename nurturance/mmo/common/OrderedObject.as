package mmo.common
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	dynamic public class OrderedObject extends Proxy
	{
		private var content:Object = {};
		private var contentByIndex:Array = [];
		
		override flash_proxy function deleteProperty(name:*):Boolean
		{
			var wasDeleted:Boolean = delete content[name];
			
			if (wasDeleted) {
				var n:int = contentByIndex.length;
				
				for (var i:int = 0; i < n; i++) {
					if (contentByIndex[i] == name) {
						contentByIndex.splice(i, 1);
						break;
					}
				}
			}
			
			return wasDeleted;
		}
		
		override flash_proxy function getProperty(name:*):*
		{
			return content[name];
		}
		
		override flash_proxy function hasProperty(name:*):Boolean
		{
			return content.hasOwnProperty(name);
		}
		
		override flash_proxy function nextName(index:int):String
		{
			return contentByIndex[index - 1];
		}
		
		override flash_proxy function nextNameIndex(index:int):int
		{
			if (index < contentByIndex.length)
				return index + 1;
			else
				return 0;
		}
		
		override flash_proxy function nextValue(index:int):*
		{
			return content[contentByIndex[index - 1]];
		}
		
		override flash_proxy function setProperty(name:*, value:*):void
		{
			content[name] = value;
			
			for each (var p:* in contentByIndex) {
				if (p == name)
					// If the property already exists, don't change the order.
					return;
			}
			
			contentByIndex.push(name);
		}
	}
	
}