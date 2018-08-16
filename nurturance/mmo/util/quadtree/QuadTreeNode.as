package mmo.util.quadtree {
	
	public class QuadTreeNode {
		
		public var parent:QuadTreeNode;
		
		public var proxyList:QuadTreeProxy;

		public var xmin:int, xmax:int;
		public var ymin:int, ymax:int;

		public function insert(proxy:QuadTreeProxy):void {
			proxy.prevInNode = null;
			proxy.nextInNode = proxyList;
			
			if(proxyList) {
				proxyList.prevInNode = proxy;
			}
			proxyList = proxy;
			
			proxy.node = this;
		}
		
	}
}