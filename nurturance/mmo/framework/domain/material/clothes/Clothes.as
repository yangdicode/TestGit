package mmo.framework.domain.material.clothes
{
import mmo.framework.domain.material.DescDatas;
import mmo.framework.domain.material.Material;
import mmo.framework.domain.material.MaterialTypes;
import mmo.framework.domain.material.visitor.MaterialVisitor;
import mmo.framework.domain.property.Race;
import mmo.framework.domain.property.Sex;

public class Clothes extends Material
	{

		public static const MaxStar:int = 7;
		//~ fields ------------------------------------------------------------

		/** 衣服物品ID */
		private var _clothesId:int;
		/** 衣服品牌 */
		private var _brand:String;
		/** 衣服时尚度 */
		private var _fashion:int;

		/** 子元件信息，Array每个元素为ClothesParts类型 */
		private var _parts:Array;

		/** 原件所在文件名 */
		private var _fileName:String;

		/***
		 *衣服穿着限制条件，
		 * 默认值为-1，表示没有限制
		 *
		 * */
		/**特定性别**/
		private var _sex:Sex;
		/**特定种族**/
		private var _race:Race
		/**特定羽龄**/
		private var _age:int = -1;
		
		private var _type:String;
		private var _nuanLv:int;
		private var _nuanPart:String;
		private var _nuanStyle:String;
		
		//~ public methods ----------------------------------------------------

		public function Clothes(clothesId:int, name:String, maxOwnNum:int, value:int, sellPrice:int, isBind:int, 
								isVip:int, des:String, brand:String, fashion:int, sex:int, race:int, age:int, 
								pro:int, canTrade:int, isOutOfPrint:int,nuanLv:int, nuanPart:String, nuanStyle:String = "", 
								type:String = "")
		{
			super(clothesId, MaterialTypes.CLOTHES, name, maxOwnNum, value, sellPrice, isBind, isVip, des, canTrade, isOutOfPrint);

			this._clothesId = clothesId;
			this._brand = brand;
			this._fashion = fashion;
			_sex = Sex.getSex(sex);
			_race = (race == 0)?null:Race.getRace(race);
			_age = age;
			_type = type;
			_nuanLv = nuanLv;
			_nuanStyle = nuanStyle;
			_nuanPart = nuanPart;
		}
		
		public static function buildByConfig(config:Array):Clothes{
			var key:String = MaterialTypes.CLOTHES + "_" + config[0];
			return instantiated[key] || new Clothes(config[0], "", config[1], config[2], config[3], config[4], 
				config[5], "", "", config[6], config[7], 0, 0, 0, config[8], config[9], config[10], "","", "");
		}

		override public function get name():String{
			if(_name == null || _name == ""){
				_name = DescDatas.getClothesName(clothesId);
			}
			return _name;
		}


		override public function get description():String{
			if(_description == null || _description == ""){
				_description = DescDatas.getClothesDescription(clothesId);
			}
            return _description;
		}

	/**
		 * 是否试穿衣服
		 */
		public function get isTry():Boolean
		{
			return _type == ClothesType.TryOnClothes;
		}

		/**暖暖钻级**/
		public function get star():int
		{
			return _nuanLv;
		}

		/** 衣服物品ID **/
		public function get clothesId():int
		{
			return this._clothesId;
		}

		/** 衣服品牌 **/
		public function get brand():String
		{
			if(_brand == null || _brand == ""){
				_brand = DescDatas.getClothesBrand(_clothesId);
			}
			return _brand;
		}

		/** 衣服时尚度 **/
		public function get fashion():int
		{
			return this._fashion;
		}

		public function get sex():Sex
		{
			return _sex;
		}

		public function get age():int
		{
			return _age;
		}

		public function get race():Race
		{
			return _race;
		}

		/**
		 * 获得元件列表
		 *
		 * @return Array中每个元素均为ClothesParts类型
		 */
		public function get parts():Array
		{
			return this._parts;
		}

		public function set parts(p:Array)
		{
			this._parts = p;
		}

		public function get fileName():String
		{
			return this._fileName;
		}

		public function set fileName(filestr:String)
		{
			this._fileName = filestr;
		}
		
		public function get nuanStyle():String
		{
			if(_nuanStyle == null || _nuanStyle == ""){
				_nuanStyle = DescDatas.getNuanTopic(_clothesId);
			}
			return _nuanStyle;
		}

		//~ private methods ---------------------------------------------------
		override public function accept(materialVisitor:MaterialVisitor):*
		{
			return materialVisitor.visitorClothes(this);
		}

		private static function compileMe():void
		{
			var suit:ClothesSuit;
		}

		/**
		 * 衣服类型
		 */
		public function get type():String
		{
			if(_type == null || _type == ""){
				_type = DescDatas.getClothesType(_clothesId);
			}
			return _type;
		}

		public function get nuanPart():String
		{
			if(_nuanPart == null || _nuanPart == ""){
				_nuanPart = DescDatas.getNuanPart(clothesId);
			}
			return _nuanPart;
		}


	}
}