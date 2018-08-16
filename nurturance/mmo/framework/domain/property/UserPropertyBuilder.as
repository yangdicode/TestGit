package mmo.framework.domain.property
{
	import mmo.framework.domain.profession.UserProfession;

	public class UserPropertyBuilder
	{
		public function UserPropertyBuilder()
		{
		}
		
		public static function build(props:Object, userProp:UserProperty = null):UserProperty
		{
			if(userProp == null)
			{	
				userProp = new UserProperty();
			}
			userProp.maxHp = props["maxhp"];
			userProp.hp = props["hp"];
			userProp.race = Race.getRace(props["race"]);
			userProp.sex = Sex.getSex(props["sex"]? 1:0);
			userProp.exp = props["exp"];
			userProp.gameTime = props["gametime"] < 0?0:props["gametime"];
			userProp.realTime = props["realtime"] < 0?0:props["realtime"];
			userProp.energy = props["e"];
			userProp.maxEnergy = props["maxe"];
			userProp.charm = props["charm"];
			userProp.fashion = props["fashion"];
			userProp.intelligence = props["intellect"];
			userProp.agility = props["agility"];
			userProp.strength = props["strength"];
			userProp.morality = props["moral"];
			userProp.stamina = props["stamina"];
			userProp.userProfession = new UserProfession(props["p"], props["plv"]);
			userProp.wing = props["wing"];
			userProp.badge = props["badge"];
			userProp.efforts = applyEfforts(String(props["efforts"]));
			userProp.sign = props["sign"];
			userProp.idCard = props["idcard"];
			userProp.activeTime = props["activetime"];
			userProp.hideMember = props[UserProperty.HIDE_MEMBER];
			userProp.proSlot = props[UserProperty.ProSlot];
			userProp.blessBuff = props[UserProperty.BlessBuff];
			userProp.jewelry = props[UserProperty.Jewery];
			
			userProp.collegeProId = props[UserProperty.COLLEGE_PRO_ID];
			userProp.collegeProExp = props[UserProperty.COLLEGE_PRO_EXP];
			userProp.collegeProTitleId = props[UserProperty.COLLEGE_PRO_TITLE_ID];
			
			return userProp;
		}
		
		private static function applyEfforts(efforts:String):Array
		{
			if(efforts == "")
			{
				efforts = "0,0,0,0,0"
			}
			var effortArray:Array = efforts.split(",");
			var leftLenth:int = 5 - effortArray.length;
			for(var i:int = 0; i < leftLenth; i++)
			{
				effortArray.push("0");
			}
			return effortArray;
		}
	}
}