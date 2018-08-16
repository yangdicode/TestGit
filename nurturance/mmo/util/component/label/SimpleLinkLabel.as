package mmo.util.component.label
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;


	/**
	 * @author xuguowei
	 * 创建时间：2016-1-26 下午3:09:40
	 * 功能：简单带下滑线文本
	 */
	public class SimpleLinkLabel
	{
		private var _tf:TextField;
		private var _defaultPoint:Point;

		public function SimpleLinkLabel(tf:TextField)
		{
			_tf = tf;
			_tf.mouseEnabled = true;

			setUndelineLine(true);
			_defaultPoint = new Point(_tf.x,_tf.y);

			_tf.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_tf.addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
			if(_tf.stage){
				_tf.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			}else{
				_tf.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			}

		}

		private function onMouseOver(e:MouseEvent):void{
			Mouse.cursor=MouseCursor.BUTTON;
			_tf.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
		}

		private function onMouseOut(e:MouseEvent):void{
			Mouse.cursor=MouseCursor.AUTO;
			_tf.removeEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
		}


		private function onAddToStage(e:Event):void{
			_tf.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			_tf.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		}


		private function onMouseDown(e:MouseEvent):void{
			_tf.y = _defaultPoint.y -3;
		}

		private function onMouseUp(e:MouseEvent):void{
			_tf.y = _defaultPoint.y;
		}

		public function dispose():void{
			_tf.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_tf.removeEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
			_tf.removeEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
			if(_tf.stage){
				_tf.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			}else{
				_tf.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			}
			setUndelineLine(false);
			_tf = null;
		}

		private function setUndelineLine(flag:Boolean):void{
			var defaultFormat:TextFormat = _tf.defaultTextFormat;
			defaultFormat.underline = flag;
			_tf.defaultTextFormat = defaultFormat;
			_tf.text = _tf.text;
		}


	}
}

