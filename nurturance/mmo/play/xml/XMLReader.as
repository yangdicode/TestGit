package mmo.play.xml
{
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;

	public class XMLReader
	{
		public function XMLReader()
		{
		}
		
		public static function getNodeAttribute(node:XMLNode, nodeName:String, attrName:String):String {
			var node:XMLNode = getChildNode(node, nodeName);
			if (node == null) {
				return null;
			}
			return node.attributes[attrName];
		}
		
		public static function getChildNode(node:XMLNode, nodeName:String):XMLNode {
			for each(var child:XMLNode in node.childNodes)
			{
				if (child.nodeType==XMLNodeType.ELEMENT_NODE && child.nodeName==nodeName)
				{
					return child;
				}
			}
			return null;
		}
		
		public static function getChildNodesByNodeName(node:XMLNode, nodeName:String):Array {
			var nodes:Array = [];
			for each(var child:XMLNode in node.childNodes)
			{
				if (child.nodeType==XMLNodeType.ELEMENT_NODE && child.nodeName==nodeName)
				{
					nodes.push(child);
				}
			}
			return nodes;
		}
		
		public static function getChildNodes(node:XMLNode):Array {
			var nodes:Array = [];
			for each(var child:XMLNode in node.childNodes)
			{
				if (child.nodeType == XMLNodeType.ELEMENT_NODE)
				{
					nodes.push(child);
				}
			}
			return nodes;
		}
	}
}