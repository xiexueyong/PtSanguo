package battle.charater;

import Math;
import Math;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxTypedGroup;
import Array;
class Troops extends FlxSpriteGroup{
    public var general:General;
    public var soliders:Array<Solider>;
    public var units:Array<Solider>;
    public var id:Int;
    public var type:Int;
    public var target:Troops;

    public function new(id:Int,type:Int) {
        super();
        this.id = id;
        this.type = type;
        //初始化军队
        units = new Array<Solider>();

        general = new General();
        general.x  =130;
        general.y  =130;
        units.push(general);
        add(general);
        soliders = new Array<Solider>();

        var count:Int = 0;
        if(id == 1){
            count = 10;
        }else{
            count = 20;
        }
        for(i in 0...count){
            var s:Solider = new Solider();
            soliders.push(s);
            units.push(s);
            add(s);
            if(i % 2 == 0){
                s.x = 0;
            }else{
                s.x = 60;
            }
            s.y = i/2 * 60;
        }

    }
    private static var V:Float = 200;
    public function setAttackTarget(troop:Troops):Void{
        this.target = troop;
        attackTarget();
    }

    private function run(vx:Float,vy:Float):Void{
        for(i in 0...units.length){
            units[i].velocity.x = vx;
            units[i].velocity.y = vy;
        }
    }
    private function attackTarget():Void{
        var targetUnits:Array<Solider> = this.target.units;
        var i:Int = 0;
        while(i < targetUnits.length && i < units.length){
            attackFaceToFace(targetUnits[i],units[i]);
            i++;
        }

        var j:Int = 0;
        if(i < targetUnits.length){
            while(i < targetUnits.length){
                attackBack(targetUnits[i],units[j]);
                j++;
                i++;
            }
        }else if(i < units.length){
            while(i < units.length){
                attackBack(units[i],targetUnits[j]);
                j++;
                i++;
            }
        }

    }
    private inline function attackFaceToFace(solider1:Solider,solider2:Solider):Void{
        solider1.attack(solider2);
        solider2.attack(solider1);
    }
    private inline function attackBack(solider1:Solider,solider2:Solider):Void{
        solider1.attack(solider2,false);
    }
    private function checkSoliderOpponent():Void{
        for(i in 0...units.length){
            if(units[i].toAttack == null){
                lookForOpponent(units[i]);
            }
        }

    }
    private function lookForOpponent(solider:Solider):Solider{
        if(target != null){
            var units:Array<Solider> = target.units;
            for(i in 0...units.length){
                if(units[i].beAttacked.length == 1){
                    attackFaceToFace(solider,units[i]);
                }else if(units[i].beAttacked.length == 2){
                    attackBack(solider,units[i]);
                }
            }
        }



    }
    override public function update():Void{
        super.update();
        checkSoliderOpponent();


    }
}
