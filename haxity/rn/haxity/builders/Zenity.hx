package rn.haxity.builders;

import sys.io.Process;

using StringTools;

class Zenity {
	public static var zenityPath:String = "zenity";
	
	public static function info (title:String, text:String, noWrap:Bool) : Void
		new Process(Zenity.zenityPath, [
			"--info",
			'--title="$title"',
			'--text="$text"',
			noWrap ? "--no-wrap" : ""
		]).stdout.readAll();
	
	public static function error (title:String, text:String, noWrap:Bool) : Void
		new Process(Zenity.zenityPath, [
			"--error",
			'--title="$title"',
			'--text="$text"',
			noWrap ? "--no-wrap" : ""
		]).stdout.readAll();
	
	public static function warning (title:String, text:String, noWrap:Bool) : Void
		new Process(Zenity.zenityPath, [
			"--warning",
			'--title="$title"',
			'--text="$text"',
			noWrap ? "--no-wrap" : ""
		]).stdout.readAll();
	
	public static function question (title:String, text:String, noWrap:Bool, timeout:Int) : Bool {
		var cmd = 'zenity --question --title="$title" --text="$text"';
		
		if (noWrap)
			cmd += " --no-wrap";
		
		if (timeout > 0)
			cmd += ' --timeout=$timeout';
		
		cmd += "; echo $?";
		
		var resarr = (new Process("bash", ["-c", cmd])).stdout.readAll().toString().split("\n");
		var res;
		
		do {
			res = resarr.pop().trim();
		}
		while(resarr.length > 0 && res == "");
		
		return res == "0";
	}
	
	public static function openFiles (title:String, separator:String) : Array<String>
		return new Process(Zenity.zenityPath, [
			"--file-selection",
			"--multiple",
			'--title="$title"',
			separator > "" ? '--separator="$separator"' : ""
		]).stdout.readAll().toString().split(separator > "" ? separator : "|").map(function (f:String) return f.trim());
	
	public static function openFile (title:String) : String
		return new Process(Zenity.zenityPath, [
			"--file-selection",
			'--title="$title"'
		]).stdout.readAll().toString().trim();
	
	public static function saveFile (title:String) : String
		return new Process(Zenity.zenityPath, [
			"--file-selection",
			'--title="$title"',
			"--save"
		]).stdout.readAll().toString();
	
	public static function openDirectories (title:String, separator:String) : Array<String>
		return new Process(Zenity.zenityPath, [
			"--file-selection",
			"--multiple",
			"--directory",
			'--title="$title"',
			separator > "" ? '--separator="$separator"' : ""
		]).stdout.readAll().toString().split(separator > "" ? separator : "|").map(function (f:String) return f.trim());
	
	public static function openDirectory (title:String) : String
		return new Process(Zenity.zenityPath, [
			"--file-selection",
			"--directory",
			'--title="$title"'
		]).stdout.readAll().toString().trim();
	
	public static function saveDirectory (title:String) : String
		return new Process(Zenity.zenityPath, [
			"--file-selection",
			'--title="$title"',
			"--directory",
			"--save"
		]).stdout.readAll().toString();
}
