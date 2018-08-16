package mmo.interfaces {
	
	import mmo.interfaces.activity.IActivity;
	import mmo.interfaces.agtask.AGTaskCompiler;
	import mmo.interfaces.aoyatv.IAoYaTVService;
	import mmo.interfaces.battle.BattleEvent;
	import mmo.interfaces.battle.BattleEventDispatcher;
	import mmo.interfaces.battle.BattleParamsType;
	import mmo.interfaces.buddy.BuddyEvent;
	import mmo.interfaces.buddy.BuddyEventDispatcher;
	import mmo.interfaces.buddy.BuddyPanelType;
	import mmo.interfaces.card.ICardSkillService;
	import mmo.interfaces.clothesdesign.CloDesEvent;
	import mmo.interfaces.clothesdesign.CloDesEventDispatcher;
	import mmo.interfaces.fairy.IFairyService;
	import mmo.interfaces.fbservice.FBEvent;
	import mmo.interfaces.fbservice.FBEventDispatcher;
	import mmo.interfaces.fbservice.IFBStep;
	import mmo.interfaces.garden.CompileGarden;
	import mmo.interfaces.jumpsoon.JumpSoonEvent;
	import mmo.interfaces.map.IMapCancel;
	import mmo.interfaces.menu.IMenuService;
	import mmo.interfaces.notify.INotifyDialog;
	import mmo.interfaces.notify.NotifyLevel;
	import mmo.interfaces.notify.NotifyServiceEvent;
	import mmo.interfaces.notify.OfflineMsgServiceEvent;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.interfaces.petbreeding.IPetBreedingService;
	import mmo.interfaces.resource.CompileRes;
	import mmo.interfaces.supermodel.ISuperModelService;
	import mmo.interfaces.talk.IPrivateTalkPanel;
	import mmo.interfaces.talk.PrivateTalkEvent;
	import mmo.interfaces.task.TaskCompiler;
	import mmo.interfaces.team.TeamEvent;
	import mmo.interfaces.usercard.UserCardServiceEvent;
	import mmo.interfaces.util.ITips;

	public class CompileInterfaces {

		public function CompileInterfaces() {
		}

		public static function compileMe():void {
			CompileGarden.compileMe();
			CompileRes.compileMe();
			FairyBattleCompile.compileMe();
			
			var dispsoe:IDispose;
			
			var offlineMsgEvt:OfflineMsgServiceEvent;
			var nse:NotifyServiceEvent;
			var nl:NotifyLevel;
			var ind:INotifyDialog;
			
			var buddyEvent:BuddyEvent;
			var bed:BuddyEventDispatcher;
			var privateTalkPanel:IPrivateTalkPanel;
			var privateTalkEvent:PrivateTalkEvent;
			var buddyPanelType:BuddyPanelType;
			
			var taskComplier:TaskCompiler;
			
			var battleEvent:BattleEvent;
			var battleEventDispatch:BattleEventDispatcher;
			var battleParamsType:BattleParamsType;
			
			var fbEvent:FBEvent;
			var fbEventDispatcher:FBEventDispatcher;
			var iFBStep:IFBStep;
			
			var itips:ITips;
			
			var ucse:UserCardServiceEvent;
			
			var iPetBreedingService:IPetBreedingService;
			
			var teamEvent:TeamEvent;
			
			var agTaskComplier:AGTaskCompiler;
			
			var mapCancel:IMapCancel;
			
			var fairyservice:IFairyService;
			
			var cardSkillService:ICardSkillService;
			
			var cloEvent:CloDesEvent;
			var cloDispatcher:CloDesEventDispatcher;
			
			var nurExtNode:NurExtNode;
			
			JumpSoonEvent;
			IActivity;
			
			var aoYaTVService:IAoYaTVService;
			var menu:IMenuService;
			
			var superModel:ISuperModelService;
		}
	}
}