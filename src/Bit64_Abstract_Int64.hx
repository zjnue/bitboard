using haxe.Int64;

abstract Bit64_Abstract_Int64(Int64) from Int64 to Int64 {
	
	public inline function new( ?a : Array<Int> ) {
		this = (a != null) ? fromArr(a) : 0;
	}
	
	inline function fromArr( arr : Array<Int> ) : Int64 {
		return Int64.ofInt(arr[3]) << 48 | Int64.ofInt(arr[2]) << 32 | Int64.ofInt(arr[1]) << 16 | Int64.ofInt(arr[0]);
//		return Int64.make((arr[3] << 16) + arr[2], (arr[1] << 16) + arr[0]);
	}
	
	public inline function init() {
		this = 0;
	}
	
	public inline function clone() {
		return this.copy();
	}
	
	public inline function isEqual( value : Bit64_Abstract_Int64 ) : Bool {
		return this == value;
	}
	
	public inline function isZero() : Bool {
		return this.isZero();
	}
	
	public inline function get( i : Int ) : Int {
		return (this & Int64.ofInt(1) << i).isZero() ? 0 : 1;
	}

	public inline function set( i : Int ) : Bit64_Abstract_Int64 {
		this |= Int64.ofInt(1) << i;
		return this;
	}
	
	public inline function clr( i : Int ) : Bit64_Abstract_Int64 {
		this ^= Int64.ofInt(1) << i;
		return this;
	}
	
	public inline function and( b : Bit64_Abstract_Int64 ) : Bit64_Abstract_Int64 {
		this &= b;
		return this;
	}
	
	public inline function or( b : Bit64_Abstract_Int64 ) : Bit64_Abstract_Int64 {
		this |= b;
		return this;
	}
	
	public inline function xor( b : Bit64_Abstract_Int64 ) : Bit64_Abstract_Int64 {
		this ^= b;
		return this;
	}
	
	public inline function not() : Bit64_Abstract_Int64 {
		this = ~this;
		return this;
	}
	
	public inline function shl( i : Int ) : Bit64_Abstract_Int64 {
		this <<= i;
		return this;
	}
	
	public inline function shr( i : Int ) {
		this >>= i;
		return this;
	}
	
	public static inline function ofInt( i : Int ) : Bit64_Abstract_Int64 {
		var b = new Bit64_Abstract_Int64();
		b = Int64.ofInt(i);
		return b;
	}
	
	public function toString() : String {
		#if (haxe_ver >= 3.2)
		return this.high + "++" + this.low;
		#else
		return this.getHigh() + "++" + this.getLow();
		#end
	}
	
	public function toBoard() : String {
		var str = "";
		var line = "";
		#if (haxe_ver >= 3.2)
		var int = this.high;
		#else
		var int = this.getHigh();
		#end
		for( i in 0...2 ) {
			var j = 32;
			while( j --> 0 ) {
				if( (j+1) % 8 == 0 ) {
					str += line + "\n";
					line = "";
				}
				var bit = " " + (int & Math.floor(Math.pow(2,j)) != 0 ? "1" : "0");
				line = bit + line;
			}
			#if (haxe_ver >= 3.2)
			int = this.low;
			#else
			int = this.getLow();
			#end
		}
		str += line + "\n";
		return str;
	}
	
	public inline function toNonMonoSpaceFontBoard() : String {
		return toBoard().split("1").join(" 1");
	}
}