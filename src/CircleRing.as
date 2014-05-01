/**
 * Created with IntelliJ IDEA.
 * User: jaiko
 * Date: 14/05/01
 * Time: 15:08
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;

public class CircleRing extends Sprite{

    private var expansionForce:Number;
    private  var radius:Number;
    private var viewManager:ViewManager;
    private var pointList:Array;
    public function CircleRing() {
        if(stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE, init);
    }
    public function  onEnterFrame():void
    {
        var i:uint;
        var n:uint;
        var prePoint:CirclePoint
        var point:CirclePoint;
        var force:Number;
        var theta:Number = 0;
        var distance:Number = 0;
        //
        n = pointList.length;
        for(i=0;i<n;i++)
        {
            point = pointList[i];
            theta = Math.atan2(point.y - viewManager.cy , point.x - viewManager.cx);
            distance = Math.sqrt(Math.pow(point.x - viewManager.cx,2)+Math.pow(point.y -viewManager.cy,2));
            force = 1/distance;
            point.forceX = force*Math.cos(theta);
            point.forceY = force*Math.sin(theta);

            point.onEnterFrame();
            draw();
        }
        trace(force);
    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        //
        layout();
    }

    private function layout():void
    {
        var i:uint;
        var n:uint;
        var theta:Number;
        var point:CirclePoint;
        //
        viewManager =ViewManager.getInstance();
        pointList = [];
        radius = 100;
        n = 12;
        for(i=0;i<n;i++)
        {
            theta =i*(360/n) * Math.PI/180;
            point = new CirclePoint();
            addChild(point);
            point.x = viewManager.cx + radius*Math.cos(theta);
            point.y = viewManager.cy + radius * Math.sin(theta);
            pointList.push(point)
        }
        draw();
    }
    private function draw():void
    {
        var i:uint;
        var n:uint;
        var point:CirclePoint;
        var g:Graphics = this.graphics;
        g.clear();
        g.beginFill(0x000000)
        n = pointList.length;
        for(i=0;i<n;i++)
        {
            point = pointList[i];
            if(i==0)
            {
                g.moveTo(point.x,point.y);
            }
            else
            {
                g.lineTo(point.x,point.y);
            }

        }

    }
}
}
