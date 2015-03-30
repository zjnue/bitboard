import utest.Assert;

class TestBit64_Abstract_Int64 {
	
	public function new() {}
	
	public function testString() {
		var b = new Bit64_Abstract_Int64([1,1,1,1]);
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shl(7);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shl(8);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shl(15);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shl(16);
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shr(7);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shr(8);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shr(15);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([1,1,1,1]);
		b.shr(16);
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(23);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(24);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(31);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(32);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(63);
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(0);
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(23);
		log(b.toBoard());
		Assert.equals(1, b.get(23));
		Assert.equals(0, b.get(22));
		Assert.equals(0, b.get(24));
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(24);
		log(b.toBoard());
		Assert.equals(1, b.get(24));
		Assert.equals(0, b.get(23));
		Assert.equals(0, b.get(25));
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(31);
		log(b.toBoard());
		Assert.equals(1, b.get(31));
		Assert.equals(0, b.get(30));
		Assert.equals(0, b.get(32));
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(32);
		log(b.toBoard());
		Assert.equals(1, b.get(32));
		Assert.equals(0, b.get(31));
		Assert.equals(0, b.get(33));
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(63);
		log(b.toBoard());
		Assert.equals(1, b.get(63));
		Assert.equals(0, b.get(62));
		b = new Bit64_Abstract_Int64([0,0,0,0]);
		b.set(0);
		log(b.toBoard());
		Assert.equals(1, b.get(0));
		Assert.equals(0, b.get(1));
	}
	
	public function testClr() {
		var b = new Bit64_Abstract_Int64([1,1,1,1]);
		log(b.toBoard());
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
		b.clr(0);
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
		b.clr(32);
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
		b.set(63);
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
		b.clr(63);
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
		b.set(31);
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
		b.clr(31);
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
		var b = new Bit64_Abstract_Int64([1,1,1,1]);
		log(b.toBoard());
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
		var b2 = new Bit64_Abstract_Int64([1,0,1,1]);
		log(b2.toBoard());
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
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([255,1,1,65535]);
		log(b.toBoard());
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
		b2 = new Bit64_Abstract_Int64([1,0,1,65281]);
		log(b2.toBoard());
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
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([255,255,255,255]);
		log(b.toBoard());
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
		b2 = new Bit64_Abstract_Int64([65280,65280,65280,65280]);
		log(b2.toBoard());
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
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([255,255,255,255]);
		log(b.toBoard());
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
		var b2 = new Bit64_Abstract_Int64([65280,65280,65280,65280]);
		log(b2.toBoard());
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
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([255,255,255,255]);
		log(b.toBoard());
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
		var b2 = new Bit64_Abstract_Int64([65280,65280,65280,65280]);
		log(b2.toBoard());
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
		log(b.toBoard());
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
		b = new Bit64_Abstract_Int64([255,255,255,255]);
		log(b.toBoard());
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
		b2 = new Bit64_Abstract_Int64([255,255,255,65280]);
		log(b2.toBoard());
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
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([255,255,255,255]);
		log(b.toBoard());
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
		log(b.toBoard());
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
		var b = new Bit64_Abstract_Int64([0,0,0,0]);
		Assert.equals(b.isZero(), true);
		b = new Bit64_Abstract_Int64([0,1,0,0]);
		Assert.equals(b.isZero(), false);
		b = new Bit64_Abstract_Int64([0,0,0,1]);
		Assert.equals(b.isZero(), false);
		b = new Bit64_Abstract_Int64([1,0,0,0]);
		Assert.equals(b.isZero(), false);
	}
	
	inline function log( msg : String ) {
//		trace(msg);
	}
}
