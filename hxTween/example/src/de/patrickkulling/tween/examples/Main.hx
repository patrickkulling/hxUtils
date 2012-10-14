package de.patrickkulling.tween.examples;

import de.patrickkulling.tween.Tween;
import flash.display.Sprite;

import de.patrickkulling.tween.easing.Sine;

class Main
{
	public static function main()
	{
		new Main();
	}	

	public function new()
	{
		var sprite : Sprite = new Sprite();
		sprite.graphics.beginFill(0xff0000, 1);
		sprite.graphics.drawRect(0, 0, 10, 10);
		sprite.graphics.endFill();

		start = Date.now().getTime();

		var tween : Tween = Tween.to(sprite, 2, [{x: 200, alpha: 0.1}], Sine.easeIn, handleTweenComplete);

		flash.Lib.current.addChild(sprite);
	}

	function handleTweenComplete() : Void
	{
		trace("tween complete");
	}
}