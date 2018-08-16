package mmo.nurturance.nodehandle.variables
{
	public class NurVariableBuilder
	{
		public function NurVariableBuilder()
		{
		}
		
		public static function buildNurVariablesByXml(config:XML):INurVariables
		{
			var type:String = config.@type;
			switch(type)
			{
				case (null || NurVariableTypes.INFO):
					return new NurExtData(config);
			}
			throw new Error("没有实现此种类型的变量:" + type);
		}
	}
}