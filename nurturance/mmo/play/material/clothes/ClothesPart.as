package mmo.play.material.clothes
{
import com.adobe.utils.StringUtil;

import flash.utils.Dictionary;
	
	import mmo.play.avatar.SkinInfo;
import mmo.play.avatar.skininfo.SkinInfoFactory;

/**
	 * 衣服元件信息
	 */
	public class ClothesPart extends Dictionary
	{

		//~ fields ------------------------------------------------------------

		/** 衣服编号，用于类名的识别 */
		private var _clothesNo:String;
		
		/** 衣服挂载点 */
		private var _clothesPos:int;

		/** 皮肤配置信息 */
		private var _skinInfo:SkinInfo;

		/**
		 * 面组成方式
		 */
		private var _sildeType:int;
		
		/**
		 * 文件名, 正常情况下与衣服编号相同
		 * */
		private var _fileName:String = ""; 
		
		/**
		 * 文件路径，默认为人物
		 * */
		private var _filePath:String = "";
		
		/**
		 * 形象卡skinview文件名，正常与skin文件名一致，除非特殊配置
		 */
		private var _skinViewFile:String = "";
		
		/**
		 * 是否有包含动画
		 * */
		private var _hasMovie:Boolean;
		

		
		
		//~ public methods ----------------------------------------------------

		public function ClothesPart(clothesNo:String, clothesPos:int, fileName:String = "", skinViewFile:String = "",
									  filePath:String = "", skinInfo:SkinInfo = null, hasMovie:Boolean = false, sideType:int = 8)
		{
			this._clothesNo = clothesNo;
			this._clothesPos = clothesPos;
			this._skinInfo = skinInfo;
			this._sildeType = sideType;
			
			_fileName = StringUtil.isEmpty(fileName) ? _clothesNo : fileName;
			_filePath = StringUtil.isEmpty(filePath) ? "skin/" : filePath;
			_skinViewFile = StringUtil.isEmpty(skinViewFile) ? _fileName : skinViewFile;
			_hasMovie = hasMovie;
		}

		public static function buildByConfig(config:Array):ClothesPart{
			return new ClothesPart(config[0], config[1], config[2], config[3], config[4], 
					SkinInfoFactory.getInfoByKey(config[5]), config[6] == 1, config[7]);
		}

		/**
		 * 获得衣服编号
		 */
		public function get clothesNo():String
		{
			return this._clothesNo;
		}
		
		/**
		 * 获得文件路径
		 * */
		public function get filePath():String
		{
			return _filePath;
		}
		/**
		 *获取衣服文件名 
		 */
		public function get fileName():String
		{
			return this._fileName;
		}	
		
		/**
		 * 获取skinview文件名
		 */		
		public function get skinViewFile():String
		{
			return this._skinViewFile;
		}
		
		/**
		 * 获得衣服挂载点
		 */
		public function get clothesPos():int
		{
			return this._clothesPos;
		}
		
		/**
		 * 皮肤配置信息
		 */
		public function get skinInfo():SkinInfo
		{
			return this._skinInfo;
		}

		/**
		 * 面组成方式
		 * @return
		 *
		 */
		public function get sideType():int
		{
			return this._sildeType;
		}
		
		/**
		 * 是否包含动画
		 * 
		 * */
		public function get hasMovie():Boolean
		{
			return _hasMovie;
		}	
	}
}