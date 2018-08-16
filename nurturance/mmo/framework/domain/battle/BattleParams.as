package mmo.framework.domain.battle
{
	public class BattleParams
	{
		public static function getBattleParamsByXML(xml:XML):BattleParams
		{
			return new BattleParams(xml.@er, xml.@ir, xml.@sound, (xml.@auto == "1"));
		}
		
		public static const DisableEscape:int = 10000;
		public static const DisableUseItem:int = 10000;
		private var _enableEscapeRound:int;
		private var _enableUseItemRound:int;
		private var _bgmMusicId:int;
		private var _isAuto:Boolean;
		
		public function BattleParams(enableEscapeRound:int = 0, enableUseItemRound:int = 0, bgmMusicId:int = 1, isAuto:Boolean = false)
		{
			_enableEscapeRound = enableEscapeRound;
			_enableUseItemRound = enableUseItemRound;
			_bgmMusicId = bgmMusicId;
			_isAuto = isAuto;
		}
		
		public function getParamsXML():XML
		{
			var xml:XML = <r/>;
			xml.@ir = enableUseItemRound;
			xml.@er = enableEscapeRound;
			xml.@sound = bgmMusicId;
			xml.@auto = (isAuto)?"1":"0";
			return xml;
		}
		

		/**
		 * 多少回合后可以逃跑
		 */		
		public function get enableEscapeRound():int
		{
			return _enableEscapeRound;
		}

		public function set enableEscapeRound(value:int):void
		{
			_enableEscapeRound = value;
		}

		/**
		 * 多少回合后可以使用物品 
		 */		
		public function get enableUseItemRound():int
		{
			return _enableUseItemRound;
		}

		public function set enableUseItemRound(value:int):void
		{
			_enableUseItemRound = value;
		}

		/**
		 * 背景音乐 
		 */		
		public function get bgmMusicId():int
		{
			return _bgmMusicId;
		}

		public function set bgmMusicId(value:int):void
		{
			_bgmMusicId = value;
		}

		public function get isAuto():Boolean
		{
			return _isAuto;
		}

		public function set isAuto(value:Boolean):void
		{
			_isAuto = value;
		}

	}
}