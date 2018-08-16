package mmo.nurturance.nodehandle.node
{
	import com.adobe.utils.StringUtil;
	
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.System;
	
	import mmo.nurturance.NurturanceAdvertiseHelper;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.gamemanager.model.NurDefinesProvider;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.panel.CommonPanel;

	public class EndingNodeResult
	{
		private var _result:CommonPanel;
		private var _num:int;
		private var _value:String;
		private var _info:XML;
		private var _callback:Function;
		
		public function EndingNodeResult(info:XML, callback:Function)
		{
			_info = info;
			_callback = callback;
			
			onFinishEnding();
		}
		
		private function onFinishEnding():void
		{
			ProgressFullSprite.show(false);
			switch(int(_info.@ext))
			{
				case 1:_num = 5;break;
				case 2:_num = 10;break;
				case 3:_num = 15;break;
				case 4:_num = 20;break;
				case 5:_num = 30;break;
			}
			var request:URLRequest = new URLRequest();
			//不知道为啥缓存了url，所以加个time保证url不一样。
			request.url = "http://service.aoya.100bt.com/giftCode.jsp?src=7k7k&ext=" + _info.@ext + "&time=" + new Date().time;
			//			request.url = "http://service.myaox1.com:8888/giftCode.jsp?src=7k7k&ext=" + _info.@ext;
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onCompleteHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onTraceError);
			loader.load(request);
		}
		
		private function onTraceError(evt:IOErrorEvent):void
		{
			ProgressFullSprite.close();
			var loader:URLLoader = evt.currentTarget as URLLoader;
			loader.removeEventListener(Event.COMPLETE, onCompleteHandler);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onTraceError);
		
			_callback.apply();
		}
		
		private function onCompleteHandler(evt:Event):void
		{
			ProgressFullSprite.close();
			
			var loader:URLLoader = evt.currentTarget as URLLoader;
			loader.removeEventListener(Event.COMPLETE, onCompleteHandler);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onTraceError);
			
			var resultXml:XML = new XML(loader.data);
			var code:String = resultXml.c;
			if(code != "suc")
			{
				NewDialog.showMessage("提交出错，请重新尝试。");
				return;
			}
			_value = resultXml.v;
			
			_result = new CommonPanel();
			_result.addClickFunc("btnOK", gotoAoya);
			_result.loadRes("nurturance/nursysui/ending", "mmo.nurturance.EndingResult", _callback, onLoadResult)
		}
		
		private function gotoAoya():void
		{
			NurturanceAdvertiseHelper.gotoAoYa();
		}
		
		private function onLoadResult():void
		{
			if (!StringUtil.isEmpty(this._info.@endingId))
			{
				_result.getTxt("txtName").text = NurDefinesProvider.getEndingByGameIdEndingId(NurGameManager.instance.curGameId, int(this._info.@endingId)).name + "的结局";
			}
			else if(!StringUtil.isEmpty(this._info.@chapterId))
			{
				_result.getTxt("txtName").text = NurDefinesProvider.getChapterByGameIdChapterId(NurGameManager.instance.curGameId, int(this._info.@chapterId)).name + "的章节";
			}
			else
			{
				_result.getTxt("txtName").text = "";
			}
			
			_result.getTxt("txtNum").text = String(_num);
			_result.getTxt("txtCode").text = String(_value);
			
			var btnOK:SimpleButton = _result["btnOK"];
			btnOK.addEventListener(MouseEvent.CLICK, onClickOK);
			_result.showPanel();
		}
		
		private function onClickOK(evt:MouseEvent):void
		{
			System.setClipboard(_value);
		}
	}
}