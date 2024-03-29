hxUtils
==================

This project now contains the following sub utilities:

* hxTasks (as3, js, neko)
* hxSignal (as3, js, neko)
* hxTween (as3, js)

Unit Tests
-----

Use

	haxelib run munit test



-----
hxTasks
==================

This library provides a simple way to run synchronous or asynchronous tasks in a sequential order.
It's based on the [spicefactory task framework](http://www.spicefactory.org/)


**Dependencies**

- none


Usage
-----

**API Usage**

The API should be very straight forward. To implement your own task you need to extend from the 'Task' class first and overwrite the 'doStart()' method. At the end you have to call the 'complete()' method.

E.g.

	class ExampleTask extends Task
	{
		public override function doStart() : Void
		{
			trace("do synchronous stuff...");
			
			complete();
		}
	}
	

To run multiple tasks in a sequential order you can use the 'SequentialTaskGroup':

E.g.

	var group : SequentialTaskGroup = new SequentialTaskGroup();
	group.add(new FirstTask());
	group.add(new SecondTask());
	group.add(new ThirdTask());

	group.start();

