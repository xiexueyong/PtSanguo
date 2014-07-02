package battle.charater;

import flixel.util.FlxColor;
class General extends Solider{

    public function new(X:Float = 0, Y:Float = 0) {
        super(X, Y);
        makeGraphic(50,50,FlxColor.BLUE);
    }



}
