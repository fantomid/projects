package wipeout.res;
import format.psx.cmp.*;
import hxd.res.*;

class CmpImages extends hxd.res.Resource {
    var texArray : Array<h3d.mat.Texture>;
    var cmp : format.psx.cmp.Data.CMP;
	public function toTexture(index : Int) : h3d.mat.Texture {
		if( texArray != null && texArray[index] != null )
			return texArray[index];
        if( cmp != null )
        {
            return TimToTexture(index);
        }
        var bytes = entry.getBytes();
		cmp = new format.psx.cmp.Reader(new haxe.io.BytesInput(bytes)).read();
        return TimToTexture(index);
	}

    private function TimToTexture(index : Int) : h3d.mat.Texture {
        if( cmp.timsNum > index )
        {
            var tex = TimImage.TimtoTexture(cmp.tims[index]);
            if(texArray == null)
                texArray = new Array();
            tex.setName(entry.path + "(" + index + ")");
            texArray[index] = tex;
            return tex;
        }

        throw "Index " + index + " is out of range";
    }

}
