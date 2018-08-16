package mmo.framework.domain.survey
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;

	/**
	 * 后台反馈，问卷调查
	 * @author liyawei
	 */	
	
	public class SurveyClient
	{
		private static const extensionName:String = "SurveyExtension";
		private static var _instance:SurveyClient;
		
		public static const cmdAddFeedback:String = "35_1";    //后台反馈
		public static const cmdSubmitSurvey:String = "35_2";   //问卷调查
		
		public static const cmdReportSurvey:String = "35_3";   //举报
		
		public static const CMD_QUESTION_BY_KEYWORD:String = "35_4";
		public static const CMD_QUESTION_BY_ID:String = "35_5";
		
		public static const CMD_ADD_SUGGESTION:String = "35_6";
		
		public function SurveyClient()
		{
		}
		
		public static function get instance():SurveyClient
		{
			if(_instance == null)
			{
				_instance = new SurveyClient();
			}	
			return _instance;
		}
		
		private function sendXtMessage(cmd:String,params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extensionName,cmd,params);
		}
		
		/**
		 * 增加用户反馈消息
		 * */
		public function addFeedback(content:String, where:String):void
		{
			var params:Object=new Object();
			params.content=content;
			params.where=where;
			this.sendXtMessage(cmdAddFeedback, params);
		}
		
		/**
		 * 提交调查问卷
		 * */
		public function submitSurvey(answers:Array, surveyName:String):void
		{
			var params:Object=new Object();
			params.answers=answers;
			params.surveyName=surveyName;
			this.sendXtMessage(cmdSubmitSurvey, params);
		}
		
		/**
		 * 举报
		 * */
		public function reportSurvey(userName:String, type:int, desc:String):void
		{
			var params:Object = {"userName" : userName, "type":type, "description" : desc};
			this.sendXtMessage(cmdReportSurvey, params);
		}
		
		/**
		 * 知了问答，根据关键词搜索 
		 */
		public function getQuestionByKeyword(keyWord:String):void
		{
			this.sendXtMessage(CMD_QUESTION_BY_KEYWORD,{"key":keyWord});
		}
		
		/**
		 * 知了问答，根据id搜索 
		 */
		public function getQuestionById(qid:int):void
		{
			this.sendXtMessage(CMD_QUESTION_BY_ID,{"id":qid});
		}
		
		public static function sendSuggestion(key:int, suggestion:String, callBack:Function):void{
			sendExtAndCallBack(CMD_ADD_SUGGESTION, {"k":key, "s":suggestion}, callBack);
		}
		
		public static function sendExtAndCallBack(cmd:String, params:Object = null, callBack:Function = null):void
		{
			SocketClient.instance.sendXtMsgAndCallBack(extensionName, 
				cmd, callBack, params);
		}
		
	}
}