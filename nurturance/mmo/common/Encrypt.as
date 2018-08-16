package mmo.common
{
	//分数加密类
	public class Encrypt
	{
		//原始长度
		private static const len:int = 5;
		
		//调换位置
		private static const changePosition:Array = new Array(2, 3, 0, 4, 1);
		
		//奇数位的transform
		private static const oddTransForm:Array = new Array(2,7,4,8,1,3,6,0,9,5);
		
		//偶数位的transform
		private static const evenTransForm:Array = new Array(1,3,6,0,9,5,2,7,4,8);
		
		//叠加的keyword
		private static const keyword:int = 7;
		
		//加密后的位数
		private static const encryptLen:int = len + 2;
		
		//		//设置加密数据
		//		public function setEncryptData(len:int, keyword:int, changePosition:Array)
		//		{
		//			this.len = len;
		//			this.keyword = keyword;
		//			this.changePosition = changePosition;
		//		}
		
		//返回加密后的数字
		public static function encryptCode(num:int):int
		{
			var s:Array = new Array(encryptLen);
			for (var i:int = len - 1; i >= 0; i--)
			{
				s[i] = num % 10;
				num = num/10;
			}
			//trace(s);
			var encryNum:Array;
			encryNum = encryptPart1(s);//调换位置
			//			trace(encryNum);
			encryNum = encryptPart2(encryNum);//增加头尾
			//			trace(encryNum);
			encryNum = encryptPart3(encryNum);//叠加
			//			trace(encryNum);
			encryNum = encryptPart4(encryNum);//数字的transform
			//			trace(encryNum);
			
			var resultNum:int = 0;
			for (i = 0; i < encryptLen; i++)//
			{
				resultNum = resultNum * 10 + encryNum[i];
			}
			
			return resultNum;			
		}
		
		//返回加密后的长度
		public static function getEncryLen():int
		{
			return encryptLen;
		}
		
		//增加头尾
		private static function encryptPart2(num:Array):Array
		{
			var firstNum:int = num[0];
			var lastNum:int = num[len - 1]; 
			num.unshift(lastNum);
			num[encryptLen - 1] = firstNum;
			
			return num;
		} 
		
		//调换位置
		private static function encryptPart1(num:Array):Array
		{
			var newNum:Array = new Array(encryptLen);
			for (var i:int = 0; i < len; i++)
			{
				newNum[i] = num[changePosition[i]];
			}
			
			return newNum;
		}
		
		//叠加
		private static function encryptPart3(num:Array):Array
		{
			var newNum:Array = new Array(encryptLen);
			newNum[0] = (keyword + num[0]) % 10;
			for (var i:int = 1; i < encryptLen; i++)
			{
				newNum[i] = (num[i - 1] + num[i])%10;	
			}
			return newNum;
		}
		
		//数字的transform
		private static function encryptPart4(num:Array):Array
		{
			var newNum:Array = new Array(encryptLen);
			for (var i:int = 0; i < encryptLen; i++)
			{
				if (i%2 == 1) 
					newNum[i] = oddTransForm[num[i]];
				else
					newNum[i] = evenTransForm[num[i]];
			}
			return newNum;
		}
	}
}