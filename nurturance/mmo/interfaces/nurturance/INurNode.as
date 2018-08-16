package mmo.interfaces.nurturance
{
	public interface INurNode
	{
		function execute(params:Object = null):void;
		
		function forceEnd():void;
		
		function dispose():void;
		
		function setNextNode(node:String = null):void;
		
		function getNextNode():String;
		
		function getNodeInfo():XML;
	}
}