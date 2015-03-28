import utest.Assert;

class TestBit64_Abstract_ArrayAccess_Int64 {
	
	public function new() {}
	
	public function testString() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testShiftLeft() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shl(7);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shl(8);
		trace(b.toBoard());
		Assert.equals("
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shl(15);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shl(16);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testShiftRight() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shr(7);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 1 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 1 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 1 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shr(8);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shr(15);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 1 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 1 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 1 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		b.shr(16);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testSet() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[23] = 1;
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[24] = 1;
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[31] = 1;
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[32] = 1;
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[63] = 1;
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[0] = 1;
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testGet() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[23] = 1;
		trace(b.toBoard());
		Assert.equals(1, b[23]);
		Assert.equals(0, b[22]);
		Assert.equals(0, b[24]);
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[24] = 1;
		trace(b.toBoard());
		Assert.equals(1, b[24]);
		Assert.equals(0, b[23]);
		Assert.equals(0, b[25]);
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[31] = 1;
		trace(b.toBoard());
		Assert.equals(1, b[31]);
		Assert.equals(0, b[30]);
		Assert.equals(0, b[32]);
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[32] = 1;
		trace(b.toBoard());
		Assert.equals(1, b[32]);
		Assert.equals(0, b[31]);
		Assert.equals(0, b[33]);
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[63] = 1;
		trace(b.toBoard());
		Assert.equals(1, b[63]);
		Assert.equals(0, b[62]);
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		b[0] = 1;
		trace(b.toBoard());
		Assert.equals(1, b[0]);
		Assert.equals(0, b[1]);
	}
	
	public function testClr() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b.toBoard());
		b[0] = 0;
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b[32] = 0;
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b[63] = 1;
		Assert.equals("
 0 0 0 0 0 0 0 1
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b[63] = 0;
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b[31] = 1;
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
		b[31] = 0;
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testAnd() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([1,1,1,1]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b.toBoard());
		var b2 = new Bit64_Abstract_ArrayAccess_Int64([1,0,1,1]);
		trace(b2.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b2.toBoard());
		b.and(b2);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([255,1,1,65535]);
		trace(b.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
", b.toBoard());
		b2 = new Bit64_Abstract_ArrayAccess_Int64([1,0,1,65281]);
		trace(b2.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b2.toBoard());
		b.and(b2);
		trace(b.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 0 0 0 0 0 0 0
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([255,255,255,255]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
", b.toBoard());
		b2 = new Bit64_Abstract_ArrayAccess_Int64([65280,65280,65280,65280]);
		trace(b2.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
", b2.toBoard());
		b.and(b2);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testOr() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([255,255,255,255]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
", b.toBoard());
		var b2 = new Bit64_Abstract_ArrayAccess_Int64([65280,65280,65280,65280]);
		trace(b2.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
", b2.toBoard());
		b.or(b2);
		trace(b.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
", b.toBoard());
	}
	
	public function testXor() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([255,255,255,255]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
", b.toBoard());
		var b2 = new Bit64_Abstract_ArrayAccess_Int64([65280,65280,65280,65280]);
		trace(b2.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
", b2.toBoard());
		b.xor(b2);
		trace(b.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
", b.toBoard());
		b = new Bit64_Abstract_ArrayAccess_Int64([255,255,255,255]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
", b.toBoard());
		b2 = new Bit64_Abstract_ArrayAccess_Int64([255,255,255,65280]);
		trace(b2.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
", b2.toBoard());
		b.xor(b2);
		trace(b.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testNot() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([255,255,255,255]);
		trace(b.toBoard());
		Assert.equals("
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
", b.toBoard());
		b.not();
		trace(b.toBoard());
		Assert.equals("
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 0
", b.toBoard());
	}
	
	public function testIsZero() {
		var b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,0]);
		Assert.equals(b.isZero(), true);
		b = new Bit64_Abstract_ArrayAccess_Int64([0,1,0,0]);
		Assert.equals(b.isZero(), false);
		b = new Bit64_Abstract_ArrayAccess_Int64([0,0,0,1]);
		Assert.equals(b.isZero(), false);
		b = new Bit64_Abstract_ArrayAccess_Int64([1,0,0,0]);
		Assert.equals(b.isZero(), false);
	}
}
