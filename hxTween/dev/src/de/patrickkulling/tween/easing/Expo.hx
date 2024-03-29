package de.patrickkulling.tween.easing;

class Expo 
{
	public static inline function easeIn(t : Float, b : Float, c : Float, d : Float) : Float
	{
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b - c * 0.001;
	}
	
	public static inline function easeOut(t : Float, b : Float, c : Float, d : Float) : Float
	{
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	}
	
	public static inline function easeInOut(t : Float, b : Float, c : Float, d : Float) : Float
	{
		if (t==0) 
			return b;
		
		if (t==d) 
			return b+c;
		
		if ((t/=d*0.5) < 1) 
			return c*0.5 * Math.pow(2, 10 * (t - 1)) + b;
		
		return c*0.5 * (-Math.pow(2, -10 * --t) + 2) + b;
	}
}