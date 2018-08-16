package mmo.common
{
	import flash.text.StyleSheet;
	
	public class CustomStyleSheet
	{
		public function CustomStyleSheet()
		{
		}

		public static function getDefaultLinkStyle():StyleSheet{
			var styleSheet:StyleSheet = new StyleSheet();
         	styleSheet.parseCSS("a{ font-family:'宋体'; font-size:12px;}" 
         		+ " a:link, a:visited {	color:#0066CC;	text-decoration:none} a:hover {	color:#0066CC;	text-decoration:underline} a:active{text-decoration:underline}");
         	
         	return styleSheet;
		}
		
		public static function getShortLinkStyle(width:int):StyleSheet{
			var styleSheet:StyleSheet = new StyleSheet();
         	styleSheet.parseCSS("a{ font-family:'宋体'; font-size:12px; display: block; width: "
         		 + width + "px; overflow: hidden; white-space: nowrap; -o-text-overflow: ellipsis; text-overflow: ellipsis;}" 
         		+ " a:link, a:visited {	color:#0066CC;	text-decoration:none} a:hover {	color:#0066CC;	text-decoration:underline} a:active{text-decoration:underline}");
         	
          	return styleSheet;
		}
	}
}