package de.patrickkulling.tween.easing;

class Elastic 
{
	private static inline var _2PI : Float = Math.PI * 2;
	
	public static inline function easeIn(t : Float, b : Float, c : Float, d : Float) : Float
	{
		var s : Float;
		var p : Float = d*.3;
		var a : Float = c;

		if (t==0) 
			return b;  
		
		if ((t/=d)==1) 
			return b+c;  

		if ((c > 0 && a < c) || (c < 0 && a < -c)) 
		{ 
			a=c; 
			s = p/4; 
		}
		else 
			s = p/_2PI * Math.asin (c/a);

		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*_2PI/p )) + b;
	}

	public static inline function easeOut(t : Float, b : Float, c : Float, d : Float) : Float
	{
		var s : Float;
		var p : Float = d*.3;
		var a : Float = c;

		if (t==0) 
			return b;  
		
		if ((t/=d)==1) 
			return b+c;  

		if ((c > 0 && a < c) || (c < 0 && a < -c)) 
		{ 
			a=c; 
			s = p/4; 
		}
		else 
			s = p/_2PI * Math.asin (c/a);

		return (a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*_2PI/p ) + c + b);
	}

	public static inline function easeInOut(t : Float, b : Float, c : Float, d : Float) : Float
	{
		var s : Float;
		var p : Float = d*(.3*1.5);
		var a : Float = c;
		
		if (t==0) 
			return b;  

		if ((t/=d*0.5)==2) 
			return b+c;  

		if ((c > 0 && a < c) || (c < 0 && a < -c)) 
		{ 
			a=c; 
			s = p/4; 
		}
		else 
			s = p/_2PI * Math.asin (c/a);
		
		if (t < 1) 
			return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*_2PI/p )) + b;

		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*_2PI/p )*.5 + c + b;
	}
}