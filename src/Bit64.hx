
class Bit64 {
	
	inline static var SIZE : Int = 64;
	inline static var PART_SIZE : Int = 16;
	inline static var PARTS : Int = 4;
	
	public var _arr(default,null) : Array<Int>;
	
	public function new( ?a : Array<Int> ) {
		_arr = (a != null) ? a : [0,0,0,0];
	}
	
	public function init() {
		_arr = [0,0,0,0];
	}
	
	public function clone() {
		var b = new Bit64();
		for( i in 0...PARTS )
			b._arr[i] = _arr[i];
		return b;
	}
	
	public function isEqual( b : Bit64 ) : Bool {
		for( i in 0...PARTS )
			if( _arr[i] != b._arr[i] )
				return false;
		return true;
	}
	
	public function isZero() : Bool {
		for( i in 0...PARTS )
			if( _arr[i] != 0 )
				return false;
		return true;
	}
	
	public function get( i : Int ) : Int {
		var partIndex = Math.floor( i / PART_SIZE );
		i %= PART_SIZE;
		return 1 & (_arr[partIndex] >> i);
	}
	
	public function set( i : Int ) : Bit64 {
		var partIndex = Math.floor( i / PART_SIZE );
		i %= PART_SIZE;
		_arr[partIndex] |= Math.floor( Math.pow(2, i) );
		return this;
	}
	
	public function clr( i : Int ) : Bit64 {
		var partIndex = Math.floor( i / PART_SIZE );
		i %= PART_SIZE;
		_arr[partIndex] &= Math.floor( Math.pow(2, PART_SIZE) - 1 - Math.pow(2, i) );
		return this;
	}
	
	public function and( b : Bit64 ) : Bit64 {
		for( i in 0...PARTS )
			_arr[i] &= b._arr[i];
		return this;
	}
	
	public function or( b : Bit64 ) : Bit64 {
		for( i in 0...PARTS )
			_arr[i] |= b._arr[i];
		return this;
	}
	
	public function xor( b : Bit64 ) : Bit64 {
		for( i in 0...PARTS )
			_arr[i] ^= b._arr[i];
		return this;
	}
	
	public function not() : Bit64 {
		for ( i in 0...PARTS )
			_arr[i] = ~_arr[i];
		return this;
	}
	
	public function shl( i : Int ) : Bit64 {
		if( i >= SIZE )
			init();
		else {
			var numJumps = Math.floor( i / PART_SIZE );
			while ( numJumps > 0 ) {
				shiftPartLeft();
				numJumps--;
			}
			var rest = i % PART_SIZE;
			shiftSmallLeft(rest);
		}
		return this;
	}
	
	function shiftPartLeft() {
		var i = PARTS;
		while ( --i > 0 ) {
			_arr[i] = _arr[i-1];
		}
		_arr[0] = 0;
	}
	
	function shiftSmallLeft( i : Int ) {
		var j = PARTS;
		while ( --j >= 0 ) {
			_arr[j] = _arr[j] << i;
			if( j > 0 ) _arr[j] |= (_arr[j-1] >> (PART_SIZE - i));
		}
	}
	
	public function shr( i :Int ) {
		if( i >= 64 )
			init();
		else {
			var numJumps = Math.floor( i / PART_SIZE );
			for( i in 0...numJumps ) {
				shiftPartRight();
			}
			var rest = i % PART_SIZE;
			shiftSmallRight(rest);
		}
		return this;
	}
	
	function shiftPartRight() {
		for( i in 0...PARTS-1 )
			_arr[i] = _arr[i+1];
		_arr[PARTS-1] = 0;
	}
	
	function shiftSmallRight( i : Int ) {
		for( j in 0...PARTS ) {
			_arr[j] >>= i;
			if( j < PARTS-1 )
				_arr[j] |= (_arr[j+1] << (PART_SIZE - i));
		}
	}
	
	public static function ofInt( i : Int ) : Bit64 {
		var b = new Bit64();
		for ( j in 0...PARTS ) {
			var tmp = i;
			i >>>= PART_SIZE;
			b._arr[j] = tmp - i;
		}
		return b;
	}
	
	public function toString() :String {
		var str = "";
		for( i in 0...PARTS ) {
			if( i > 0 ) str += "++";
			str += Std.string( _arr[i] );
		}
		return str;
	}
	
	public function toBoard() :String {
		var outStr = "";
		var str = "";
		var count :Int = 1;
		for( i in 0...PARTS ) {
			var sectionStr = "";
			var j = PART_SIZE-1;
			while( j >= 0) {
				var pow = Math.floor( Math.pow(2,j) );
				var bit = if( (pow & _arr[i]) > 0 ) "1" else "0";
				str = " " + bit + str;
				if( (count%8) == 0 ) {
					str += "\n";
					sectionStr += str;
					str = "";
				}
				count++;
				j--;
			}
			outStr = sectionStr + outStr;
		}
		return "\n" +outStr;
	}
	
	public function toNonMonoSpaceFontBoard() :String {
		return toBoard().split("1").join(" 1");
	}
}