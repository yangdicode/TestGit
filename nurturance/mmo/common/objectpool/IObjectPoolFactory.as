package mmo.common.objectpool {
	
	public interface IObjectPoolFactory {
		function create():*;
		function dispose():void;
	}
	
}
