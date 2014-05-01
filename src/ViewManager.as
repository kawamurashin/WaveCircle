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

    }
}
}
class SingletonBlock{

}
