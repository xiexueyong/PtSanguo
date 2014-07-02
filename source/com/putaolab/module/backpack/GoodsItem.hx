package com.putaolab.module.backpack;

import flixel.util.FlxColor;
import manager.AssetsManager;
import flixel.FlxSprite;
import com.putaolab.list.BaseItem;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:37
 * description：
 */

class GoodsItem extends BaseItem{
    private var _sp:FlxSprite;

    public function new(X:Float = 0,Y:Float = 0,?Params:Array<Dynamic>,?Callback:Void->Void) {
        super(X,Y,Params,Callback);
        initialise();
    }


    public function initialise():Void{
        _sp = new FlxSprite(0,0);
        _sp.loadGraphic("assets/images/icon_1.png");
        add(_sp);
        button.resize(_sp.width,_sp.height);
    }



}
