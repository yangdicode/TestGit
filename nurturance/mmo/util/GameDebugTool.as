package mmo.util
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import flash.utils.describeType;



	/**
	 * 调试用，显示当前显示对象的类结构
	 * 加入按键输出按键信息
	 * 用法，直接start传入stage即可
	 */
	public class GameDebugTool
	{
		private var _txt:TextField;//显示内容
		private var _contentSpr:Sprite;
		private var _shp:Shape;

		private var _stage:Stage;//舞台

		public function GameDebugTool()
		{
			super();

			_txt = new TextField();
			_txt.multiline = true;
			_txt.width = 200;

			_contentSpr = new Sprite();
			_contentSpr.addChild(_txt);
			_contentSpr.mouseChildren = _contentSpr.mouseEnabled = false;

			_shp = new Shape();

		}


		private static var _instance:GameDebugTool;
		public static function getInstance():GameDebugTool
		{
			if(_instance == null)
			{
				_instance = new GameDebugTool();
			}
			return _instance;
		}


		public function start(stage:Stage):void
		{
			if(stage)
			{
				stage.addEventListener(MouseEvent.MOUSE_OVER, onStageMouseOver);
				stage.addEventListener(MouseEvent.MOUSE_OUT, onStageMouseOut);
				stage.addEventListener(MouseEvent.MOUSE_MOVE, onStageMouseMove);

				_stage = stage;
				stage.addChild(_contentSpr);
			}
		}


		public function stop():void{
			_stage.addEventListener(MouseEvent.MOUSE_OVER, onStageMouseOver);
			_stage.addEventListener(MouseEvent.MOUSE_OUT, onStageMouseOut);
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, onStageMouseMove);
		}


		private function onStageMouseOver(event:MouseEvent):void
		{
			var str:String = "";
			var target:DisplayObject = event.target as DisplayObject;
			while(target)
			{
				str += describeType(target).@name + "\n";
				if(target is Stage || target == target.root)
				{
					target = null;
				}
				else
				{
					target = target.parent;
				}
			}

			_txt.text = str;
			_contentSpr.graphics.clear();
			_contentSpr.graphics.lineStyle(1, 0x0);
			_contentSpr.graphics.drawRect(0, 0, _txt.textWidth+10, _txt.textHeight+10);
			_contentSpr.graphics.beginFill(0xFFFF00, 1);
			_contentSpr.graphics.drawRect(0, 0, _txt.textWidth+10, _txt.textHeight+10);
			_contentSpr.graphics.endFill();

			var obj:DisplayObject = event.target as DisplayObject;
			_shp.graphics.clear();
			_shp.graphics.lineStyle(1, 0xFF0000);
			_shp.graphics.drawRect(0, 0, obj.width+4, obj.height+4);
			_shp.graphics.endFill();

			var pos:Point = obj.localToGlobal(new Point(0, 0));
			_shp.x = pos.x - 2;
			_shp.y = pos.y - 2;

			if(_stage)
			{
				_stage.addChild(_contentSpr);
				_stage.addChild(_shp);
			}
		}

		private function onStageMouseOut(event:MouseEvent):void
		{
			if(_contentSpr.parent)
			{
				_contentSpr.parent.removeChild(_contentSpr);
			}
			if(_shp.parent)
			{
				_shp.parent.removeChild(_shp);
			}
		}

		private function onStageMouseMove(event:MouseEvent):void
		{
			if(_contentSpr.parent)
			{
				if(event.stageX > _stage.stageWidth - _txt.textWidth)
				{
					_contentSpr.x = event.stageX - _txt.textWidth - 15;
				}
				else
				{
					_contentSpr.x = event.stageX + 15;
				}
				if(event.stageY > _stage.stageHeight - _txt.textHeight)
				{
					_contentSpr.y = event.stageY - _txt.textHeight - 15; 
				}
				else
				{
					_contentSpr.y = event.stageY + 15;
				}

			}
		}

	}
}

