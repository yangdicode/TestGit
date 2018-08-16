package mmo.play.avatar.proxy
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	
	import mmo.common.DisplayUtil;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.play.avatar.AlbumHalfAvatarSprite;
	import mmo.play.avatar.AvatarEvent;
	import mmo.play.avatar.IAlbumAvatarProxy;
	import mmo.play.avatar.SkinPosInfo;
	import mmo.play.avatar.skinviewhelper.ISkinviewHandler;
	import mmo.play.avatar.skinviewhelper.SkinviewHelper;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.clothes.ClothesPart;

	public class AlbumAvatarProxy extends BaseAvatarProxy implements IAlbumAvatarProxy
	{
		//~ constants ---------------------------------------------------------
		private static const CONFIG_TYPE:String = "_BINFO";
		private static const FILE_PATH:String = "skinview/";
		private static const IMAGE_TYPE:String = "_B";
		
		private var _avatarContainer:Sprite;
		private var _viewHelper:AlbumViewHelper;
		private var _avatarHalf:AlbumHalfAvatarSprite;
		
		private var _clickable:Boolean;
		
		//视图
		protected var _skins:Array;
		//数据
		protected var _skinNos:Array;
		
		private var _skinviewHandlers:Object = {};
		
		/**
		 * 是否是半身象
		 * */
		private var _isHalfAvatar:Boolean;
		private var _isMagicMakeUp:Boolean;
		
		/**
		 *
		 * @param clickable		单件服装是否响应鼠标点击
		 * @param isMagicMakeUp	是否魔妆店用的。
		 */
		public function AlbumAvatarProxy(clickable:Boolean = false, isHalfAvatar:Boolean = false, isMagicMakeUp:Boolean = false)
		{
			super();

			this._clickable = clickable;
			_isHalfAvatar = isHalfAvatar;
			_isMagicMakeUp = isMagicMakeUp;
			
			this._skins = [];
			_skinNos = [];
			// 新建一层容器来装服装
			// 使得调整位置比较容易
			this._avatarContainer = new Sprite();
			this.avatarSprite.addChild(this._avatarContainer);
		}
		
		public function getHalfSprite(width:int, height:int):Sprite
		{
			if (this._avatarHalf == null)
			{
				this._avatarHalf = new AlbumHalfAvatarSprite();
			}
			this._avatarHalf.setHalfAvatarSprite(width, height);
			return this._avatarHalf;
		}

		override public function dispose():void{
			if (this._viewHelper != null){
				this._viewHelper.dispose();
				this._viewHelper = null;
			}
			if (this._avatarHalf != null)
			{
				this._avatarHalf.dispose();
				this._avatarHalf = null;
			}

			disposeSkins();
			super.dispose();
		}

		override protected function putOnClothes(clothes:Clothes):void{
			loadAndPutOnClothes(clothes);
		}

		public function getSpriteForFixed(width:int, height:int):Sprite{
			if (this._viewHelper != null){
				this._viewHelper.dispose();
			}

			this._viewHelper = new AlbumViewHelper(this, this._avatarContainer, width, height);
			var sp:Sprite = getSprite();
			return sp;
		}

		public function replace(placeHolder:DisplayObject):Sprite{
			var sp:Sprite = this.avatarSprite;
			if (placeHolder.parent == null){
				return sp;
			}
			sp.x = placeHolder.x;
			sp.y = placeHolder.y;
			placeHolder.parent.addChildAt(sp, placeHolder.parent.getChildIndex(placeHolder));

			DisplayUtil.stopAndRemove(placeHolder);

			return sp;
		}
		
		override protected function resetSkins():void{
			this._skins = [];
			this._skinNos = [];
		}
		
		override protected function takeOffClothes(clothes:Clothes):void{
			for each (var cp:ClothesPart in clothes.parts){
				//将尚未被覆盖的部位移除
				if (_skins[cp.clothesPos] && _skinNos[cp.clothesPos] == cp.clothesNo){
					DisplayUtil.stopAndRemove(this._skins[cp.clothesPos]);
					_skins[cp.clothesPos] = null;
					_skinNos[cp.clothesPos] = null;
					onAvatarSpriteChanged(cp.clothesNo);
					
				}
				removeHandler(cp.skinViewFile);
			}
			refreshAvatarSprite();
		}

		override protected function defaultFilePath():String{
			return FILE_PATH;
		}

		override protected function defaultImageType():String{
			return IMAGE_TYPE;
		}
		
		override protected function containPosition(clothesPos:int):Boolean{
			if(_isHalfAvatar){
				return SkinPosInfo.isHalfAvatarContain(clothesPos);
			}	
			return SkinPosInfo.isAlbumAvatarContain(clothesPos);
		}		
		/**
		 * 同步和异步造成的结果是不同的
		 * **/
		override protected function loadUserClothesPart(clothesPart:ClothesPart):void{
			var url:String = FILE_PATH + clothesPart.skinViewFile;
			var className:String = clothesPart.skinViewFile + IMAGE_TYPE;
			ResScheduler.getResource(url, onLoadSkinView, className, onLoadSkinViewError, null, 
				ResPriority.LOW, false, SceneDomainResLoader.resStoryageType);
			
			function onLoadSkinView(content:DisplayObject):void{
				if (content == null){
					throw new Error("SkinView: " + className + "can't be found from: " + url);
				}
				wearSkins(content, clothesPart);
			}
			
			function onLoadSkinViewError(evt:IOErrorEvent):void{
				popWaitingArr(clothesPart.clothesNo);
				if(_skinNos != null){
					_skinNos[clothesPart.clothesPos] = null;
					_skins[clothesPart.clothesPos] = null;
					refreshAvatarSprite();
				}
			}
		}
		
		override protected function cancelLoadClothesPath(clothesPart:ClothesPart):void{
//			var loadingNum:int = _loadingCount[clothesPart.clothesNo];
//			loadingNum --;
//			if(loadingNum <= 0){
//				delete _loadingCount[clothesPart.clothesNo];
//				var url:String = FILE_PATH + clothesPart.skinViewFile;
//				ResScheduler.cancelURL(url);
//			}
		}

		override protected function onAvatarSpriteChanged(clothesNo:String):void{
			super.onAvatarSpriteChanged(clothesNo);
		}

		override protected function onAvatarSpriteComplete():void{
			refreshAvatarSprite();
			
			if (this._avatarHalf != null)
			{
				this._avatarHalf.drawAvatarSprite(this.getSprite());
			}
			
			super.onAvatarSpriteComplete();
		}
		
		private function refreshAvatarSprite():void{
			DisplayUtil.removeAllChild(this._avatarContainer);
			
			for (var i:int = this._skins.length - 1; i >= 0; i--){
				if(this._skins[i] != null){
					var skinNo:String = _skinNos[i];
					var clothesData:Clothes = ClothesFacade.instance.getClothesDataByNo(skinNo);
//					if(_isMagicMakeUp){
//						/*if(AvatarHelper.isChangableInMakeUp(clothesData.id))
//						{
//							TipsManager.getInstance().addComplexTips(_skins[i], clothesData.name, clothesData.description, 100, 9, 9, TipsType.NORMAL);
//						}*/
//					}
					this._avatarContainer.addChild(this._skins[i]);	
				}
			}
		}
		
		override protected function preLoadClothes(clothes:Clothes):void{
			for each (var clothesPart:ClothesPart in clothes.parts){
				this._skinNos[clothesPart.clothesPos] = clothesPart.clothesNo;
			}
		}
		
		override protected function wearingPants():Boolean{
			return _skinNos[SkinPosInfo.KUZI] != null || _skinNos[SkinPosInfo.QUNZI] != null;
		}
		
		override protected function wearingKuzi():Boolean{
			return _skinNos[SkinPosInfo.KUZI] != null;
		}	
		
		override protected function wearingShirt():Boolean{
			return _skinNos[SkinPosInfo.SHANGYI_QUGAN] != null;
		}	
		
		override protected function wearingHair():Boolean{
			return _skinNos[SkinPosInfo.TOUFA_QIAN] != null;
		}	
		
		override protected function wearingDefaultSkirt():Boolean{
			var skirt:String = _skinNos[SkinPosInfo.QUNZI];
			var defaultSkirtId:int = this.avatarInfo.defaultClothesIds[1];
			var defaultSkirt:ClothesPart = ClothesFacade.instance.getClothesDataById(defaultSkirtId).parts[0] as ClothesPart;
			return skirt && skirt == defaultSkirt.clothesNo;
		}
		
		override protected function wearSkins(skin:*, clothesPart:ClothesPart):void{
			//如果已经dispose了就返回
			if(_skins == null){
				return;
			}
			//由于闭包方法没办法停止，所以有可能在下载的时候resetSkins引起skinsNo的对应位置为空而skin的位置有东西。
			//直接挡掉不管了。
			if (_skinNos[clothesPart.clothesPos] == null){
				return;
			}
			
			

			
			var skinMC:Sprite = skin as Sprite;
			skinMC.name = clothesPart.clothesNo;
			
			
			this._skins[clothesPart.clothesPos] = skinMC;
			
			addHandler(clothesPart);
			
			
			if (this._clickable){
				skinMC.addEventListener(MouseEvent.CLICK, onMouseClickSkin, false, 0, true);
			}
			
			refreshAvatarSprite();
			onAvatarSpriteChanged(clothesPart.clothesNo);
			
			//改变等待队列
			//移到最后。抛出AVATAR_SPRITE_COMPLETED事件
			popWaitingArr(clothesPart.clothesNo);
		}
		
		private function removeHandler(skinviewFile:String):void{
			if(!this._skinviewHandlers.hasOwnProperty(skinviewFile))
			{
				return;
			}
			var handle :ISkinviewHandler = _skinviewHandlers[skinviewFile];
			handle.dispose();
			delete _skinviewHandlers[skinviewFile];
		}
		
		private function addHandler(clothesPart:ClothesPart):void{


			var skinviewFile:String = clothesPart.skinViewFile;
			var pos:int = clothesPart.clothesPos;
			
			var handle :ISkinviewHandler = SkinviewHelper.getHandlerByName(skinviewFile);
			if(handle != null)
			{
				this._skinviewHandlers[skinviewFile] = handle;
				var params:Object = SkinviewHelper.getEffectParams(skinviewFile);
				handle.refreshView(this._skins[pos],params);
			}
		}

		private function disposeSkins():void{
			DisplayUtil.stop(avatarSprite);
			if (this._skins != null){
				this._skins = null;
				this._skinNos = null;
				
			}
			
			if(this._skinviewHandlers!=null)
			{
				for each(var skinviehandle:ISkinviewHandler in this._skinviewHandlers)
				{
					skinviehandle.dispose();
				}
			}
			
			
			
			this._skinviewHandlers = null;
		}

		/**
		 * 鼠标点击单件服装
		 */
		private function onMouseClickSkin(e:MouseEvent):void{
			e.stopImmediatePropagation();
			var skin:Sprite = e.currentTarget as Sprite;
			this.dispatchEvent(new AvatarEvent(AvatarEvent.CLOTHES_SELECTED, {"ClothesNo": skin.name}));
		}
	}
}