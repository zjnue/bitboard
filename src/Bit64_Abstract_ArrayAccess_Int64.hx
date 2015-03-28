using haxe.Int64;

abstract Bit64_Abstract_ArrayAccess_Int64(Int64) from Int64 to Int64 {
	
	public inline function new( ?a : Array<Int> ) {
		this = (a != null) ? fromArr(a) : Int64.ofInt(0);
	}
	
	inline function fromArr( arr : Array<Int> ) : Int64 {
		return Int64.make((arr[3] << 16) + arr[2], (arr[1] << 16) + arr[0]);
	}
	
	public inline function init() {
		this = Int64.ofInt(0);
	}
	
	public function clone() {
		var b = new Bit64_Abstract_ArrayAccess_Int64();
		#if (haxe_ver >= 3.2)
		b = Int64.make(this.high, this.low);
		#else
		b = Int64.make(this.getHigh(), this.getLow());
		#end
		return b;
	}
	
	public function isEqual( value : Bit64_Abstract_ArrayAccess_Int64 ) : Bool {
		return Int64.ucompare( this, value ) == 0;
	}
	
	public function isZero() : Bool {
		return this.isZero();
	}
	
	@:arrayAccess
	public function get( i : Int ) : Int {
		var int = 0;
		if( i >= 32 ) {
			i -= 32;
			#if (haxe_ver >= 3.2)
			int = this.high;
			#else
			int = this.getHigh();
			#end
		} else {
			#if (haxe_ver >= 3.2)
			int = this.low;
			#else
			int = this.getLow();
			#end
		}
		return 1 & (int >> i);
	}
	
	@:arrayAccess
	public inline function arrayWrite( index : Int, value : Int ) : Int {
		if( value == 0 ) clr(index);
		else set(index);
		return value;
	}
	
	public inline function set( i : Int ) : Bit64_Abstract_ArrayAccess_Int64 {
		if( i > 31 ) {
			i -= 32;
			#if (haxe_ver >= 3.2)
			this = Int64.make(this.high | (1 << i), this.low);
			#else
			this = Int64.make(this.getHigh() | (1 << i), this.getLow());
			#end
		} else {
			#if (haxe_ver >= 3.2)
			this = Int64.make(this.high, this.low | (1 << i));
			#else
			this = Int64.make(this.getHigh(), this.getLow() | (1 << i));
			#end
		}
		return this;
	}
	
	public inline function clr( i : Int ) : Bit64_Abstract_ArrayAccess_Int64 {
		if( i > 31 ) {
			i -= 32;
			#if (haxe_ver >= 3.2)
			this = Int64.make(this.high ^ (1 << i), this.low);
			#else
			this = Int64.make(this.getHigh() ^ (1 << i), this.getLow());
			#end
		} else {
			#if (haxe_ver >= 3.2)
			this = Int64.make(this.high, this.low ^ (1 << i));
			#else
			this = Int64.make(this.getHigh(), this.getLow() ^ (1 << i));
			#end
		}
		return this;
	}
	
	public inline function and( b : Bit64_Abstract_ArrayAccess_Int64 ) : Bit64_Abstract_ArrayAccess_Int64 {
		this = Int64.and(this, b);
		return this;
	}
	
	public inline function or( b : Bit64_Abstract_ArrayAccess_Int64 ) : Bit64_Abstract_ArrayAccess_Int64 {
		this = Int64.or(this, b);
		return this;
	}
	
	public inline function xor( b : Bit64_Abstract_ArrayAccess_Int64 ) : Bit64_Abstract_ArrayAccess_Int64 {
		this = Int64.xor(this, b);
		return this;
	}
	
	public inline function not() : Bit64_Abstract_ArrayAccess_Int64 {
		#if (haxe_ver >= 3.2)
		this = Int64.make(~this.high, ~this.low);
		#else
		this = Int64.make(~this.getHigh(), ~this.getLow());
		#end
		return this;
	}
	
	public inline function shl( i : Int ) : Bit64_Abstract_ArrayAccess_Int64 {
		this = this.shl(i);
		return this;
	}
	
	public inline function shr( i :Int ) {
		this = this.shr(i);
		return this;
	}
	
	public static function ofInt( i : Int ) : Bit64_Abstract_ArrayAccess_Int64 {
		var b = new Bit64_Abstract_ArrayAccess_Int64();
		b = Int64.ofInt(i);
		return b;
	}
	
	public function toString() :String {
		#if (haxe_ver >= 3.2)
		return this.high + "++" + this.low;
		#else
		return this.getHigh() + "++" + this.getLow();
		#end
	}
	
	public function toBoard() :String {
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
	
	public function toNonMonoSpaceFontBoard() :String {
		return toBoard().split("1").join(" 1");
	}
}