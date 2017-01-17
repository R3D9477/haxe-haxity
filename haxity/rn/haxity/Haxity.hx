package rn.haxity;

import rn.haxity.de.*;

class Haxity {
	public static function info (title:String, text:String, noWrap:Bool = false) : Void
		DESwitcher.callDialog(DialogType.info, [title, text, noWrap]);
	
	public static function error (title:String, text:String, noWrap:Bool = false) : Void
		DESwitcher.callDialog(DialogType.error, [title, text, noWrap]);
	
	public static function warning (title:String, text:String, noWrap:Bool = false) : Void
		DESwitcher.callDialog(DialogType.warning, [title, text, noWrap]);
	
	public static function question (title:String, text:String, noWrap:Bool = false, timeout:Int = 0) : Bool
		return DESwitcher.callDialog(DialogType.question, [title, text, noWrap, timeout]);
	
	public static function saveFile (title:String) : String
		return DESwitcher.callDialog(DialogType.saveFile, [title]);
	
	public static function openFile (title:String) : String
		return DESwitcher.callDialog(DialogType.openFile, [title]);
	
	public static function openFiles (title:String, separator:String = null) : Array<String>
		return DESwitcher.callDialog(DialogType.openFiles, [title, separator]);
	
	public static function saveDirectory (title:String) : String
		return DESwitcher.callDialog(DialogType.saveDirectory, [title]);
	
	public static function openDirectory (title:String) : String
		return DESwitcher.callDialog(DialogType.openDirectory, [title]);
	
	public static function openDirectories (title:String, separator:String = null) : Array<String>
		return DESwitcher.callDialog(DialogType.openDirectories, [title, separator]);
}
