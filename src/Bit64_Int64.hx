using haxe.Int64;

class Bit64_Int64 {
	
	var num : Int64;
	
	public function new( ?a : Array<Int> ) {
		num = (a != null) ? fromArr(a) : Int64.ofInt(0);
	}
	
	inline function fromArr( arr : Array<Int> ) : Int64 {
		return Int64.make((arr[3] << 16) + arr[2], (arr[1] << 16) + arr[0]);
	}
	
	public function init() {
		num = Int64.ofInt(0);
	}
	
	public function clone() {
		var b = new Bit64_Int64();
		#if (haxe_ver >= 3.2)
		b.num = Int64.make(num.high, num.low);
		#else
		b.num = Int64.make(num.getHigh(), num.getLow());
		#end
		return b;
	}
	
	public function isEqual( value : Bit64_Int64 ) : Bool {
		return Int64.ucompare( num, value.num ) == 0;
	}
	
	public function isZero() : Bool {
		return num.isZero();
	}
	
	public function get( i : Int ) : Int {
		var int = 0;
		if( i >= 32 ) {
			i -= 32;
			#if (haxe_ver >= 3.2)
			int = num.high;
			#else
			int = num.getHigh();
			#end
		} else {
			#if (haxe_ver >= 3.2)
			int = num.low;
			#else
			int = num.getLow();
			#end
		}
		return 1 & (int >> i);
	}

	public function set( i : Int ) : Bit64_Int64 {
		if( i > 31 ) {
			i -= 32;
			#if (haxe_ver >= 3.2)
			num = Int64.make(num.high | (1 << i), num.low);
			#else
			num = Int64.make(num.getHigh() | (1 << i), num.getLow());
			#end
		} else {
			#if (haxe_ver >= 3.2)
			num = Int64.make(num.high, num.low | (1 << i));
			#else
			num = Int64.make(num.getHigh(), num.getLow() | (1 << i));
			#end
		}
		return this;
	}
	
	public function clr( i : Int ) : Bit64_Int64 {
		if( i > 31 ) {
			i -= 32;
			#if (haxe_ver >= 3.2)
			num = Int64.make(num.high ^ (1 << i), num.low);
			#else
			num = Int64.make(num.getHigh() ^ (1 << i), num.getLow());
			#end
		} else {
			#if (haxe_ver >= 3.2)
			num = Int64.make(num.high, num.low ^ (1 << i));
			#else
			num = Int64.make(num.getHigh(), num.getLow() ^ (1 << i));
			#end
		}
		return this;
	}
	
	public function and( b : Bit64_Int64 ) : Bit64_Int64 {
		num = Int64.and(num, b.num);
		return this;
	}
	
	public function or( b : Bit64_Int64 ) : Bit64_Int64 {
		num = Int64.or(num, b.num);
		return this;
	}
	
	public function xor( b : Bit64_Int64 ) : Bit64_Int64 {
		num = Int64.xor(num, b.num);
		return this;
	}
	
	public function not() : Bit64_Int64 {
		#if (haxe_ver >= 3.2)
		num = Int64.make(~num.high, ~num.low);
		#else
		num = Int64.make(~num.getHigh(), ~num.getLow());
		#end
		return this;
	}
	
	public function shl( i : Int ) : Bit64_Int64 {
		num = num.shl(i);
		return this;
	}
	
	public function shr( i :Int ) {
		num = num.shr(i);
		return this;
	}
	
	public static function ofInt( i : Int ) : Bit64_Int64 {
		var b = new Bit64_Int64();
		b.num = Int64.ofInt(i);
		return b;
	}
	
	public function toString() :String {
		#if (haxe_ver >= 3.2)
		return num.high + "++" + num.low;
		#else
		return num.getHigh() + "++" + num.getLow();
		#end
	}
	
	public function toBoard() :String {
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
	
	public function toNonMonoSpaceFontBoard() :String {
		return toBoard().split("1").join(" 1");
	}
}