package mmo.nurturance.nodehandle.node
{
	import mmo.interfaces.nurturance.INurNode;
	import mmo.nurturance.nodehandle.node.npc.TalkNode;

	public class NurNodeType
	{
		public function NurNodeType()
		{
		}
		
		public static const NODE_EXT_CONFIG:Object =
			{
				"talk":TalkNode,
				"loadScene":LoadSceneNode,
				"branch":BranchNode,
				"music":MusicNode,
				"cg":CGNode,
				"panel":ShowPanelNode,
				"movie":MovieNode,
				"sceneNpc":SceneNpcNode,
				"music":MusicNode,
				"sound":SoundNode,
				"startChapter":StartChapterNode,
				"finishChapter":FinishChapterNode,
				"decision":DecisionNode,
				"noAction":NoActionNode,
				"specialEnding":SpecialEndingNode,
				"ending":EndingNode
			};
		
		public static const TALK:String = "talk";
		public static const LOAD_SCENE:String = "loadScene";
		public static const BRANCH:String = "branch";
		public static const MUSIC:String = "music";
		public static const CG:String = "cg";
		public static const PANEL:String = "panel";
		public static const MOVIE:String = "movie";
		public static const SCENE_NPC:String = "scenenpc";
		public static const START_CHAPTER:String = "startChapter";
		public static const FINISH_CHAPTER:String = "finishChapter";
		public static const DECISION:String = "decision";
		public static const ENDING:String = "ending";
		public static const NO_ACTION:String = "noAction";
		public static const SPECIAL_ENDING:String = "specialEnding";
		
		public static function getNurNode(type:String, xml:XML, vari:Object):INurNode
		{
			var cls:Class = NODE_EXT_CONFIG[type];
			return new cls(xml, vari);
		}
		
	}
}