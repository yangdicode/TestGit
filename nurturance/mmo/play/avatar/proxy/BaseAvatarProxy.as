package mmo.play.avatar.proxy
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	
	import mmo.framework.domain.avatar.AvatarInfo;
	import mmo.framework.domain.avatar.AvatarInfoEvent;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.play.avatar.AvatarEvent;
	import mmo.play.avatar.IAvatarProxy;
	import mmo.play.dialog.NewDialog;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.clothes.ClothesPart;
	
	public class BaseAvatarProxy extends EventDispatcher implements IAvatarProxy
	{
		protected static const DEFAULTSKINID:int = 0;
		
		/**
		 * 当前执行的动作
		 * 必须有默认值，否则Player传入Dressily的时候会因为action为null而找不到衣服对应的元件，从而整个元件大小为(0, 0, 0, 0)的Rectangle 
		 */
		protected var _currentAction:String = "ldzn";
		
		//~ fields ------------------------------------------------------------
		
		protected var avatarInfo:AvatarInfo;
		
		protected var avatarSprite:Sprite;
		
		/** 等待下载的衣服部件，元素为String，衣服编号 */
		private var _waitLoadingArr:Array;
		/** 未下载的衣服部件，元素为String，衣服编号 */
		private var _unLoadingArr:Array;
		
		protected var _inited:Boolean = false;
		
		//~ public methods ----------------------------------------------------
		
		public function BaseAvatarProxy(){
			this.avatarSprite = new Sprite();
			
			this._waitLoadingArr = [];
			this._unLoadingArr = [];
		}
		
		public function action(act:String):Boolean{
			this._currentAction = act;
			return false;
		}
		
		public function currentAction():String{
			return this._currentAction;
		}
		
		public function dispose():void{
			if (this.avatarSprite != null){
				this.avatarSprite = null;
			}
			clearLoadingArray();
			this._waitLoadingArr = null;
			_unLoadingArr = null;
			if (this.avatarInfo){
				this.avatarInfo.removeEventListener(AvatarInfoEvent.PUTON_CLOTHES, onPutOnClothes);
				this.avatarInfo.removeEventListener(AvatarInfoEvent.TAKEOFF_CLOTHES, onTakeOffClothes);
				this.avatarInfo.removeEventListener(AvatarInfoEvent.ONAVATARRESET, onAvatarReset);
				this.avatarInfo = null;
			}
		}
		
		public function getAvatarInfo():AvatarInfo{
			return this.avatarInfo;
		}
		
		/**
		 * 获得用户形象Sprite
		 *
		 * @return	Sprite
		 */
		public function getSprite():Sprite{
			return this.avatarSprite;
		}
		
		public function setAvatarInfo(avatarInfo:AvatarInfo):void{
			if (this.avatarInfo != null){
				_inited = false;
				this.avatarInfo.removeEventListener(AvatarInfoEvent.PUTON_CLOTHES, onPutOnClothes);
				this.avatarInfo.removeEventListener(AvatarInfoEvent.TAKEOFF_CLOTHES, onTakeOffClothes);
				this.avatarInfo.removeEventListener(AvatarInfoEvent.ONAVATARRESET, onAvatarReset);
			}
			this.avatarInfo = avatarInfo;
			this.avatarInfo.addEventListener(AvatarInfoEvent.PUTON_CLOTHES, onPutOnClothes);
			this.avatarInfo.addEventListener(AvatarInfoEvent.TAKEOFF_CLOTHES, onTakeOffClothes);
			this.avatarInfo.addEventListener(AvatarInfoEvent.ONAVATARRESET, onAvatarReset);
			resetSkins();
			addDefaultSkin();
			getSkins();
		}
		
		protected function defaultFilePath():String{
			throw new Error("AvatarProxy::defaultFilePath() is virtual method !!");
		}
		
		protected function defaultImageType():String{
			throw new Error("AvatarProxy::defaultSpriteType() is virtual method !!");
		}
		
		/**
		 * 默认此操作总是异步的,所以需要waitingArr存取
		 *
		 * */
		protected function loadUserClothesPart(clothesPart:ClothesPart):void{
		}
		
		//~ protected methods ----------------------------------------------------
		
		protected function onAvatarInfoChanged():void{
			this.dispatchEvent(new AvatarEvent(AvatarEvent.AVATAR_INFO_CHANGED));
		}
		
		protected function onAvatarSpriteChanged(clothesNo:String):void{
			this.dispatchEvent(new AvatarEvent(AvatarEvent.AVATAR_SPRITE_CHANGED, {"clothesNo": clothesNo}));
		}
		
		protected function onAvatarSpriteComplete():void{
			this.dispatchEvent(new AvatarEvent(AvatarEvent.AVATAR_SPRITE_COMPLETED));
		}
		
		protected final function popWaitingArr(clothesNo:String):void{
			// 异步环境下，有可能等错误返回时，该示例已经被dispose了
			if (_waitLoadingArr == null){
				return;
			}
			killClothesNoInWaitingArray(clothesNo);
			if (_waitLoadingArr.length == 0){
				onAvatarSpriteComplete();
			}
		}
		
		protected final function pushWaitingArr(clothesNo:String):void{
			this._waitLoadingArr.push(clothesNo);
			_unLoadingArr.push(clothesNo);
		}
		
		protected function wearSkins(skin:*, clothesPart:ClothesPart):void{
		}
		
		private function killClothesNoInWaitingArray(clothesNo:String):void{
			var ind:int = _waitLoadingArr.indexOf(clothesNo);
			if (ind >= 0){
				_waitLoadingArr.splice(ind, 1);
			}
		}
		
		protected function killClothesPartsInWatingArray(clothes:Clothes):void{
			for each(var clothesPart:ClothesPart in clothes.parts){
				killClothesNoInWaitingArray(clothesPart.clothesNo);
			}
		}
		
		private function onPutOnClothes(evt:AvatarInfoEvent):void{
			var clothes:Clothes = evt.params["clothes"] as Clothes;
			putOnClothes(clothes);
			checkForWearingPants();
		}
		
		protected function onTakeOffClothes(evt:AvatarInfoEvent):void{
			var clothes:Clothes = evt.params["clothes"] as Clothes;
			killClothesPartsInWatingArray(clothes);
			takeOffClothes(clothes);
			checkAvatarForNaked();
			loadWaitingArr();
		}
		
		private function onAvatarReset(evt:AvatarInfoEvent):void{
			resetSkins();
			getSkins();
		}
		
		protected function putOnClothes(clothes:Clothes):void{
		}
		
		protected function takeOffClothes(clothes:Clothes):void{
		}
		
		/**
		 * 完成清除与初始化的工作
		 * */
		protected function resetSkins():void{
		}
		
		/**
		 * 添加未下载完时的默认显示形象
		 * */
		protected function addDefaultSkin():void{
		}
		
		protected function getShowClothes():Array{
			// 复制一次AvatarInfo中用户拥有的衣服列表的引用
			// 防止下载或缓存过程中，AvatarInfo中的列表被改变
			return this.avatarInfo.getClothes().concat();
		}
		
		//如果没穿 上衣，裤子， 头发， 则换上默认的上衣，裤子，头发
		protected function checkAvatarForNaked():void{
			//dispose时候不再调用此方法。
			if(this.avatarSprite == null){
				return;
			}
			var i:int = 0;
			//上衣id, 裤子id,头发id
			var defaultClothesIds:Array = this.avatarInfo.defaultClothesIds;
			if (!wearingPants()){
				var pantsId:int = defaultClothesIds[1];
				var pants:Clothes = ClothesFacade.instance.getClothesDataById(pantsId);
				pushClothesToWaiting(pants);
			}
			
			if (!wearingShirt()){
				var shirtId:int = defaultClothesIds[0];
				var shirt:Clothes = ClothesFacade.instance.getClothesDataById(shirtId);
				pushClothesToWaiting(shirt);
			}
			
			if (!wearingHair()){
				var hairId:int = defaultClothesIds[2];
				var hair:Clothes = ClothesFacade.instance.getClothesDataById(hairId);
				pushClothesToWaiting(hair);
			}
		}
		
		protected function preLoadClothes(clothes:Clothes):void{
		}
		
		//如果换完衣服，穿了裤子了， 则必须把默认裙子脱掉
		//如果穿了裙子，则默认裙子已经被替换掉了
		protected function checkForWearingPants():void{
			var defaultSkirtId:int = this.avatarInfo.defaultClothesIds[1];
			if (wearingKuzi() && wearingDefaultSkirt()){
				takeOffClothes(ClothesFacade.instance.getClothesDataById(defaultSkirtId));
			}
		}
		
		final protected function clearLoadingArray():void{
			for each(var cloNo:String in _waitLoadingArr){
				cancelLoadClothesPath(ClothesFacade.instance.getClothesPartsDataByNo(cloNo));
			}
			_waitLoadingArr = [];
			_unLoadingArr = [];
		}
		
		protected function cancelLoadClothesPath(clothesPart:ClothesPart):void{
		}
		
		protected function wearingKuzi():Boolean{
			return false;
		}
		
		//穿了裤子或者裙子
		protected function wearingPants():Boolean{
			return false;
		}
		
		//穿了上衣
		protected function wearingShirt():Boolean{
			return false;
		}
		
		//穿了头发
		protected function wearingHair():Boolean{
			return false;
		}
		
		//穿了默认的裙子(女子)或者短裤(男子)
		protected function wearingDefaultSkirt():Boolean{
			return false;
		}
		
		protected function containPosition(clothesPos:int):Boolean{
			return true;
		}
		
		/**
		 * 下载并穿上衣服。
		 */		
		final protected function loadAndPutOnClothes(clothes:Clothes):void{
			pushClothesToWaiting(clothes);
			loadWaitingArr();
		}
		
		//~ private methods ---------------------------------------------------
		
		private function getSkins():void{
			//由于重新设置AvatarInfo的时候需要清空_waitLoadingArr
			//因为SkinProxy下载已经被resetSkins()移除，所以等待下载的队列也需要被清空
			clearLoadingArray();
			
			var skins:Array = getShowClothes();
			//先记下要下载的衣服
			for each (var clothes:Clothes in skins){
				pushClothesToWaiting(clothes);
			}
			checkAvatarForNaked();
			//再下载。
			loadWaitingArr();
		}
		
		private function pushClothesToWaiting(clothes:Clothes):void{
			preLoadClothes(clothes);
			for each (var clothesPart:ClothesPart in clothes.parts){
				if (containPosition(clothesPart.clothesPos)){
					pushWaitingArr(clothesPart.clothesNo);
				}
			}
		}
		
		private function loadWaitingArr():void{
			while(_unLoadingArr != null && _unLoadingArr.length > 0){
				var cloNo:String = _unLoadingArr.shift();
				var clothesPart:ClothesPart = ClothesFacade.instance.getClothesPartsDataByNo(cloNo);
				loadUserClothesPart(clothesPart);
			}
		}
	}
}