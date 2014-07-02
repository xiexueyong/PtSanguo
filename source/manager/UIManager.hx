package manager;

import flixel.addons.ui.FlxUISubState;
import flixel.addons.ui.FlxUIState;
import flixel.FlxG;
/**
 * User: gaoyun
 * Date: 14-6-30
 * Time: 下午3:38
 * description：UI管理器
 */

class UIManager {
    private static var uiManager:UIManager;
    private var currentState:FlxUIState;
    private var currentSubState:FlxUISubState;
    private var subStateArr:Array<FlxUISubState>;

    private function new() {
        subStateArr = new Array<FlxUISubState>();
    }
    public static function getInstance():UIManager{
        if(uiManager==null){
            uiManager = new UIManager();
        }
        return uiManager;
    }


    public function switchState(state:FlxUIState):Void{
        if(currentState != null){
            currentState.destroy();
            currentState = null;
        }
        currentState = state;
        FlxG.switchState(currentState);
    }

    public function openSubState(subState:FlxUISubState,?state:FlxUIState):Void{
        if(currentState == null){
            currentState = state;
        }
//        hiddenSubState();
        subStateArr.push(subState);
        currentSubState = subState;
        currentState.openSubState(currentSubState);
        trace("openSubState :"+subStateArr.length);
    }

    //除了最新弹出的substate，隐藏其他substate.
    private function hiddenSubState():Void{
        if(subStateArr == null || subStateArr.length == 0){
            return;
        }
        for(i in 0...subStateArr.length){
            subStateArr[i];
        }
        trace(subStateArr.length);
    }

    public function closeSubState():Void{
        var closedSubState:FlxUISubState = subStateArr.shift();
        closedSubState.close();
//        if(subStateArr.length>0){//如果还有substate，弹出来。
//            trace(subStateArr[subStateArr.length-1]);
//            currentState.openSubState(subStateArr[subStateArr.length-1]);
//        }
    }


    public function center():Void{

    }
}
