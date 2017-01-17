package rn.haxity.de;

import haxe.io.Path;
import rn.typext.hlp.SysHelper;

import rn.haxity.DialogType;

using StringTools;

class DESwitcher {
	public static var currDialogBuilder:Class<Dynamic> = null;
	
	public static function detectDE () : Void {
		switch (Sys.systemName().toLowerCase()) {
			case "linux":
				var session:String = Sys.getEnv("DESKTOP_SESSION");
				
				if (!(session > ""))
					session = Sys.getEnv("GDMSESSION");
				
				switch (session.toLowerCase()) {
					case "ubuntu", "mate", "gnome", "cinnamon", "lxde", "xfce":
						rn.haxity.builders.Zenity.zenityPath = "/usr/bin/zenity";
						DESwitcher.currDialogBuilder = rn.haxity.builders.Zenity;
					case "kde":
						//...
						DESwitcher.currDialogBuilder = rn.haxity.builders.Kdialog;
					case "":
						//...
						DESwitcher.currDialogBuilder = rn.haxity.builders.Dialog;
					default:
						DESwitcher.currDialogBuilder = rn.haxity.builders.Unknown;
				}
			case "windows":
				//rn.haxity.builders.Zenity.zenityPath = Path.join([Sys.getEnv(SysHelper.getCpuArch() == 32 ? "programfiles" : "programfiles(x86)").replace("\\", "/"), "Zenity", "bin", "zenity.exe"]);
				//DESwitcher.currDialogBuilder = rn.haxity.builders.Zenity;
				
				DESwitcher.currDialogBuilder = rn.haxity.builders.HaxeSystools;
			default:
				DESwitcher.currDialogBuilder = rn.haxity.builders.Unknown;
		}
	}
	
	public static function callDialog (dt:DialogType, args:Array<Dynamic>) : Dynamic {
		if (DESwitcher.currDialogBuilder == null)
			DESwitcher.detectDE();
		
		return Reflect.callMethod(DESwitcher.currDialogBuilder, Reflect.field(DESwitcher.currDialogBuilder, Std.string(dt)), args);
	}
}
