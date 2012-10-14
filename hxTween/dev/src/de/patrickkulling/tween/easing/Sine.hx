package de.patrickkulling.tween.easing;

class Sine 
{
	private static inline var _HALF_PI : Float = Math.PI * 0.5;
	
	public static inline function easeIn(t : Float, b : Float, c : Float, d : Float) : Float
	{
		return -c * Math.cos(t/d * _HALF_PI) + c + b;
	}
	
	public static inline function easeOut(t : Float, b : Float, c : Float, d : Float) : Float
	{
		return c * Math.sin(t/d * _HALF_PI) + b;
	}
	
	public static inline function easeInOut(t : Float, b : Float, c : Float, d : Float) : Float
	{
		return -c*0.5 * (Math.cos(Math.PI*t/d) - 1) + b;
	}
}