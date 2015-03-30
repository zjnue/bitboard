using haxe.Int64;

class Bit64_Int64 {
	
	var num : Int64;
	
	public function new( ?a : Array<Int> ) {
		num = (a != null) ? fromArr(a) : Int64.ofInt(0);
	}
	
	inline function fromArr( arr : Array<Int> ) : Int64 {
		return Int64.ofInt(arr[3]) << 48 | Int64.ofInt(arr[2]) << 32 | Int64.ofInt(arr[1]) << 16 | Int64.ofInt(arr[0]);
//		return Int64.make((arr[3] << 16) + arr[2], (arr[1] << 16) + arr[0]);
	}
	
	public inline function init() {
		num = 0;
	}
	
	public inline function clone() {
		return num.copy();
	}
	
	public inline function isEqual( value : Bit64_Int64 ) : Bool {
		return num == value.num;
	}
	
	public inline function isZero() : Bool {
		return num.isZero();
	}
	
	public inline function get( i : Int ) : Int {
		return (num & Int64.ofInt(1) << i).isZero() ? 0 : 1;
	}

	public inline function set( i : Int ) : Bit64_Int64 {
		num |= Int64.ofInt(1) << i;
		return this;
	}
	
	public inline function clr( i : Int ) : Bit64_Int64 {
		num ^= Int64.ofInt(1) << i;
		return this;
	}
	
	public inline function and( b : Bit64_Int64 ) : Bit64_Int64 {
		num &= b.num;
		return this;
	}
	
	public inline function or( b : Bit64_Int64 ) : Bit64_Int64 {
		num |= b.num;
		return this;
	}
	
	public inline function xor( b : Bit64_Int64 ) : Bit64_Int64 {
		num ^= b.num;
		return this;
	}
	
	public inline function not() : Bit64_Int64 {
		num = ~num;
		return this;
	}
	
	public inline function shl( i : Int ) : Bit64_Int64 {
		num <<= i;
		return this;
	}
	
	public inline function shr( i : Int ) {
		num >>= i;
		return this;
	}
	
	public static inline function ofInt( i : Int ) : Bit64_Int64 {
		var b = new Bit64_Int64();
		b.num = Int64.ofInt(i);
		return b;
	}
	
	public function toString() : String {
		#if (haxe_ver >= 3.2)
		return num.high + "++" + num.low;
		#else
		return num.getHigh() + "++" + num.getLow();
		#end
	}
	
	public function toBoard() : String {
		var str = "";
		var line = "";
		#if (haxe_ver >= 3.2)
		var int = num.high;
		#else
		var int = num.getHigh();
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
			int = num.low;
			#else
			int = num.getLow();
			#end
		}
		str += line + "\n";
		return str;
	}
	
	public inline function toNonMonoSpaceFontBoard() : String {
		return toBoard().split("1").join(" 1");
	}
}