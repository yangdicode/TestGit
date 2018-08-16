package mmo.common
{
	import flash.utils.getTimer;


	/**
	 *
	 * @author yangfeng
	 */
	public class DateUtil
	{
		private static var initServerMs:Number;
		private static var festival:Boolean;
		private static var initTime:Number;
		private static var dayCountOfMonth:Array = [31,28,31,30,31,30,31,31,30,31,30,31];
		/**
		 * 东8区和通用时间 (UTC) 之间的差值（以分钟为单位）.
		 */
		private static var timezoneOffset = -480;

		public static const SECOND:Number = 1000;
		public static const MINUTE:Number = 60 * SECOND;
		public static const HOUR:Number = 60 * MINUTE;
		public static const DAY:Number = 24 * HOUR;

		public function DateUtil()
		{

		}

		public static function init(timeMs:Number,fes:Boolean)
		{
			initServerMs = timeMs;
			festival = fes;
			initTime = getTimer();
		}

		//日期是绝对准确的，时间如果使用变速齿轮外挂会失准
		public static function getServerTime():Date
		{
			return getChinaDateByNumber(getRealServerTime());
		}

		//真实的服务器日期
		public static function getRealServerDate():Date
		{
			return new Date(getRealServerTime());
		}

		//真实的服务器时间
		public static function getRealServerTime():Number
		{
			var date:Date = new Date();
			return date.time;
		}

		/**
		 *	 今天是否是输入日期当天
		 * @param year 年份(1999)
		 * @param month 月份，从0开始
		 * @param date 日期（1-31）
		 * @return true-是
		 *
		 */		
		public static function isToday(year:int,month:int,date:int):Boolean
		{
			var d:Date = getServerTime();
			return d.getFullYear() == year && d.getMonth() == month && d.getDate() == date;
		}

		/**
		 *	 输入日期是否是在今天之后（不包括输入日期当天）
		 * @param year 年份(1999)
		 * @param month 月份，从0开始
		 * @param date 日期（1-31）
		 * @return true-输入日期在今天之后
		 *
		 */		
		public static function isAfterToday(year:int,month:int,date:int):Boolean
		{
			var d:Date = new Date(year,month,date);
			if(d.getTime() > initServerMs && !isToday(year,month,date))
			{
				return true;
			}else
			{
				return false;
			}
		}

		/**
		 *	 输入日期是否是在今天之前（不包括输入日期当天）
		 * @param year 年份(1999)
		 * @param month 月份，从0开始
		 * @param date 日期（1-31）
		 * @return true-输入日期在今天之前
		 *
		 */	
		public static function isBeforeToday(year:int,month:int,date:int):Boolean
		{
			return !isToday(year,month,date) && !isAfterToday(year,month,date);
		}

		/**
		 * 日期字符串转化为Date 字符串格式必须为如"year-month-date"
		 */
		public static function parseDateStrToDate(dateStr:String):Date
		{
			var dateArr:Array = dateStr.split("-");
			if(dateArr.length==3)
			{
				return new Date(new int(dateArr[0]),new int(dateArr[1])-1,new int(dateArr[2]));
			}
			return null;
		}

		/**
		 * 时间字符串转化为Date 字符串格式如"hour:mintue:second"
		 */		
		public static function timeStrToDate(timeStr:String):Date
		{
			var date:Date = new Date();
			var timeArr:Array = timeStr.split(":");
			date.setHours(int(timeArr[0]), int(timeArr[1]), int(timeArr[2]));
			var serverTime:Date = getServerTime();
			date.setFullYear(serverTime.fullYear, serverTime.month, serverTime.date);
			return date;
		}

		/**
		 * 日期字符串转化为Date 字符串格式必须为如"year-month-date hour:mintue:second"
		 * "2012-11-20 10:55:36"
		 */		
		public static function parseFullDateStrToDate(dateStr:String):Date
		{
			var dateStrs:Array = dateStr.split(" ");
			var date1:Date = parseDateStrToDate(dateStrs[0]);
			var date2:Date = timeStrToDate(dateStrs[1]);
			date1.setHours(date2.hours, date2.minutes, date2.seconds, date2.milliseconds);
			return date1;
		}

		//不管本机怎么设定，以东八区的方式转成当前date
		public static function getChinaDateByNumber(timeNum:Number):Date
		{
			var newTimeNum:Number = timeNum + (new Date().timezoneOffset - timezoneOffset) * 60 * 1000;
			return new Date(newTimeNum);
		}

		public static function formatDateYMD(date:Date = null):String
		{
			//加上时区修正为东八区时区
			var d:Date = date != null ? getChinaDateByNumber(date.getTime()) : getServerTime();
			var month:int = d.getMonth() + 1;
			var day:int = d.getDate();
			var monthStr:String = "" +  month;
			if(month < 10)
			{
				monthStr = "0" + monthStr;
			}	
			var dayStr:String = "" + day;
			if(day < 10)
			{
				dayStr = "0" + dayStr;
			}	
			return d.getFullYear() + "-" + monthStr + "-" + dayStr;
		}

		//计算星座
		public static function getAstro(month:int, day:int):String
		{
			var s:String = "摩羯水瓶双鱼牧羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯";
			var arr:Array = new Array(20, 19, 21, 21, 21, 22, 23, 23, 23, 23, 22, 22);
			return s.substr(month * 2 - (day < arr[month - 1] ? 2 : 0), 2);
		}

		public static function getAge(birthDay:Date):int{
			var now:Date = DateUtil.getServerTime();
			var age:int = 0;
			for(var year:int = birthDay.fullYear; year < now.fullYear; year ++){
				age ++;
			}
			if(now.month >= birthDay.month && now.date >= birthDay.date){
				age ++;
			}
			return age;
		}

		public static function validateYMD(year:String,month:String,day:String):Boolean{
			try{
				if(year == null || month == null || day == null || year.length == 0 || month.length == 0 || day.length == 0){
					return false;
				}

				var intYear = parseInt(year);
				var intMonth = parseInt(month);
				var intDay = parseInt(day);
				var date:Date = new Date();
				//判断日期范围是否有效
				if(intYear < 1900 || intYear > date.getFullYear() || intMonth<1 || intMonth > 12 || intDay<1 || intDay>31){
					return false;
				}
				if(intDay > getDayCount(intYear, intMonth)){
					return false;
				}
				return true;
			}catch(err:Error){
				return false;
			}
			return true;
		}

		/**
		 * 获得当月天数
		 */		
		public static function getDayCount(year:int, month:int):int{
			if(isBissextile(year) && month == 2){
				return 29;
			}
			return dayCountOfMonth[month - 1];
		}

		/**
		 * 是否润年
		 */		
		public static function isBissextile(year:int):Boolean{
			if(year % 4 != 0){
				//不能被四整除，不是闰年
				return false;
			}else if(year % 100 != 0){
				//能被四整除，但不能被100整除，是闰年
				return true;
			}else if(year % 400 == 0){
				//能被100和4整除，且能被400整除，是闰年
				return true;
			}else if(year % 400 != 0){
				//能被100和4整除，但不能被400整除，不是闰年
				return false;
			}
			return false;
		}

		/**
		 * 是否是节日,后台发过来的
		 */		
		public static function isFestival():Boolean
		{
			return festival;
		}

		/**
		 * 计算连两个时间点间的秒数差
		 * @param startDate
		 * @param endDate
		 * @return
		 *
		 */		
		public static function getOverSec(startDate:Date, endDate:Date):int
		{	
			var overSec:int = int((endDate.getTime() - startDate.getTime())/1000);

			if(overSec < 0)
			{
				trace("***Error***DateUtil Error:startDate later than endDate");
				return 0;
			}
			else
			{
				return overSec;
			}
		}

		/**
		 * 向上取整
		 */		
		public static function getOverDays(date1:Date, date2:Date):int{
			var overMinSec:Number = date1.time - date2.time;
			if(overMinSec <= 0){
				overMinSec = -overMinSec;
			}
			return Math.ceil(overMinSec / DAY);
		}

		/**
		 * 秒数转化为时分秒数组
		 * @param sec 秒数
		 * @return 结果数组 [0]为时，[1]为分，[2]为秒
		 *
		 */		
		public static function secToHourMinSecArr(sec:int):Array
		{
			var hmsArr:Array = [];
			hmsArr[0] = int(sec / 3600);
			hmsArr[1] = int(sec % 3600 / 60);
			hmsArr[2] = int(sec % 60);
			return hmsArr;
		}

		public static function getOverDayHourMinSec(startDate:Date, endDate:Date):Array
		{
			var overMS:Number = endDate.time - startDate.time;
			var dhmsArr:Array = [];

			if(overMS < 0)
			{
				trace("***Error***DateUtil Error:startDate later than endDate");
				overMS = 0;
			}

			dhmsArr[0] = int(overMS / DAY);
			dhmsArr[1] = int(overMS / HOUR % 24);
			dhmsArr[2] = int(overMS / MINUTE % 60);
			dhmsArr[3] = int(overMS / SECOND % 60);

			return dhmsArr;
		}





		/**
		 *
		 * @param seconds 秒
		 * @param formatType 格式化格式
		 * @param needZero 个位数补零标志位
		 * @return
		 */
		public static function formatUsedTime(seconds:Number, formatType:String = "hh:mm:ss", needZero:Boolean = true):String
		{
			if (formatType.indexOf("dd") != -1)
			{
				var day:int = seconds / 86400;
				var totalDayTime:int = day * 86400;
			}

			if (formatType.indexOf("hh") != -1)
			{
				var hour:int = (seconds - totalDayTime) / 3600;
				var totalHourTime:int = hour * 3600;
			}

			if (formatType.indexOf("mm") != -1)
			{
				var minute:int = (seconds - totalDayTime - totalHourTime) / 60;
				var totalMinuteTime:int = minute * 60;
			}

			if (formatType.indexOf("ss") != -1)
			{
				var second:int = seconds - totalDayTime - totalHourTime - totalMinuteTime;
			}

			formatType = formatType.replace("dd", needZero && day < 10 ? "0" + day : "" + day);
			formatType = formatType.replace("hh", needZero && hour < 10 ? "0" + hour : "" + hour);
			formatType = formatType.replace("mm", needZero && minute < 10 ? "0" + minute : "" + minute);
			formatType = formatType.replace("ss", needZero && seconds < 10 ? "0" + second : "" + second);
			return formatType;
		}



		/**
		 * 将秒数拼接成10进制的数字,可用于NumHelper设置倒计时之类的
		 * 例如 4000 --> 10640
		 * @param sec
		 * @return
		 *
		 */		
		public static function secToDecimalNum(sec:int):int
		{
			var hmsArr:Array = secToHourMinSecArr(sec);
			var res:int = int(hmsArr[0]) * 10000 + int(hmsArr[1]) * 100 + int(hmsArr[2]);

			return res;
		}
		/**
		 * 将秒数换化为补零字符串，以应付不用元件倒计时直接显示字符串
		 * 例如 4000秒 --> 01:06:40
		 * @return
		 *
		 */		
		public static function secToHourMinSecStr(sec:int):String
		{
			var hmsArr:Array = secToHourMinSecArr(sec);
			var hourStr:String = getAddZeroStr(int(hmsArr[0]));
			var minStr:String = getAddZeroStr(int(hmsArr[1]));
			var secStr:String = getAddZeroStr(int(hmsArr[2]));
			var hmsStr:String = hourStr + ":" + minStr + ":" + secStr;
			return hmsStr;
		}

		public static function addDay(date:Date, day:int):Date{
			return add(date, day * DAY);
		}

		public static function addHour(date:Date, hour:int):Date{
			return add(date, hour * HOUR);
		}

		public static function addMinute(date:Date, minute:int):Date{
			return add(date, minute * MINUTE);
		}

		public static function addSecond(date:Date, second:int):Date{
			return add(date, second * SECOND);
		}

		/**
		 * 日期比较
		 * @return true date1在date2之前
		 */		
		public static function isBefore(date1:Date, date2:Date):Boolean{
			return date1.time < date2.time;
		}

		public static function isAfter(date1:Date, date2:Date):Boolean{
			return !isBefore(date1, date2);
		}

		public static function isBetween(date1:Date, date2:Date, date3:Date):Boolean{
			return isAfter(date1, date2) && isBefore(date1, date3);
		}

		private static function add(date:Date, time:Number):Date{
			return new Date(date.getTime() + time);
		}

		/**
		 *	 将second转为"00:00:00"的格式字符串
		 * @param second 秒
		 * @return "00:00:00"的格式
		 *
		 */		
		public static function getFormatStringBySecond( second:int ):String {
			if( second<0 ){
				return "00:00";
			}
			var lh:int = second / 3600;
			second -= lh * 3600;
			var lm:int = second / 60;
			var ls:int = second % 60;
			var separate:String = ":";
			var str:String = "";
			if(lh > 0){
				str += getAddZeroStr(lh) + separate;
			}
			str += getAddZeroStr(lm) + separate + getAddZeroStr(ls);
			return str;
		}

		/**
		 * 将日期转化成东8区相同日期
		 */
		public static function dateToChinaDate(date:Date):Date{
			return new Date(timeToChinaTime(date.getTime()));
		}

		public static function timeToChinaTime(time:Number):Number{
			return time - (new Date().timezoneOffset - timezoneOffset) * 60 * 1000;
		}

		public static function getAddZeroStr(num:int):String
		{
			return (num < 10 ? "0" : "") + num;
		}

		/**
		 * 拿日期星期的中文描述
		 */
		public static function getDateChineseDay(date:Date):String{
			switch(date.day){
				case 0:
					return "星期日";
				case 1:
					return "星期一";
				case 2:
					return "星期二";
				case 3:
					return "星期三";
				case 4:
					return "星期四";
				case 5:
					return "星期五";
				case 6:
					return "星期六";
			}
			return "";
		}

		public static function compileMe():void
		{

		}
	}
}

