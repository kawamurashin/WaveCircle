/**
 * Created with IntelliJ IDEA.
 * User: jaiko
 * Date: 14/05/01
 * Time: 15:06
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;
import flash.events.Event;

public class ViewManager extends Sprite{
    private static var instance:ViewManager;
    public var cx:Number;
    public var cy:Number;
    private var circle:CircleRing;
    public function ViewManager(block:SingletonBlock) {
        if(stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE,init);
    }
    public static function getInstance():ViewManager
    {
        if(instance == null)
        {
            instance = new ViewManager(new SingletonBlock());
        }
        return instance;
    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        //
        layout();
    }

    private function layout():void {
        //
        cx = stage.stageWidth *0.5;
        cy = stage.stageHeight *0.5;
        circle = new CircleRing();
        addChild(circle);

        addEventListener(Event.ENTER_FRAME,enterFrameHandler);
    }

    private function enterFrameHandler(event:Event):void {
        circle.onEnterFrame();
    }
}
}
class SingletonBlock{

}
