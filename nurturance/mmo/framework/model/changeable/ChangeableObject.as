package mmo.framework.model.changeable
{
	import flash.events.EventDispatcher;
	
	public class ChangeableObject extends EventDispatcher implements IChangeableObject
	{
		protected var changeProperties:Array = [];
		protected var values:Object = {};
		
		public function ChangeableObject()
		{
		}
		
		public function setValue(property:String, value:Object):void
		{
			var orgValue:Object = null;
			if(this.values.hasOwnProperty(property))
			{
				orgValue = this.values[property];
			}	
			
			if(value == orgValue)
			{
				return;
			}
			
			this.values[property] = value;
			
			if(this.changeProperties.indexOf(property) == -1)
			{
				this.changeProperties.push(property);
			}
			this.dispatchPropertyChanged(property, orgValue, value);
		}
		
		public function getValue(property:String):Object
		{
			if(this.values.hasOwnProperty(property))
			{
				return this.values[property];
			}
			
			return null;
		}
		
		/**
		 * 分发属性改变事件 
		 * @param property
		 * @param orgValue
		 * @param newValue
		 * 
		 */
		protected function dispatchPropertyChanged(property:String, orgValue:Object
			, newValue:Object):void
		{
			ChangeableDispatcher.instance.disChangedObject(this,property,orgValue,newValue);
		}
		
		public override function toString():String
		{
			var info:String = "";
			for each(var property in this.changeProperties)
			{
				info += property + ":" + this.values[property] + " ";
			}
			return info;
		}
	}
}