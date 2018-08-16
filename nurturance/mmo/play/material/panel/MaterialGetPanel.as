package mmo.play.material.panel
{
	import com.adobe.utils.StringUtil;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.common.panel.PanelEvent;
	import mmo.framework.domain.card.Card;
	import mmo.framework.domain.card.Cards;
	import mmo.framework.domain.fairy.Fairys;
	import mmo.framework.domain.halos.HaloLightInfo;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.framework.domain.material.clothes.ClothesType;
	import mmo.framework.domain.material.gitem.GItem;
	import mmo.framework.domain.material.gitem.GItemTypes;
	import mmo.framework.domain.npcbattle.NpcBattles;
	import mmo.framework.domain.profession.Professions;
	import mmo.framework.domain.property.AttrType;
	import mmo.framework.domain.sound.SoundFile;
	import mmo.interfaces.ServiceContainer;
	import mmo.interfaces.rangers.IRangersService;
	import mmo.interfaces.superstar.ISuperStarService;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.play.card.CardViewFacade;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.eventdispatcher.CommonEvent;
	import mmo.play.eventdispatcher.CommonEventDispatcher;
	import mmo.play.fairy.FairyFacade;
	import mmo.play.halos.HalosFacad;
	import mmo.play.helper.MyMaterHelper;
	import mmo.play.material.IMaterialFacade;
	import mmo.play.material.MaterialFacade;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.gitem.GItemFacade;
	import mmo.play.material.supermarketitem.SupermarketItemFacade;
	import mmo.play.material.supermarketitem.SupermarketItemViewCreator;
	import mmo.play.npcbattle.NpcBattleFacade;
	import mmo.play.sound.SoundPlayer;

	public class MaterialGetPanel
	{
		private static var _instance:MaterialGetPanel;
		
		//面板类型
		private const ItemPanelType:int = 0;
		private const TipsPanelType:int = 1;
		private const MoneyExpType:int = 2;
		private const CardPanelType:int = 3;
		private const PropertyPanelType:int = 4;
		private const YubiType:int = 5;
		private const FairyType:int = 6;
		private const USER_NPC_TYPE:int = 7;
		private const USER_NPC_FAVOR_TYPE:int = 8;
		private const BoutiqueCoin:int = 9;
		private const SuperStar:int = 10;
		private const USER_HALO_TYPE:int = 11;
		private const Rangers:int = 12;
		
		private var tips:MovieClip;
		
		private var queue:Array;
		private var isProcessing:Boolean = false;
		private var currentObj:Object;
		
		private var _showLayer:Sprite;
		
		public function MaterialGetPanel()
		{
			this.queue = [];
		}
		
		public static function instance():MaterialGetPanel
		{
			if(_instance == null)
			{
				_instance = new MaterialGetPanel();
			}
			return _instance;
		}
		
		/**
		 * 设置显示层次，只在当前ShowAllMaterialGetTips未抛出之前有效
		 * @param layer
		 */		
		public function set showLayer(layer:Sprite):void
		{
			this._showLayer = layer;
		}
		
		/**
		 * 将层次设置为默认层
		 */		
		private function resetShowLayer():void
		{
			this._showLayer = null;
		}
		
		/**
		 * 获得金钱和经验的面板
		 * funcBack:关闭面板时触发，无参数
		 * */
		public function showMoneyAndExpPanel(money:int, exp:int, funcBack:Function = null, ext:int = 0):void
		{
			var obj:Object = {};
			obj.money = money;
			obj.exp = exp;
			obj.ext = ext;
			obj.type = MoneyExpType;
			obj.funcBack = funcBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 获得只有经验的面板
		 * */
		public function showExpPanel(exp:int, funcBack:Function = null, ext:int = 0):void
		{
			this.showMoneyAndExpPanel(0,exp,funcBack, ext);
		}
		
		/**
		 * 获得只有金钱的面板
		 **/
		public function showMoneyPanel(money:int, funcBack:Function = null):void
		{
			this.showMoneyAndExpPanel(money,0,funcBack);
		}
		
		/**
		 * 获得羽贝的面板
		 */
		public function showYubiPanel(num:int, callback:Function = null):void
		{
			var obj:Object = {};
			obj.yubi = num;
			obj.type = YubiType;
			obj.funcBack = callback;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 获得物品的普通面板
		 * funcBack:关闭面板时触发，无参数
		 * */
		public function showMaterialPanel(materialType:int, mid:int, num:int, funcBack:Function = null):void
		{
			var obj:Object = {};
			obj.materialType = materialType;
			obj.mid = mid;
			obj.num = num;
			obj.type = ItemPanelType;
			obj.funcBack = funcBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * tips图标显示获得，飞入物品栏
		 * */
		public function showTips(materialType:int, mid:int, num:int, funcBack:Function = null):void
		{
			var obj:Object = {};
			obj.materialType = materialType;
			obj.mid = mid;
			obj.num = num;
			obj.type = TipsPanelType;
			obj.funcBack = funcBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 显示获得卡片面板
		 */		
		public function showCardPanel(cardId:int,cardNum:int = 1,funcBack:Function = null):void
		{
			var obj:Object = {};
			obj.cardId = cardId;
			obj.cardNum = cardNum;
			obj.type = CardPanelType;
			obj.funcBack = funcBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 显示属性提升面板
		 * proObj[property] = {changeNum};
		 */		
		public function showPropertyPanel(proObj:Object,funcBack:Function = null):void
		{
			var obj:Object = {};
			obj.proObj = proObj;
			obj.type = PropertyPanelType;
			obj.funcBack = funcBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 显示精灵面版
		 */		
		public function showFairyPanel(fairyId:int, num:int, callBack:Function = null):void{
			var obj:Object = {};
			obj.fairyId = fairyId;
			obj.num = num;
			obj.type = FairyType;
			obj.funcBack = callBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 显示npc面版
		 */		
		public function showUserNpcPanel(userNpcId:int, num:int, callBack:Function = null):void{
			var obj:Object = {};
			obj.userNpcId = userNpcId;
			obj.num = num;
			obj.type = USER_NPC_TYPE;
			obj.funcBack = callBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/** 显示npc好感度面板 **/
		public function showUserNpcFavorPanel(npcId:int, num:int, callBack:Function = null):void{
			var obj:Object = {};
			obj.npcId = npcId;
			obj.num = num;
			obj.type = USER_NPC_FAVOR_TYPE;
			obj.funcBack = callBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 显示精品币面板
		 */		
		public function showBoutiqueCoinPanel(num:int, callBack:Function = null):void{
			var obj:Object = {};
			obj.num = num;
			obj.type = BoutiqueCoin;
			obj.funcBack = callBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		public function showGetSuperStarPanel(sids:Array):void{
			var obj:Object = {"sids":sids, "type":SuperStar};
			this.queue.push(obj);
			this.processQueue();
		}
		
		public function showGetRangersPanel(urIds:Array):void{
			var obj:Object = {"urIds":urIds, "type":Rangers};
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**
		 * 显示光环面版
		 */		
		public function showUserHaloPanel( objData:Object, callBack:Function = null):void{
			var obj:Object = {};
			obj.data = objData;
			obj.type = USER_HALO_TYPE;
			obj.funcBack = callBack;
			this.queue.push(obj);
			this.processQueue();
		}
		
		/**--------------private function ---------------**/
		
		/**
		 * 羽贝面板
		 */
		private function handleYubiPanel(num:int):void
		{
			if (num > 0)
			{
				ResScheduler.getResource("material/materialpanel", function(content:MovieClip)
				{
					TextField(MovieClip(content.getChildByName("mcYubi")).getChildByName("txt")).text = num.toString() + "羽贝";
					showDlgPanel(content);
				}, "mmo.material.panel.YubiPanel");
			}
		}
		
		/**
		 * 金钱面板
		 * */
		private function handleMoneyPanel(money:int):void
		{
			if (money > 0)
			{
				ResScheduler.getResource("material/materialpanel", function(content:MovieClip)
				{
					TextField(MovieClip(content.getChildByName("mcMoney")).getChildByName("txt")).text = money.toString() + "金币";
					showDlgPanel(content);
				}, "mmo.material.panel.MoneyPanel");
			}
		}
		
		/**
		 * 经验面板
		 * */
		private function handleExpPanel(exp:int, ext:int):void
		{
			if (exp > 0)
			{
				var tips:String = "";
				var baseExp:int = exp - ext;
				var extExp:int = ext;
				if(extExp == 0)
				{
					tips = baseExp.toString() + "点奥雅之光";
				}
				else
				{
					tips = baseExp.toString() + "+<font color='#ff0000'>(" + extExp.toString() + ")</font>" + "点奥雅之光";
				}
				ResScheduler.getResource("material/materialpanel", function(content:MovieClip)
				{
					TextField(MovieClip(content.getChildByName("mcExp")).getChildByName("txt")).htmlText = tips;
					showDlgPanel(content);
				}, "mmo.material.panel.ExpPanel");
			}
		}
		
		/**
		 * 金钱经验面板
		 * */
		private function handleMoneyAndExpPanel(money:int, exp:int):void
		{
			ResScheduler.getResource("material/materialpanel", function(content:MovieClip)
			{
				if (money > 0)
				{
					TextField(MovieClip(content.getChildByName("mcMoney")).getChildByName("txt")).text = money.toString() + "金币";
				}
				else
				{
					MovieClip(content.getChildByName("mcMoney")).visible = false;
				}
				if (exp > 0)
				{
					TextField(MovieClip(content.getChildByName("mcExp")).getChildByName("txt")).text = exp.toString();
				}
				else
				{
					MovieClip(content.getChildByName("mcExp")).visible = false;
				}
				showDlgPanel(content);
			}, "mmo.material.panel.MoneyExpPanel");
		}
		
		/**
		 * 获得卡片面板
		 */		
		private function handleCardPanel(cardId:int,cardNum:int):void
		{
			ResScheduler.getResource("material/materialpanel",function(content:MovieClip)
			{
				var cardView:Sprite = CardViewFacade.instance.getCard(cardId);
				DisplayUtil.placeOn(content["cardPlace"],cardView,false);
				var card:Card = Cards.getCard(cardId);
				var txtMsg:String = card.name;
				TextField(content["skillName"]).text = txtMsg;
				
				var proLimits:Array = card.proLimit;
				var proNames:Array = [];
				for each(var proId:int in proLimits){
					proNames.push(Professions.getProfession(proId).name);
				}
				TextField(content["proLimit"]).text = StringUtil.join(proNames, "、");
				
				showDlgPanel(content);
			},"mmo.material.panel.CardPanel");
		}
		
		/**
		 * 获得属性面板
		 */		
		private function handleProPanel(proObj:Object):void
		{
			ResScheduler.getResource("material/materialpanel",function(content:MovieClip)
			{
				for(var i:int = 1; i <= 5; i++){
					var newPro:int = AttrType.getAttrValue(i);
					var changePro:int = proObj[AttrType.getAttrKeyByNo(i)]?proObj[AttrType.getAttrKeyByNo(i)]:0;
					setAddProTxt(changePro,content["_addPro" + i.toString()]);
					var oldPro:int = newPro - changePro;
					TextField(content["_prePro" + i.toString()]).text = oldPro.toString();
					TextField(content["_newPro" + i.toString()]).text = newPro.toString();
				}
				
				showDlgPanel(content);
			},"mmo.material.panel.PropertyPanel");
		}
		
		/**
		 * 精灵面版
		 */		
		private function handleFairyPanel(id:int):void{
			ResScheduler.getResource("material/materialpanel", onGetFairyPanel, "mmo.material.panel.FairyPanel");
			function onGetFairyPanel(panel:Sprite):void{
				var icon:DisplayObject = FairyFacade.instance.getSmallIcon(id, 30, 30);
				icon.scaleX = icon.scaleY = 0.6;
				var iconContainer:Sprite = panel["ct"];
				while (iconContainer.numChildren > 0){
					iconContainer.removeChildAt(0);
				}
				iconContainer.addChild(icon);
				TextField(panel["txt"]).text = Fairys.getFairyById(id).name + "×" + currentObj.num;
				TextField(panel["txt2"]).text = "已经放入你的精灵背包内了!";
				showDlgPanel(panel);
			}
		}
		
		/**
		 * npc面版
		 */		
		private function handleUserNpcPanel(id:int):void{
			ResScheduler.getResource("material/materialpanel", onGetFairyPanel, "mmo.material.panel.UserNpcView");
			function onGetFairyPanel(panel:Sprite):void{
				var icon:DisplayObject =NpcBattleFacade.getNpcIcon(id, 30, 30);
				icon.scaleX = icon.scaleY = 1.6;
				var iconContainer:Sprite = panel["ct"];
				while (iconContainer.numChildren > 0){
					iconContainer.removeChildAt(0);
				}
				iconContainer.addChild(icon);
				TextField(panel["txt"]).text = NpcBattles.getNpcDefineById(id).name + "×" + currentObj.num;
				TextField(panel["txt2"]).text = "快打开“战斗—编队”状态栏查看吧！!";
				showDlgPanel(panel);
			}
		}
		
		/**
		 * npc好感度面版
		 */		
		private function handleUserNpcFavorPanel(id:int,inc:int):void{
			ResScheduler.getResource("material/materialpanel", onGetFairyPanel, "mmo.material.panel.UserNpcFavorView");
			function onGetFairyPanel(panel:Sprite):void{
				var icon:DisplayObject =NpcBattleFacade.getNpcIcon(id);
				//icon.scaleX = icon.scaleY = 1.6;
				var iconContainer:Sprite = panel["ct"];
				while (iconContainer.numChildren > 0){
					iconContainer.removeChildAt(0);
				}
				iconContainer.addChild(icon);
				TextField(panel["txt"]).text = NpcBattles.getNpcDefineById(id).name+"好感度增加了"+inc+"点!";
				showDlgPanel(panel);
			}
		}
		
		/**
		 *精品币面版
		 */		
		private function handleBoutiqueCoinPanel(inc:int):void{
			ResScheduler.getResource("material/materialpanel", onGetBoutiqueCoinPanel, "mmo.material.panel.BoutiqueCoin");
			function onGetBoutiqueCoinPanel(panel:Sprite):void{
				TextField(panel["txt"]).text = "精品币×" + inc.toString();
				showDlgPanel(panel);
			}
		}
		
		/**
		 *精品店面版
		 */		
		private function handleBoutiquePanel():void{
			ResScheduler.getResource("material/materialpanel", onGetBoutiquePanel, "mmo.material.panel.BoutiquePanel");
			function onGetBoutiquePanel(panel:Sprite):void{
				showBoutiqueItemView(panel["view"]);
				TextField(panel["txt"]).text = SupermarketItemFacade.instance.getMaterialById(currentObj.mid).name + "×" + currentObj.num;;
				showDlgPanel(panel);
			}
		}
		private function showBoutiqueItemView(containter:Sprite):void
		{
			var viewCreator:SupermarketItemViewCreator = new SupermarketItemViewCreator();
			var icon:DisplayObject = viewCreator.getIcon(currentObj.mid, 45, 45);
			DisplayUtil.middleAddChild(containter, icon);
		}
		
		/**
		 * 光环面版
		 */		
		private function handleUserHaloPanel(objData:Object):void{
			ResScheduler.getResource("material/materialpanel", onGetHaloPanel, "mmo.material.panel.UserHaloView");
			function onGetHaloPanel(panel:Sprite):void{
				var haloId:int = objData["style"];
				var color:int = objData["color"];
				var mainFrameId:int = objData["mainDecoration"];
				var sideFrameId:int = objData["sideDecoration"];
				var info:HaloLightInfo = new HaloLightInfo(haloId,color,mainFrameId,sideFrameId);
				MyMaterHelper.addIcon(panel["icon"], HalosFacad.getHaloUserCardView(info));
				showDlgPanel(panel);
			}
		}
		
		private function setAddProTxt(changePro:int,addPro:TextField):void
		{
			if(changePro == 0){
				addPro.text = "";
			}else if(changePro > 0){
				addPro.text = "+" + changePro.toString();
			}else{
				addPro.text = changePro.toString();
			}
		}
		
		private function onClickClosePanel(evt:PanelEvent):void
		{
			MovieClip(evt.currentTarget).removeEventListener(PanelEvent.REMOVED,onClickClosePanel);
			
			if (currentObj.funcBack != null)
			{
				(currentObj.funcBack as Function).apply(null);
			}
			this.isProcessing = false;
			this.processQueue();
		}
		
		private function showDlgPanel(content:Sprite):void
		{
			content.addEventListener(PanelEvent.REMOVED,onClickClosePanel);
			NewDialog.show(content,_showLayer);
		}
		
		private function closeGetStarPanel():void{
			this.isProcessing = false;
			processQueue();
		}
		
		private function showGainRanger(urIds:Array):void{
			ProgressFullSprite.show();
			ServiceContainer.instance.tryGetService(IRangersService, onGetRangerService);
			function onGetRangerService(service:IRangersService, params:Object):void{
				ProgressFullSprite.close();
				service.showGainRanger(urIds, closeGetStarPanel);
			}
		}
		
		private function processQueue():void
		{
			if (this.isProcessing)
			{
				return;
			}
			if (this.queue.length <= 0)
			{
				this.resetShowLayer();
				CommonEventDispatcher.instance.dispatchEvent(new CommonEvent(CommonEvent.ShowAllMaterialGetTips));
				return;
			}
			
			this.isProcessing = true;
			this.currentObj = this.queue.shift();
			if(currentObj.type == SuperStar){
				ISuperStarService(ServiceContainer.getService(ISuperStarService)).showGetStarPanel(currentObj.sids, closeGetStarPanel);
				return;
			}
			
			if(currentObj.type == Rangers){
				showGainRanger(currentObj.urIds);
				return;
			}
			
			if (this.currentObj.type == MoneyExpType)
			{
				if(currentObj.money == 0 && currentObj.exp == 0){
					this.isProcessing = false;
					this.processQueue();
					return;
				}
				else if (currentObj.money == 0 && currentObj.exp != 0)
				{
					this.handleExpPanel(currentObj.exp, currentObj.ext);
				}
				else if (currentObj.money != 0 && currentObj.exp == 0)
				{
					this.handleMoneyPanel(currentObj.money);
				}
				else
				{
					this.handleMoneyAndExpPanel(currentObj.money, currentObj.exp);
				}
			}
			else if(this.currentObj.type == CardPanelType)
			{
				this.handleCardPanel(currentObj.cardId,currentObj.cardNum);
			}
			else if(this.currentObj.type == PropertyPanelType)
			{
				this.handleProPanel(currentObj.proObj);
			}
			else if(this.currentObj.type == YubiType)
			{
				this.handleYubiPanel(this.currentObj.yubi);
			}else if(this.currentObj.type == FairyType){
				this.handleFairyPanel(this.currentObj.fairyId);
			}else if(this.currentObj.type == USER_NPC_TYPE){
				this.handleUserNpcPanel(this.currentObj.userNpcId);
			}else if(this.currentObj.type == USER_NPC_FAVOR_TYPE){
				this.handleUserNpcFavorPanel(this.currentObj.npcId,this.currentObj.num);
			}
			else if (this.currentObj.type == BoutiqueCoin)
			{
				this.handleBoutiqueCoinPanel(this.currentObj.num);
			}
			else if (this.currentObj.type == USER_HALO_TYPE)
			{
				this.handleUserHaloPanel(this.currentObj.data);
			}
			else
			{
				trace(this + "什么物品变化啊：" + currentObj.materialType + ", " + MaterialTypes.SUPERMARKET);
				if (currentObj.materialType == MaterialTypes.SUPERMARKET)
				{
					this.handleBoutiquePanel();
				}
				else
				{
					this.getView();
				}
			}
		}
		
		private function getView():void
		{
			var mf:IMaterialFacade = MaterialFacade.getFacade(currentObj.materialType);
			currentObj.view = mf.getIcon(currentObj.mid,40,40);
			
			currentObj.mName = mf.getMaterialById(currentObj.mid).name;
			currentObj.mDesc = mf.getMaterialById(currentObj.mid).description;
			this.getPanelOrTips();
		}
		
		private function getPanelOrTips()
		{
			if (currentObj.type == ItemPanelType)
			{
				this.getPanel();
			}
			else
			{
				this.getTips();
			}
		}
		
		private function getPanel():void
		{
			ResScheduler.getResource("material/materialpanel", onGetPanel, "mmo.material.panel.Panel");
		}
		
		private function onGetPanel(content:MovieClip):void
		{
			var pos:String = "";
			if (currentObj.materialType == MaterialTypes.PETITEM)
			{
				MovieClip(content.getChildByName("mcPos")).gotoAndStop(3);
				pos = "宠物家园";
			}
			else if (currentObj.materialType == MaterialTypes.FURNITURE)
			{
				MovieClip(content.getChildByName("mcPos")).gotoAndStop(2);
				pos = "家园仓库";
			}
			else if (currentObj.materialType == MaterialTypes.EQUIPCARDITEM)
			{
				MovieClip(content.getChildByName("mcPos")).gotoAndStop(4);
				pos = "战斗背包";
			}else if (currentObj.materialType == MaterialTypes.PLANTITEM)
			{
				MovieClip(content.getChildByName("mcPos")).gotoAndStop(5);
				pos = "花园口袋";
			}else if(currentObj.materialType == MaterialTypes.GITEM){
				MovieClip(content.getChildByName("mcPos")).gotoAndStop(1);
				var gitem:GItem = GItemFacade.instance.getMaterialById(currentObj.mid) as GItem;
				if(gitem.type == GItemTypes.CandyCrushItem){
					pos = "甜心国度的冒险背包";
				}else if(gitem.type == GItemTypes.SuperStarSingle ||gitem.type == GItemTypes.SuperStarTeam){
					pos = "绚梦星团背包";
				}else{
					pos = "个人背包";
				}
			}else if(currentObj.materialType == MaterialTypes.CLOTHES){
				MovieClip(content.getChildByName("mcPos")).gotoAndStop(1);
				var clothes:Clothes = ClothesFacade.instance.getClothesDataById(currentObj.mid);
				if(clothes.type == ClothesType.SuperStarClothes){
					pos = "绚梦星团衣橱";
				}else{
					pos = "个人背包";
				}
			}
			else
			{
				MovieClip(content.getChildByName("mcPos")).gotoAndStop(1);
				pos = "个人背包";
			}
			
			var mc:MovieClip = MovieClip(content.getChildByName("ct"));
			while (mc.numChildren > 0)
			{
				mc.removeChildAt(0);
			}
			mc.addChild(currentObj.view);
			
			TextField(content.getChildByName("txt")).text = currentObj.mName + "×" + currentObj.num.toString();
			TextField(content.getChildByName("txt2")).text = "已经放入你的" + pos + "内了！";
			
			var txtDesc:String = "<font color = '#FF6600'>"+currentObj.mName+"："+ "</font>";
			txtDesc += currentObj.mDesc;
			TextField(content.getChildByName("txt3")).htmlText = txtDesc;
			
			MovieClip(content.mc).play();
			showDlgPanel(content);
		}
		
		private function getTips():void
		{
			ResScheduler.getResource("material/materialpanel", onGetTips, "mmo.material.panel.Tips");
		}
		
		private function onGetTips(content:MovieClip):void
		{
			new SoundPlayer().playSound(SoundFile.getItemSound);
			
			this.tips = content;
			this.tips.gotoAndPlay(1);
			
			NewDialog.show(tips,this._showLayer,-73,173,false);
			tips.addEventListener(PanelEvent.REMOVED, this.onRemovedTips);
			
			this.tips.addFrameScript(14, onFrame14);
			this.tips.addFrameScript(17, onFrame17);
			this.tips.addFrameScript(25, onFrame25);
			this.tips.addFrameScript(26, onFrame25);
			this.tips.addFrameScript(36, onFrame25);
			this.tips.addFrameScript(59, onFrame60);
		}
		
		private function onRemovedTips(evt:PanelEvent):void
		{
			evt.target.addEventListener(PanelEvent.REMOVED, this.onRemovedTips);
			this.isProcessing = false;
		}
		
		private function onFrame14():void
		{
			var mc:MovieClip = this.tips.getChildByName("item") as MovieClip;
			while (mc.numChildren > 0)
			{
				mc.removeChildAt(0);
			}
			mc.addChild(currentObj.view);
			var rect:Rectangle = new Rectangle();
			rect.size = new Point(30, 30);
			DisplayUtil.align(currentObj.view, rect);
		}
		
		private function onFrame17():void
		{
			var txt:TextField = this.tips.getChildByName("tName") as TextField;
			txt.text = currentObj.mName;
		}
		
		private function onFrame25():void
		{
			var txt:TextField = this.tips.getChildByName("tNum") as TextField;
			txt.text = currentObj.num.toString();
		}
		
		private function onFrame60():void
		{
			NewDialog.closeDialog(tips);
			
			DisplayUtil.stop(this.tips);
			this.tips = null;
			
			if (currentObj.funcBack != null)
			{
				(currentObj.funcBack as Function).apply(null);
			}
			this.isProcessing = false;
			this.processQueue();
		}
	}
}