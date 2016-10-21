package wipeout.res;
import hxd.res.*;
import format.psx.tim.*;

class TimImage extends hxd.res.Image {

    static public function TimtoTexture(tim : format.psx.tim.Data.TIM) : h3d.mat.Texture {
		var width = tim.header.imageWidth, height = tim.header.imageHeight;
		if( !hxd.res.Image.ALLOW_NPOT ) {
			var tw = 1, th = 1;
			while( tw < width ) tw <<= 1;
			while( th < height ) th <<= 1;
			width = tw;
			height = th;
		}

		var tex = new h3d.mat.Texture(width, height, [NoAlloc]);
		if( hxd.res.Image.DEFAULT_FILTER != Linear ) tex.filter = hxd.res.Image.DEFAULT_FILTER;
		
        var pixels = new hxd.Pixels(width, height, format.psx.tim.Tools.extractFullBGRA(tim), BGRA);
        pixels.makeSquare();
        tex.uploadPixels(pixels);
        pixels.dispose();
		return tex;        
    }

	private override function getSizeIsSupported(f : hxd.fs.FileInput, code : Int) : { supported : Bool, width : Int, height : Int, format : hxd.res.Image.ImageFormat } {
        var supported = false;
        var width = -1;
        var height = -1;
        var format : hxd.res.Image.ImageFormat = hxd.res.Image.ImageFormat.Ukn;
		if(code == 0x0010) // TIM
        {
			f.readInt16(); // skip format information
			var type = f.readInt32();
			if(type ==  0x08 || type == 0x09) // Paletted_4_BPP and Paletted_8_BPP
			{
				var clutSize = f.readInt32();
				f.skip(clutSize-4); // skip all the clut information
			}
			f.skip(8); // skip image size, imageOrgX, imageOrgY
			width = f.readUInt16();
			height = f.readUInt16();
			if(type ==  0x08)
				width *= 4;
			if(type == 0x09)
				width *= 2;
            supported = true;
        }
        var notSupported = { supported : supported, width : width, height : height, format : format };
		return notSupported;
	}

	private override function getPixelsIsSupported() : { supported : Bool, pixels : hxd.Pixels } {
        var bytes = entry.getBytes();
		var tim = new format.psx.tim.Reader(new haxe.io.BytesInput(bytes)).read();
		var pixels = new hxd.Pixels(inf.width, inf.height, format.psx.tim.Tools.extractFullBGRA(tim), BGRA);
		var notSupported = { supported : true, pixels : pixels };

		return notSupported;
	}
}
