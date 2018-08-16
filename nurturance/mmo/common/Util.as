package mmo.common
{

	import Box2D.Dynamics.b2World;

	import com.adobe.crypto.MD5;
	import com.adobe.serialization.json.JSONCode;
	import com.adobe.utils.ArrayUtil;
	import com.adobe.utils.NumberUtilities;
	import com.adobe.utils.StringUtil;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.data.TweenLiteVars;
	import com.greensock.easing.Back;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.EaseLookup;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.FastEase;
	import com.greensock.easing.Linear;
	import com.oaxoa.fx.Lightning;
	import com.oaxoa.fx.LightningFadeType;

	import flash.display.MovieClip;
	import flash.utils.getTimer;

	import mmo.common.cachepool.CachePool;
	import mmo.common.dialog.DialogControl;
	import mmo.common.effect.Effect;
	import mmo.common.filters.AdjustColorFilter;
	import mmo.common.math.Ellipse;
	import mmo.common.math.Vector2D;
	import mmo.common.moviecache.MovieBitmapCacher;
	import mmo.common.objectpool.IObjectPoolFactory;
	import mmo.common.objectpool.ObjectPool;
	import mmo.common.panel.PanelEffect;
	import mmo.common.textfieldultra.LinkText;
	import mmo.common.textfieldultra.TextFieldUltra;
	import mmo.util.GameDebugTool;
	import mmo.util.MessageManager;
	import mmo.util.command.SceneMacroCommand;
	import mmo.util.command.SceneSimpleCommand;
	import mmo.util.component.ValueBar;
	import mmo.util.component.button.RadioButton;
	import mmo.util.component.filter.Filter;
	import mmo.util.component.label.SimpleLinkLabel;
	import mmo.util.component.page.PageComponent;
	import mmo.util.component.page.tool.PageTool;
	import mmo.util.component.quantity.QuantityComponent;
	import mmo.util.constants.EventListenerPriority;
	import mmo.util.quadtree.QuadTree;

	import nl.demonsters.debugger.MonsterDebugger;

	import org.puremvc.PureMVCRef;

	public class Util extends MovieClip
	{
		public function Util()
		{
			//this.test();
		}

		private function test():void
		{
			trace("test begin " + getTimer());

			var movie:MovieClip = this.getChildAt(0) as MovieClip;
			MovieClip(movie).gotoAndStop(1);
			new MovieBitmapCacher(movie).cacheMovie(
				function():void{
					movie.gotoAndPlay(1);
					trace("test end " + getTimer());
				}, this);
		}

		private function compliteMe()
		{
			var alignType:AlignType;
			var dateUtil:DateUtil;
			var defaultText:DefaultText;
			var displayUtil:DisplayUtil;
			var dragSetting:DragSetting;
			var hitTest:HitTest;
			var shapeCache:ShapeCache;
			var text:Text;

			var acf:AdjustColorFilter;
			var op:ObjectPool;
			var iopf:IObjectPoolFactory;

			MD5.hash("s");
			var jso:JSONCode;
			var su : StringUtil;
			var au : ArrayUtil;
			NumberUtilities.compileMe();


			var tweenLite:TweenLite;
			var tweenMax:TweenMax;
			var tweenLiteVars:TweenLiteVars;
			var timelineLite:TimelineLite;
			var liner:Linear;
			var back:Back;
			var elastic:Elastic;
			var cubic:Cubic;
			var fastEase:FastEase;
			var easeLookUp:EaseLookup;

			var customStyleSheet:CustomStyleSheet;

			var puremvc:PureMVCRef;

			var macroCommand:SceneMacroCommand;
			var simpleCommand:SceneSimpleCommand;

			var lighting:Lightning;
			var lightingTypeFacade:LightningFadeType;

			var elp:EventListenerPriority;

			var cachePool:CachePool;

			var qt:QuadTree;

			var crp:CommonRegExp;
			var du:DateUtil;

			var pc:PageComponent;
			var filter:Filter;
			var vb:ValueBar;
			var qc:QuantityComponent;

			var mbc:MovieBitmapCacher;

			var modelDialog:ModalDialog;

			var effects:Effect;

			var panelEffect:PanelEffect;

			var dialogControl:DialogControl;

			var textFieldUltra:TextFieldUltra;

			var orderObject:OrderedObject;

			var ellipse:Ellipse;

			var debugger:MonsterDebugger;

			var vector2d:Vector2D;

			var encrypt:Encrypt;
			var bitString:BitString;
			var jPGEncoder:JPGEncoder;

			var confuseInteger:ConfuseInteger;
			var tool:PageTool;
			var radio:RadioButton;

			var ansiUnicodeConvert:AnsiUnicodeConvert;
			var hanziToPinyinUtil:HanziToPinyinUtil;

			var box2DWorld:b2World;

			GameDebugTool;
			MessageManager;

			LinkText;
			CommonData;

			SimpleLinkLabel;

			DisplayAlign;
		}

	}
}

