package wipeout;
import wipeout.res.*;
import hxd.res.*;

class WipeoutLoader extends hxd.res.Loader {

	public function loadTimImage( path : String ) : TimImage {
		var i : TimImage = cache.get(path);
		if( i == null ) {
			i = new TimImage(fs.get(path));
			cache.set(path, i);
		}
		return i;
	}

	public function loadCmpImages( pathImages : String ) : CmpImages {
		var i : CmpImages = cache.get(pathImages);
		if( i == null ) {
			i = new CmpImages(fs.get(pathImages));
			cache.set(pathImages, i);
		}
		return i;
	}

	public function loadObjects( pathObjects : String ) : Objects {
		var i : Objects = cache.get(pathObjects);
		if( i == null ) {
			i = new Objects(fs.get(pathObjects));
			cache.set(pathObjects, i);
		}
		return i;
	}
}
