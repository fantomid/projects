package wipeout.res;
import format.psx.prm.*;
import hxd.res.*;

class Objects extends hxd.res.Resource {
    var prm : format.psx.prm.Data.PRM;

    public function toObject(index : Int) : format.psx.prm.Data.Object  {
        if( prm != null )
        {
            return PrmToObject(index);
        }

        var bytes = entry.getBytes();
		prm = new format.psx.prm.Reader(new haxe.io.BytesInput(bytes)).read();
        return PrmToObject(index);
    }

    private function PrmToObject(index : Int) : format.psx.prm.Data.Object  {
        if( prm.objectsNum > index )
        {
            return prm.objects[index];
        }

        throw "Index " + index + " is out of range";
    }
}
