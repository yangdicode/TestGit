package mmo.framework.domain.union
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.domain.union.top.UnionInnerTopInfo;
	import mmo.framework.domain.union.top.UnionOuterTopInfo;
	import mmo.framework.domain.union.top.UnionTopInfo;

	public class UnionClient
	{
		private static const ExtId:int = 105;
		
		public static function viewUserMemberInfo(userName:String, callBack:Function):void{
			sendExtMsg("105_17", {"un":userName}, callBack);
		}
		
		public static function sendExtMsg(cmd:String, params:Object = null, callBack:Function = null):void{
			SocketClient.instance.sendXtMsgAndCallBack(ExtId, cmd, callBack, params);
		}
		
		/**
		 * extTop
		 * @param callBack [UnionTopInfo]
		 */		
		public static function viewUnionExtTop(key:String, callBack:Function):void{
			sendExtMsg("105_3_1", {"key":key}, onView);
			function onView(params:Object):void{
				var arr:Array = [];
				if(params.ret == 0){
					var info:Array = params.top;
					for(var i:int = 0; i < info.length; i ++){
						arr.push(new UnionTopInfo(i + 1, info[i].unin, info[i].value, info[i].unid));
					}
				}
				callBack.apply(null, [arr]);
			}
		}
		/**
		 * extRanking
		 * @param callBack rk:int, score:int
		 */		
		public static function viewMyUnionExtRanking(key:String, callBack:Function):void{
			sendExtMsg("105_3_2", {"key":key}, onViewMyRank);
			function onViewMyRank(param:Object):void{
				callBack.apply(null, [param.rk + 1, param.v]);
			}
		}
		
		/**
		 * innerTop
		 * @param callBack [UnionInnerTop]
		 */		
		public static function viewUnionInnerTop(key:String, callBack:Function):void{
			sendExtMsg("105_3_3", {"key":key}, onView);
			function onView(params:Object):void{
				var arr:Array = [];
				if(params.ret == 0){
					var info:Array = params.top;
					for(var i:int = 0; i < info.length; i ++){
						arr.push(new UnionInnerTopInfo(i + 1, info[i].unin, info[i].value));
					}
				}
				callBack.apply(null, [arr]);
			}
		}
		/**
		 * innerRanking
		 * @param callBack rk:int, score:int
		 */		
		public static function viewMyUnionInnerRanking(key:String, callBack:Function):void{
			sendExtMsg("105_3_4", {"key":key}, onViewMyRank);
			function onViewMyRank(param:Object):void{
				callBack.apply(null, [param.rk + 1, param.v]);
			}
		}
		
		/**
		 * outerTop
		 * @param callBack [UnionOuterTopInfo]
		 */		
		public static function viewUnionOuterTop(key:String, callBack:Function):void{
			sendExtMsg("105_3_5", {"key":key}, onView);
			function onView(params:Object):void{
				var arr:Array = [];
				if(params.ret == 0){
					var info:Array = params.top;
					for(var i:int = 0; i < info.length; i ++){
						arr.push(new UnionOuterTopInfo(i + 1, info[i].un, info[i].value, info[i].unid, info[i].unin));
					}
				}
				callBack.apply(null, [arr]);
			}
		}
		/**
		 * outerRanking
		 * @param callBack rk:int, score:int
		 */		
		public static function viewMyUnionOuterRanking(key:String, callBack:Function):void{
			sendExtMsg("105_3_6", {"key":key}, onViewMyRank);
			function onViewMyRank(param:Object):void{
				callBack.apply(null, [param.rk + 1, param.v]);
			}
		}
		
	}
}