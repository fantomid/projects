package wipeout;
import hxd.*;

class WipeoutRes extends hxd.Res {

	public static macro function initPak() {
		var dir = haxe.macro.Context.definedValue("resourcesPath");
		if( dir == null ) dir = "wipeout";
		return macro {
			var dir = $v{dir};
			var pak = new hxd.fmt.pak.FileSystem();
			pak.loadPak(dir + ".pak");
			var i = 1;
			while( true ) {
				if( !hxd.File.exists(dir + i + ".pak") ) break;
				pak.loadPak(dir + i + ".pak");
				i++;
			}
			hxd.Res.loader = new wipeout.WipeoutLoader(pak);
		}
	}

}
