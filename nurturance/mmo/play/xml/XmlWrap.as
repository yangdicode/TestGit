package mmo.play.xml
{
	import flash.utils.Dictionary;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;

	public class XmlWrap
	{
		private var _childs:Vector.<XmlWrap>;
		private var _attrs:Dictionary;
		private var _name:String;
		
		public function XmlWrap(name:String) {
			this._attrs = new Dictionary();
			this._childs = new Vector.<XmlWrap>();
			this._name = name;
		}
		
		public function putInt(name:String, value:int):void 
		{
			this._attrs[name] = value.toString();
		}
		
		public function putBool(name:String, value:Boolean):void 
		{
			this._attrs[name] = value ? "1" : "0";
		}
		
		public function putString(name:String, value:String):void 
		{
			this._attrs[name] = value;
		}
		
		public function putNumber(name:String, value:Number):void
		{
			this._attrs[name] = value;
		}
		
		public function addNode(xmlWrap:XmlWrap):void 
		{
			this._childs.push(xmlWrap);
		}
		
		public function toXml():String
		{
			var doc:XMLDocument = new XMLDocument();
			var ele:XMLNode = this.toElement(doc);
			return ele.toString();
		}
		
		private function toElement(doc:XMLDocument):XMLNode {
			var node:XMLNode = doc.createElement(this._name);
			for each(var xmlWrap:XmlWrap in this._childs) 
			{
				node.appendChild(xmlWrap.toElement(doc));
			}
			for (var key:* in this._attrs)
			{
				node.attributes[key] = this._attrs[key];
			}
			return node;
		}
	}
}