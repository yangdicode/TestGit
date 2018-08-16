package mmo.nurturance.nodehandle.node
{
	import com.adobe.utils.StringUtil;
	
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.handler.limit.ILimit;
	import mmo.nurturance.nodehandle.handler.limit.LimitHandlerFactory;
	
	public class DecisionNode extends NurExtNode
	{
		public function DecisionNode(xml:XML, variables:Object=null)
		{
			super(xml, variables);
		}
		
		public override function execute(arg0:Object=null):void
		{
			var limitList:XMLList = this._info.br;
			for each(var limit:XML in limitList)
			{
				var limitStrs:Array = (limit.@limit).split(",");
				var passLimit:Boolean = false;
				for(var i:int = 0; i < limitStrs.length; i ++)
				{
					var type:String = limitStrs[i].split(":")[0];
					var limitCls:ILimit = LimitHandlerFactory.createHandler(type);
					passLimit = limitCls.limitResult(limitStrs[i].split(":")[1]);
					trace("type******" + type);
					trace("passLimit******" + passLimit);
					if(!passLimit)
						break;
				}
				if(passLimit)
				{
					if(!StringUtil.isEmpty(limit.@nextKey))
						this.setNextNode(limit.@nextKey);
					nodeEnd();
					return;
				}
				else
				{
					if(type =="time")
					{
						this.setNextNode(null);
						nodeEnd();
						return;
					}
				}
			}
			nodeEnd();
		}
	}
}