package com.putaolab.list;

import component.PTFlxUIGroup;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:57
 * description：
 */

class BaseItem extends PTFlxUIGroup{
    public var name:String;
    public var type:String;


    public function new(X:Float = 0,Y:Float = 0,?Params:Array<Dynamic>,?Callback:Void->Void) {
        super(X,Y,Params,Callback);
    }

}
