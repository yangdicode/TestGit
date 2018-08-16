package mmo.framework.domain.profession
{
	

	public class UserProfession
	{
		private var _userProArray:Array;
		private var _profession:Profession
		private var _proLevel:int;
		private var _weaponId:int;
		private var _weaponLv:int;
		private var _skills:String;
		
		private var _potentLv:int;
		
		public function UserProfession(proId:int, proLevel:int, weaponId:int = 0, weaponLv:int = 0, skills:String = "", potLv:int = 0)
		{
			_profession = Professions.getProfession(proId);
			_proLevel = proLevel;
			_weaponId = weaponId == 0 ? _profession.initWeapon : weaponId;
			_weaponLv = weaponLv == 0 ? 1 : weaponLv;
			_skills = skills;
			_potentLv = potLv;
		}
		
		public function lvUp(incLv:int):void{
			this._proLevel += incLv;
		}
		
		public function resetSkills(skills:String):void{
			_skills = skills;
		}
		
		/**
		 * 当前用户职业
		 */
		public function get profession():Profession
		{
			return _profession;
		}
		
		public function set profession(profession:Profession):void
		{
			_profession = profession;
		}	
		/**
		 * 当前职业等级
		 * */
		public function get professionLevel():int
		{
			return _proLevel;
		}	
		
		public function set professionLevel(level:int):void
		{
			_proLevel = level;
		}

		public function get weaponId():int
		{
			return _weaponId;
		}

		public function get weaponLv():int
		{
			return _weaponLv;
		}
		
		public function set weaponLv(lv:int):void{
			_weaponLv = lv;
		}
		
		public function set weaponId(id:int):void{
			_weaponId = id;
		}

		public function get skills():String
		{
			return _skills;
		}
		
		public function get potentLv():int{
			return _potentLv;
		}
		
		public function set potentLv(lv:int):void{
			_potentLv = lv;
		}

		/** 旧接口，请用 potentLv **/
		public function get protentLv():int{
			return potentLv;
		}
		/** 旧接口，请用 potentLv **/
		public function set protentLv(lv:int):void{
			potentLv = lv;
		}
		
	}
}