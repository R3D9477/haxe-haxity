package rn.haxity.builders;

import systools.Dialogs;

using StringTools;

class HaxeSystools {
	public static function info (title:String, text:String, noWrap:Bool) : Void
		Dialogs.message("neko-systools", text, false);
	
	public static function error (title:String, text:String, noWrap:Bool) : Void
		Dialogs.message("neko-systools", text, true);
	
	public static function warning (title:String, text:String, noWrap:Bool) : Void
		Dialogs.message("neko-systools", text, true);
	
	public static function question (title:String, text:String, noWrap:Bool, timeout:Int) : Bool
		return false;
	
	public static function saveFile (title:String) : String
		return Dialogs.saveFile(title, "", Sys.getCwd(), null);
	
	public static function openFile (title:String) : String {
		var res:Array<String> = HaxeSystools.openFiles(title, null);
		return res == null ? null : res[0];
	}
	
	public static function openFiles (title:String, separator:String) : Array<String>
		return Dialogs.openFile(title, "", null);
	
	public static function saveDirectory (title:String) : String
		return null;
		
	public static function openDirectory (title:String) : String
		return Dialogs.folder(title, "");
	
	public static function openDirectories (title:String, separator:String) : Array<String>
		return null;
}
