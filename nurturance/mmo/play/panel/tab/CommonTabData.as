package mmo.play.panel.tab
{
	/**
	 * @author xuguowei
	 * 创建时间：2016-1-31 下午3:44:46
	 * 功能：
	 */
	public class CommonTabData
	{
		private var _path:String;
		private var _cla:String;

		public function CommonTabData(path:String,cla:String)
		{
			_path = path;
			_cla = cla;
		}

		public function get path():String{
			return _path;
		}

		public function get cla():String{
			return _cla;
		}

	}
}

