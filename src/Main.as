package {

import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;

import net.hires.debug.Stats;
[SWF(frameRate='60', width='465', height='465')]
public class Main extends Sprite {

    public function Main() {
        if(stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE,init);
    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE,init);
        //
        layout();
    }

    private function layout():void {
        var viewManager:ViewManager = ViewManager.getInstance();
        addChild(viewManager);

        var stats:Stats = new Stats();
        addChild(stats);

    }
}
}
