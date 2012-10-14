import massive.munit.TestSuite;

import de.patrickkulling.task.SequentialTaskGroupTest;
import de.patrickkulling.task.TaskTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(de.patrickkulling.task.SequentialTaskGroupTest);
		add(de.patrickkulling.task.TaskTest);
	}
}
