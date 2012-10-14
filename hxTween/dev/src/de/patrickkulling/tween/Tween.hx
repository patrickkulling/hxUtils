package de.patrickkulling.tween;

import haxe.Timer;

import de.patrickkulling.tween.easing.Sine;

class Tween
{
	private static var frameTimer : Timer;

	private static var tweenables : Array<Tween> = new Array<Tween>();
	private static var isInitialized : Bool = false;

	private var target : Dynamic;
	private var duration : Float;
	private var time : Float;
	private var startTime : Float;
	private var properties : Array<TweenProperty>;
	private var easing : Float->Float->Float->Float->Float;
	private var completeHandler : Void -> Void;

	private function new(target : Dynamic, duration : Float, variables : Array<Dynamic>, easing : Float->Float->Float->Float->Float = null, completeHandler : Void -> Void = null)
	{
		if(isInitialized == false)
		{
			frameTimer = new Timer(31);
			frameTimer.run = handleEnterFrame;
			
			isInitialized = true;
		}

		this.target = target;
		this.duration = duration;
		this.time = 0;
		this.properties = new Array<TweenProperty>();
		this.easing = Sine.easeIn;
		this.completeHandler = completeHandler;

		if(easing != null)
			this.easing = easing;

		parseFieldVariables(variables);

		this.startTime = Date.now().getTime() * 0.001;

		tweenables.push(this);
	}

	public static function to(target : Dynamic, duration : Float, variables : Array<Dynamic>, easing : Float->Float->Float->Float->Float = null, completeHandler : Void -> Void = null) : Tween
	{
		return new Tween(target, duration, variables, easing, completeHandler);
	}

	public static inline function handleEnterFrame() : Void
	{
		var currentTime : Float = Date.now().getTime() * 0.001;
		
		for (tween in tweenables) 
		{
			if(tween.time < tween.duration)
			{
				tween.iterate(currentTime - tween.startTime);
			}
			else
			{
				tweenables.remove(tween);

				tween.iterate(tween.duration);

				if(tween.completeHandler != null)
					tween.completeHandler();
			}
		}
	}

	private inline function iterate(renderTime : Float) : Void
	{
		for (property in properties) 
		{
			var newValue : Float = easing(time, property.getStartValue(), property.getChangeByValue(), duration);
			
			Reflect.setField(target, property.getKey(), newValue);
		}

		time = renderTime;
	}

	private inline function parseFieldVariables(variables : Array<Dynamic>) : Void
	{
		var startValue : Float = 0;

		for (pairs in variables) 
		{
			for (key in Reflect.fields (pairs)) 
			{
				startValue = Reflect.field(target, key);
				properties.push(new TweenProperty(key, startValue, Reflect.field(pairs, key) - startValue));
			}
		}
	}
}

private class TweenProperty
{
	private var _key : String;
	private var _startValue : Float;
	private var _changeByValue : Float;

	public function new(key : String, startValue : Float, changeByValue : Float)
	{
		_key = key;
		_startValue = startValue;
		_changeByValue = changeByValue;	
	}

	public inline function getKey() : String
	{
		return _key;
	}

	public inline function getStartValue() : Float
	{
		return _startValue;
	}

	public inline function getChangeByValue() : Float
	{
		return _changeByValue;
	}
}