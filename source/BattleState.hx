package;

import battle.charater.Troops;
import battle.map.Level;
import flixel.FlxState;
import battle.map.Level;


class BattleState extends FlxState
{
    public var level:Level;
    private var troopLeft:Troops;
    private var troopRight:Troops;

	override public function create():Void
	{
        level = new Level("assets/maps/test2.tmx", "assets/maps/test2.tanim");
        add(level.backgroundGroup);
        add(level.comonBackgroundGroup);
        add(level.backDecorateGroup);
        add(level.characterGroup);
        add(level.decorateGroup);
        add(level.foregroundGroup);
        add(level.comonForegroundGroup);
        add(level.collisionGroup);

        super.create();
        troopLeft = new Troops(1,100);
        add(troopLeft);
        troopRight = new Troops(2,101);
        troopRight.x = 800;
        troopRight.y = 400;
        add(troopRight);
        attack();
	}
	private function attack():Void{
        troopRight.setAttackTarget(troopLeft);
        troopLeft.setAttackTarget(troopRight);
    }
    private function gotoTarget():Void{



    }
	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}