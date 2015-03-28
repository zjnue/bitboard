import utest.Runner;
import utest.ui.Report;

class TestAll {
	public static function addTests(runner : Runner) {
		runner.addCase(new TestBit64());
		runner.addCase(new TestBit64_Int64());
		runner.addCase(new TestBit64_Abstract_Int64());
		runner.addCase(new TestBit64_Abstract_ArrayAccess_Int64());
	}

	public static function main() {
		var runner = new Runner();
		addTests(runner);
		Report.create(runner);
		runner.run();
	}
}
