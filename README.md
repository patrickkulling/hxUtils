hxUtils
==================

This project now contains the following sub utilities:

* hxTasks
* hxSignal
* hxTween

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

The API should be very straigh forwarded. To implement your own task you need to extend from the 'Task' class first and overwrite the 'doStart()' method. After your task is finish you have to call the 'complete()' method.

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


Change log
----------
**v 0.2**

* **[Modify]** Tasks uses now smaller hxSignal class to reduce file size

**v 0.1**

* **[Added]** Initial Task implementation