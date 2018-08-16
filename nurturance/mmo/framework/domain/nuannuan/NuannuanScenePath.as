package mmo.framework.domain.nuannuan
{
	import flash.display.Sprite;
	import flash.geom.Point;

	public class NuannuanScenePath
	{
		private var _p1:Sprite;
		private var _p2:Sprite;
		private var _controlPoint:Sprite;
		public var hasSearch:Boolean;
		
		public function NuannuanScenePath(p1:Sprite, p2:Sprite, ctrlPoint:Sprite = null){
			_p1 = p1;
			_p2 = p2;
			_controlPoint = ctrlPoint;
		}
		
		public function findOtherPointName(curPointName:String):String{
			hasSearch = true;
			if(_p1.name == curPointName){
				return _p2.name;
			}else{
				return _p1.name;
			}
		}
		
		public function findOtherPoint(name:String):Point{
			var pView:Sprite;
			if(_p1.name == name){
				pView = _p2;
			}else{
				pView =_p1;
			}
			return new Point(pView.x, pView.y);
		}
		
		public function findPoint(name:String):Point{
			var pView:Sprite;
			if(_p1.name == name){
				pView = _p1;
			}else{
				pView =_p2;
			}
			return new Point(pView.x, pView.y);
		}
		
		public function findControlPoint(startName:String):Point{
			var point:Point;
			if(_controlPoint != null){
				point = new Point(_controlPoint.x, _controlPoint.y);
			}else if(startName == _p1.name){
				point = new Point(_p2.x, _p2.y);
			}else if(startName == _p2.name){
				point = new Point(_p1.x, _p1.y);
			}
			return point;
		}
		
	}
}