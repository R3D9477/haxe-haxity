package rn.haxity.builders;

class Unknown {
	public static function info (title:String, text:String, noWrap:Bool) : Void {}
	
	public static function error (title:String, text:String, noWrap:Bool) : Void {}
	
	public static function warning (title:String, text:String, noWrap:Bool) : Void {}
	
	public static function question (title:String, text:String, noWrap:Bool, timeout:Int) : Bool return false;
	
	public static function saveFile (title:String) : String return null;
	
	public static function openFile (title:String) : String return null;
	
	public static function openFiles (title:String, separator:String) : Array<String> return null;
	
	public static function saveDirectory (title:String) : String return null;
		
	public static function openDirectory (title:String) : String return null;
	
	public static function openDirectories (title:String, separator:String) : Array<String> return null;
}
