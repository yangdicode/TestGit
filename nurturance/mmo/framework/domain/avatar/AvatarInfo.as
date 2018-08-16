package mmo.framework.domain.avatar
{

	import com.adobe.utils.StringUtil;
	
	import flash.events.EventDispatcher;
	
	import mmo.framework.domain.material.clothes.Clothes;

	/**
	 * Player形象信息
	 */
	public class AvatarInfo extends EventDispatcher
	{
		public static const DEFAULTMALE:Array = [22, 23, 26];
		public static const DEFAULTFEMALE:Array = [24, 25, 27];
		//~ fields ------------------------------------------------------------

		/**
		 * 衣服
		 * 每个元素为Clothes类型
		 */
		private var _clothesArr:Array = new Array();
		
		/**
		 * [上衣、下衣、头发]
		 */		
		protected var _defaultClothesId:Array = DEFAULTFEMALE;
		//~ public methods ----------------------------------------------------

		public function AvatarInfo()
		{
			this._clothesArr = [];
		}

		/**
		 * 根据序列化的服装信息设置用户形象
		 *
		 * @param	avatar
		 */
		public function setAvatarInfoWithString(avatar:String):void
		{
			var clothesList:Array = AvatarInfoParser.parseAvatarInfo(avatar);
			setAvatarInfoWithItemList(clothesList);
		}

		/**
		 * 根据服装列表设置用户形象
		 *
		 * @param	itemList	物品列表，以Clohes为元素的数组
		 */
		public function setAvatarInfoWithItemList(itemList:Array):void
		{
			this._clothesArr = [];
			for each (var item:Clothes in itemList)
			{
				this._clothesArr.push(item);
			}
			this.dispatchEvent(new AvatarInfoEvent(AvatarInfoEvent.ONAVATARRESET, null));
		}
		
		public function get defaultClothesIds():Array
		{
			return this._defaultClothesId;
		}	
		
		public function setDefaultClothesBySex(isMale:Boolean):void
		{
			if(isMale)
			{
				_defaultClothesId = DEFAULTMALE;	
			}else
			{
				_defaultClothesId = DEFAULTFEMALE;
			}
		}	
		/**
		 * 获得穿着的衣服
		 *
		 * @return	Array，其中每个元素是Clohes类型
		 */
		public function getClothes():Array
		{
			return this._clothesArr;
		}
		
		/**
		 * 判断用户身上是否正在穿某件衣服
		 * @param clothesId
		 */		
		public function hasUseClothes(clothesId:int):Boolean
		{
			for each(var clothes:Clothes in this._clothesArr){
				if(clothes.id == clothesId){
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 直接设置穿着的衣服
		 */
		public function setClothes(clothes:Array):void
		{
			this._clothesArr = clothes;
		}
		
		public function putOnClothes(clothes:Clothes):void
		{
			if(this._clothesArr.indexOf(clothes) >= 0)
			{
				return;
			}	
			this._clothesArr.push(clothes);
			this.dispatchEvent(new AvatarInfoEvent(AvatarInfoEvent.PUTON_CLOTHES, {"clothes":clothes}));
		}	
		
		public function takeOffClothes(clothes:Clothes):void
		{
			if(this._clothesArr.indexOf(clothes) < 0)
			{
				return;
			}	
			this._clothesArr.splice(this._clothesArr.indexOf(clothes), 1);
			this.dispatchEvent(new AvatarInfoEvent(AvatarInfoEvent.TAKEOFF_CLOTHES, {"clothes":clothes}));
		}	
		/**
		 * 获得AvatarInfo对象的拷贝
		 */
		public function clone():AvatarInfo
		{
			var ai:AvatarInfo = new AvatarInfo();
			var isMale:Boolean = _defaultClothesId == DEFAULTMALE;
			ai.setDefaultClothesBySex(isMale);
			ai.setClothes(this.getClothes().concat());
			return ai;
		}
		
		override public function toString():String
		{
			var str:String = "";
			for (var i:int = 0, len:int = this._clothesArr.length; i < len; i++)
			{
				if (i > 0)
				{
					str += ";";
				}

				var clothes:Clothes = this._clothesArr[i] as Clothes;
				str += clothes.clothesId;
			}
			return str;
		}
		
		/**
		 * 加入性别的默认衣服
		 */
		public function toDefaultClothesString():String{
			var str:String = "";
			for (var i:int = 0, len:int = _defaultClothesId.length; i < len; i++)
			{
				if (i > 0)
				{
					str += ";";
				}
				str += _defaultClothesId[i];
			}
			var cstr:String = this.toString();
			if(!StringUtil.isEmpty(cstr)){
				str = str + ";" + cstr;
			}
			return str;
		}

		//~ private methods ---------------------------------------------------

	}
}