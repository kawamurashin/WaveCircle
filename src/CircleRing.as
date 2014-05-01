/**
 * Created with IntelliJ IDEA.
 * User: jaiko
 * Date: 14/05/01
 * Time: 15:08
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;
import flash.events.Event;

public class CircleRing extends Sprite{
    public function CircleRing() {
        if(stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        //
        layout();
    }

    private function layout():void {

    }
}
}
