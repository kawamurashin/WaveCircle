/**
 * Created with IntelliJ IDEA.
 * User: jaiko
 * Date: 14/05/01
 * Time: 16:42
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;

public class CirclePoint extends Sprite {
    private var M:Number = 1;
    private var U:Number = 0.01;
	private var _defaultX:Number = 0;
	private var _defaultY:Number = 0;
    private var _forceX:Number = 0;
    private var _forceY:Number = 0;
    private var _vx:Number = 0;
    private var _vy:Number = 0;
    public function CirclePoint() {
        if(stage)init(null);
        else addEventListener(Event.ADDED_TO_STAGE, init);
    }
    public function onEnterFrame():void
    {
        vx += (_forceX/M) - U * vx;

        vy += (_forceY/M) - U * vy;
        x += vx;
        y += vy;

    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        //
        layout();
    }

    private function layout():void {
		/*
        var g:Graphics = this.graphics;
        g.beginFill(0xff0000);
        g.drawCircle(0,0,2);
		*/
    }

    public function get vx():Number {
        return _vx;
    }

    public function set vx(value:Number):void {
        _vx = value;
    }

    public function get vy():Number {
        return _vy;
    }

    public function set vy(value:Number):void {
        _vy = value;
    }

    public function get forceX():Number {
        return _forceX;
    }

    public function set forceX(value:Number):void {
        _forceX = value;
    }

    public function get forceY():Number {
        return _forceY;
    }

    public function set forceY(value:Number):void {
        _forceY = value;
    }
	
	public function get defaultX():Number 
	{
		return _defaultX;
	}
	
	public function set defaultX(value:Number):void 
	{
		_defaultX = value;
		this.x = _defaultX;
	}
	
	public function get defaultY():Number 
	{
		return _defaultY;
	}
	
	public function set defaultY(value:Number):void 
	{
		_defaultY = value;
		this.y = _defaultY;
	}
}
}
