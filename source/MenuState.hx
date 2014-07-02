package;

import tools.LogUtil;
import component.PTFlxUIState;
import component.PTFlxUIButton;
import flixel.addons.ui.interfaces.IFlxUIButton;
import com.putaolab.list.PanelList;
import com.putaolab.module.backpack.GoodsItem;
import com.putaolab.list.BaseItem;
import tools.PlaySounds;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends PTFlxUIState
{
    private var _prevButton:PTFlxUIButton;
    private var _nextButton:PTFlxUIButton;
    private var _goodsList:PanelList;

	override public function create():Void
	{
		super.create();
        initialise();
	}

    public function initialise():Void{
        var itemArr:Array<BaseItem> = new Array<BaseItem>();
        for(i in 0...20){
            var goodsItem:GoodsItem = new GoodsItem();
            itemArr.push(goodsItem);
        }
        _goodsList = new PanelList(0,0,3,3);
        _goodsList.x = 230;
        _goodsList.y = 30;
        add(_goodsList);
        _goodsList.setDatas(itemArr);
        _goodsList.refreshList();

        initBtn();
    }

    public function initBtn():Void{
        _nextButton = new PTFlxUIButton(0,0,"next");
        _nextButton.params = ["next"];
        _nextButton.x = 510;
        _nextButton.y = 410;
        add(_nextButton);

        _prevButton = new PTFlxUIButton(0,0,"prev");
        _prevButton.params = ["prev"];
        _prevButton.x = 280;
        _prevButton.y = 410;
        add(_prevButton);
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

    override public function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void{
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "next":
                            _goodsList.pageIndex = 1;
                        case "prev":
                            _goodsList.pageIndex = -1;
                    }
                case "click_PTFlxUIGroup":
                    trace("click_PTFlxUIGroup");
            }
        }
    }
}