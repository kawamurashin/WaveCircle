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
import flash.events.TimerEvent;
import flash.utils.Timer;

public class CircleRing extends Sprite {
    private const K:Number = 0.1;

    public function CircleRing() {
        if (stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private var expansionForce:Number;
    private var radius:Number;
    private var viewManager:ViewManager;
    private var balancePoint:Sprite;
    private var pointList:Array;

    public function onEnterFrame():void {
        var i:uint;
        var n:uint;

        var prePoint:CirclePoint
        var point:CirclePoint;
        var nextPoint:CirclePoint;
        var force:Number;
        var theta:Number = 0;
        var distance:Number = 0;
        var disX:Number = 0;
        var disY:Number = 0;
        var balanceX:Number = 0;
        var balanceY:Number = 0
        //
        n = pointList.length;
        for (i = 0; i < n; i++) {
            point = pointList[i];
            theta = Math.atan2(point.y - balancePoint.y, point.x - balancePoint.x);
            distance = Math.sqrt(Math.pow(point.x - balancePoint.x, 2) + Math.pow(point.y - balancePoint.y, 2));
            force = 50 / distance;
            point.forceX = force * Math.cos(theta);
            point.forceY = force * Math.sin(theta);
            //
            if (i == 0) {
                prePoint = pointList[n - 1];
                nextPoint = pointList[i + 1];
            }
            else if (i == n - 1) {
                prePoint = pointList[i - 1];
                nextPoint = pointList[0];
            }
            else {
                prePoint = pointList[i - 1];
                nextPoint = pointList[i + 1];
            }
            disX = prePoint.x - point.x;
            disY = prePoint.y - point.y;
            point.forceX += K * disX;
            point.forceY += K * disY;

            disX = nextPoint.x - point.x;
            disY = nextPoint.y - point.y;
            point.forceX += K * disX;
            point.forceY += K * disY;


        }
        n = pointList.length;
        for (i = 0; i < n; i++) {
            point = pointList[i];
            point.onEnterFrame();
            balanceX += point.x;
            balanceY += point.y;
        }
        balanceX = balanceX/n;
        balanceY = balanceY/n;
        balancePoint.x = balanceX;
        balancePoint.y = balanceY;
        draw();

        var timer:Timer = new Timer(1000);
        timer.addEventListener(TimerEvent.TIMER, timerHandler);
        timer.start();
    }

    private function timerHandler(event:TimerEvent):void {
        var point:CirclePoint;
        var theta:Number;
        var force:Number;

        force = 1;
        point = pointList[Math.floor(Math.random() *pointList.length)];
        theta = Math.atan2(balancePoint.y - point.y,balancePoint.x - point.x);
        point.forceX = force * Math.cos(theta);
        point.forceY = force * Math.sin(theta);
        point.onEnterFrame();


    }

    private function layout():void {
        var i:uint;
        var n:uint;
        var g:Graphics;
        var theta:Number;
        var point:CirclePoint;
        //
        viewManager = ViewManager.getInstance();
        //
        balancePoint = new Sprite();
        addChild(balancePoint);
        g = balancePoint.graphics;
        g.beginFill(0xFF0000);
        g.drawCircle(0,0,8);
        //
        pointList = [];
        radius = 100;
        n = 90;
        for (i = 0; i < n; i++) {
            theta = i * (360 / n) * Math.PI / 180;
            point = new CirclePoint();
            addChild(point);
            point.x = viewManager.cx + radius * Math.cos(theta);
            point.y = viewManager.cy + radius * Math.sin(theta);
            pointList.push(point)
        }
        draw();
    }

    private function draw():void {
        var i:uint;
        var n:uint;
        var point:CirclePoint;
        var g:Graphics = this.graphics;
        g.clear();
        g.beginFill(0x000000)
        n = pointList.length;
        for (i = 0; i < n; i++) {
            point = pointList[i];
            if (i == 0) {
                g.moveTo(point.x, point.y);
            }
            else {
                g.lineTo(point.x, point.y);
            }

        }

    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        //
        layout();
    }
}
}
