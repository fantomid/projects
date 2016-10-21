package wipeout.res;
import hxd.res.*;

class WipeoutAny extends hxd.res.Any {
    public var sndEntry(default,null) : hxd.fs.FileEntry;
    public var multipleEntry(default,null) : Bool;

	public function new(loader, entry, ?sndEntry) {
		super(loader, entry);
        this.sndEntry = sndEntry;
    }

	public override function toTexture() {
		return cast(loader, wipeout.WipeoutLoader).loadTimImage(entry.path).toTexture();
	}    
}
