package {

import flash.display.Sprite;
import flash.text.TextField;

public class WaveCircle extends Sprite {
    public function WaveCircle() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
    }
}
}
