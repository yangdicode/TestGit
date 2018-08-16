package mmo.interfaces.battle {
import mmo.framework.domain.battle.BattleParams;
import mmo.interfaces.IInitService;

public interface IBattleService extends IInitService {
    /**
     * 创建单对单怪物战斗
     * @param monsterId    怪物Id
     * @param monsterLv        怪物等级
     * @param battleParams，战斗参数，什么时候可以逃跑、可以使用道具等。
     */
    function createMonsterBattle(monsterId:int, monsterLv:int, battleParams:BattleParams = null):void;

    /**
     * 创建怪物战斗。
     * 一对一、一对多、多对多都可以调用本方法进行战斗。
     * @param monsters，怪物数组，对于数组中的每个元素有id和lv属性，分别代表怪物id和等级
     * @param assistors，己方帮忙的怪物数字，同样有id和lv属性。
     * @param battleParams，战斗参数，什么时候可以逃跑、可以使用道具等。
     */
    function createTeamMonsterBattle(monsters:Array, battleParams:BattleParams = null, assistors:Array = null):void;

    /**
     * 设置血量与魔法值，为负则为最大值
     */
    function recover(hp:int = -1):void;

    /**
     * 创建特定职业的战斗
     * @param proId                职业id
     * @param proLv                职业等级
     * @param monsters            怪物数组，对于数组中的每个元素有id和lv属性，分别代表怪物id和等级
     * @param assistors            己方帮忙的怪物数字，同样有id和lv属性。
     * @param battleParams        战斗参数，什么时候可以逃跑、可以使用道具等。
     */
    function createSBBattle(proId:int, proLv:int, monsters:Array, battleParams:BattleParams = null, assistors:Array = null):void;

    /**
     * 创建迷境七宫战斗,怪物队友等由后端控制
     * @param battleParams        战斗参数，什么时候可以逃跑、可以使用道具等。
     */
    function createLabyrinthBattle(battleParams:BattleParams = null):void;

    /**
     * 创建迷境七宫PK,怪物队友等由后端控制
     * @param battleParams    。
     */
    function createLabyrinthPK(battleParams:BattleParams = null):void;

    /**
     * 创建PK战斗
     */
    function createPKBattle(params:BattleParams = null):void;

    /**
     * 是否正在战斗。
     */
    function isInBattle():Boolean;

    /**
     * 新手任务需要（保存自动战斗设置的状态）
     */
    function setAutoFightState(isAuto:Boolean):void;

    /**
     *    方法已废弃
     * <br/>请使用createCommonBattle
     */
    function createNewSxBattle(id:int, type:int, battleParams:BattleParams = null):void;

    /**
     * 创建离线战斗,不需要玩家在线
     * @param id 活动id,由后端决定,告知前端
     * @param strExt 内部处理器负责解析，也是根据活动，由后端决定
     * @param battleParams 战斗参数，什么时候可以逃跑、可以使用道具等。
     */
    function createOfflineBattle(id:int, strExt:String, battleParams:BattleParams = null):void;

    /**
     *    创建新战斗，内部调用 createNewSxBattle，只因type跟id的位置惹的祸
     * @param battleType    后端战斗类型
     * @param battleId    后端战斗类型中的小分支id，可以不填
     * @param battleParams    战斗参数，什么时候可以逃跑、可以使用道具等。
     *
     */
    function createCommonBattle(battleType:int, battleId:int = 0, battleParams:BattleParams = null):void;

    function get canBattle():Boolean;
}
}