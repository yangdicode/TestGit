package mmo.nurturance.ui
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	import mmo.common.DisplayUtil;
	import mmo.common.JPGEncoder;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.gamemanager.entity.NurCGDefine;
	import mmo.nurturance.gamemanager.model.NurDefinesProvider;
	import mmo.nurturance.ui.util.NurUIUtil;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.panel.MovieLayerPanel;

	public class NurCGPanel
	{
		private var _mlp:MovieLayerPanel;
		private var _cgDatas:Array;
		
		public function NurCGPanel()
		{
		}
		
		public function show():void{
			_cgDatas = NurDefinesProvider.getCGsByGameId(gameId);
			_mlp = new MovieLayerPanel();
			_mlp.loadRes("nurturance/nursysui/rescg", "mmo.nurturance.sysui.CGPanel", onDispose, onLoadedRes);
		}
		
		private function get gameId():int
		{
			return  NurGameManager.instance.curGameId;
		}
		
		private function onDispose():void{
			_mlp = null;
		}
		
		private function onLoadedRes():void{
			var path:String = "nurturance/nurext/nur" + gameId + "res/cg/thumbnail" ;
			SceneDomainResLoader.loadRes(path, "", onGetThumbnail);
			function onGetThumbnail():void{
				initPanel()
				NurUIUtil.initScrollPanel(_mlp.panel, _mlp.getMc("mcBg"), _mlp.getMc("mcContainer"));
				_mlp.showPanel();
			}
		}
		
		private function initPanel():void{
			DisplayUtil.removeAllChild(_mlp.getMc("mcContainer"));
			for(var i:int = 0; i < _cgDatas.length; i++){
				var item:MovieClip = SceneDomainResLoader.getResByName("mmo.nurturance.sysui.CGPanelItem");
				var cgId:int = NurCGDefine(_cgDatas[i]).id;
				item["itemId"] = cgId;
				addItemToContainer(i, item);
			//	trace(">>>>>>>>>hadFinishCG" + cgId + ":" + hadfinishCG(cgId));
				if(hadfinishCG(cgId)){
					addCGThumbnailToItem(cgId, item);
					SimpleButton(item["btnCheck"]).addEventListener(MouseEvent.CLICK, onClickCheck);
				}else{
					DisplayUtil.applyGray(SimpleButton(item["btnCheck"]));
				}
			}
		}
		
		private function addItemToContainer(id:int, item:MovieClip):void{
			var mcContainer:MovieClip = _mlp.getMc("mcContainer");
			item.x = 10 + 205 * int(id % 4);
			item.y = 10 + 160 * int(id / 4);
//			item["itemId"] = id + 1;
			mcContainer.addChild(item);
		}
		
		private function addCGThumbnailToItem(cgId:int, item:MovieClip):void{
			var iconClsName:String = "mmo.nurturance.nur" + gameId + ".CGThumbnail" + cgId;
			var icon:MovieClip = SceneDomainResLoader.getResByName(iconClsName);
			var iconContainer:MovieClip = item["mcContainer"];
			DisplayUtil.removeAllChild(iconContainer);
			iconContainer.addChild(icon);
		}
		
		private function getCgMcById(itemId:int, callBack:Function):void{
			ProgressFullSprite.show();
			var path:String = "nurturance/nurext/nur" + gameId + "res/cg/cg" + itemId;
			var cls:String = "mmo.nurturance.nur" + gameId + ".CG" + itemId;
			SceneDomainResLoader.loadRes(path, cls, onGetRes);
			function onGetRes(mc:MovieClip):void{
				ProgressFullSprite.close();
				callBack.apply(null, [mc]);
			}
		}
		
		private function hadfinishCG(id:int):Boolean{
			return NurGameManager.instance.gameStateProxy.getCurGameState().hadFinishCG(id);
		}
		
		private function onClickCheck(evt:MouseEvent):void{
			var itemId:int = evt.currentTarget.parent["itemId"] as int;
			var panel:MovieClip = SceneDomainResLoader.getResByName("mmo.nurturance.sysui.CGDetailPanel");
			var cg:MovieClip;
			getCgMcById(itemId, onGetCg);
			function onGetCg(mc:MovieClip):void{
				cg = mc;
				DisplayUtil.replace(MovieClip(panel["mcContainer"]), cg, false);
				SimpleButton(panel["btnDownload"]).addEventListener(MouseEvent.CLICK, onClickDownLoad);
//				SimpleButton(panel["btnShare"]).addEventListener(MouseEvent.CLICK, onClickShare);
				NewDialog.show(panel, null, 0, 0);
			}
			
			function onClickShare(evt:MouseEvent):void
			{
				NurGameManager.instance.share();
			}
			
			function onClickDownLoad(evt:MouseEvent):void{
				var bd:BitmapData = new BitmapData(960, 560); 
				bd.draw(cg);
				var savejpgFileRef:FileReference = new FileReference();
				var jpgEncoder:JPGEncoder = new JPGEncoder();  
				var data:ByteArray = jpgEncoder.encode(bd);
				var des:String;
				for(var i:int = 0; i < _cgDatas.length; i++)
				{
					if(NurCGDefine(_cgDatas[i]).id == itemId)
					{
						des = NurCGDefine(_cgDatas[i]).desc;
						break;
					}
				}
				var name:String = NurDefinesProvider.getGameById(gameId).name + "_" + des + ".jpg";
				savejpgFileRef.save(data, name);
			}
		}
	}
}