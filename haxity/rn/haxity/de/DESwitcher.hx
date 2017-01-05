package rn.haxity.de;

import rn.haxity.*;
import rn.haxity.builders.*;

import haxe.io.Path;
import rn.typext.hlp.SysHelper;

using StringTools;

class DESwitcher {
	public static var currentDesktop:DEType = null;
	
	public static function detectDE () : Void {
		switch (Sys.systemName().toLowerCase()) {
			case "linux":
				var session:String = Sys.getEnv("DESKTOP_SESSION");
				
				if (!(session > ""))
					session = Sys.getEnv("GDMSESSION");
				
				switch (session.toLowerCase()) {
					case "ubuntu", "mate", "gnome", "cinnamon", "lxde", "xfce":
						Zenity.zenityPath = "/usr/bin/zenity";
						DESwitcher.currentDesktop = DEType.Zenity;
					case "kde":
						DESwitcher.currentDesktop = DEType.Kdialog;
					case "":
						DESwitcher.currentDesktop = DEType.Dialog;
					default:
						DESwitcher.currentDesktop = DEType.Unknown;
				}
			case "windows":
				DESwitcher.currentDesktop = DEType.HaxeSystools;
			default:
				DESwitcher.currentDesktop = DEType.Unknown;
		}
	}
	
	public static function callDialog (dt:DialogType, args:Array<Dynamic>) : Dynamic {
		if (DESwitcher.currentDesktop == null)
			DESwitcher.detectDE();
		
		var bldCls:Class<Dynamic> = Type.resolveClass('rn.haxity.builders.${Std.string(DESwitcher.currentDesktop)}');
		
		return Reflect.callMethod(bldCls, Reflect.field(bldCls, Std.string(dt)), args);
	}
}
