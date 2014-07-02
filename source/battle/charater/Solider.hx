package battle.charater;

import Math;
import Array;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Solider extends FlxSprite{

    public var beAttacked:Array<Solider>;//[前，后]
    public var toAttack:Solider;//[前，后]
    public var dead(default,set):Bool;
    public var type:Int;


    public function new(X:Float = 0, Y:Float = 0) {
        super(X, Y);
        makeGraphic(50,50,FlxColor.RED);
        beAttacked = new Array<Solider>();
    }
    public function attack(solider:Solider,?facetoface:Bool = true):Void{
        toAttack = solider;
        if(facetoface){
            beAttacked.push(solider);
        }


    }

    public function set_dead(value:Bool):Bool{
        dead = value;
        makeGraphic(50,50);
        return value;
    }
    public function lookforOppent():Void{


    }
    public function run(vx:Float,vy:Float):Void{
        velocity.x = vx;
        velocity.y = vy;
    }
    public function stop():Void{
        velocity.x = 0;
        velocity.y = 0;
    }

    public function attackFront(solider:Solider):Void{


    }
    public function attackBack(solider:Solider):Void{


    }
    override public function update():Void{
        super.update();

        checkAttackTargetPos();
        checkOpponentStatus();

    }
    /*检查是否在攻击对象的正确位置*/
    private function checkAttackTargetPos(){
        if(toAttack != null){
            gotoTarget(toAttack);
        }
    }
    /*检查攻击对象是否已经死亡，更新攻击目标*/
    private function checkOpponentStatus(){
        if(toAttack != null){
            if(toAttack.dead)
                toAttack = null;
        }
    }
    private static var V:Float  = 300;
    public function gotoTarget(solider:Solider):Void{
        if(Math.abs(x - solider.x) < 10 && Math.abs(y - solider.y) < 20){
            stop();
            return;
        }

        var dx:Float = solider.x - x;
        var dy:Float = solider.y - y;

        var vx:Float = dx > 0 ? V : -V;
        var vv:Float = Math.abs(V*dy/dx);
        var vy:Float = dy >0 ? vv : -vv;
        run(vx,vy);
    }


}
