package mmo.nurturance.nodehandle.handler
{
	public class ChangePropsObject
	{
		private var _values:Object = {};
		public function ChangePropsObject()
		{
		}
		
		public function setValue(property:String, value:*):void
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
		}
		
		public function addValue(property:String, value:*):void
		{
			trace("addValue  property***" + property);
			trace("addValue  value***" + value);
			if(int(value) == 0)
				return;
			if(!this.values.hasOwnProperty(property))
			{
				this.values[property] = value;
			}
			else
			{
				this.values[property] += value;
			}
		}

		public function get values():Object
		{
			return _values;
		}

		public function set values(value:Object):void
		{
			_values = value;
		}

	}
}