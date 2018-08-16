package mmo.common
{
	/**
	 * 常用的正则表达式
	 * @author longpeijin
	 */
	public class CommonRegExp
	{
		public static const BAITIAN_ID_PATTERN:String = "[0-9]{5,10}";
		public static const QQ_PATTERN:String = "[0-9]{5,15}";
		public static const TEL_PATTERN:String = "[0-9]{5,12}";
		public static const EMAIL_PATTERN:String = "\\w+([-_.]\\w+)*@\\w+([-_.]\\w+)*\\.\\w+([-_.]\\w+)*";
		public static const POSTAL_CODE_PATTERN:String = "[0-9]{6,6}";
		public static const PASSWORD_PATTERN:String = "[a-zA-Z0-9]+";
		
		public function CommonRegExp()
		{
		}
	}
}