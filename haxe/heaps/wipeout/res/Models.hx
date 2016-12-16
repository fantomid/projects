package wipeout.res;
import hxd.res.*;

class Models extends hxd.res.Resource {
    var modelArray : Array<Model>;
    var images : CmpImages;
    var objects : Objects;
    var entryImages(default,null) : hxd.fs.FileEntry;

	public function new(entryObjects, entryImages) {
		super(entryObjects);
        this.entryImages = entryImages;
	}

    public function toModel(index : Int) : Model {
		if( modelArray != null && modelArray[index] != null )
			return modelArray[index];
        if( objects != null )
        {
            return ObjectToModel(index);
        }
        objects = new Objects(entry);
        images = new CmpImages(entryImages);
        return ObjectToModel(index);
    }

    private function ObjectToModel(index : Int) : Model {
        var object = objects.toObject(index);
        modelArray[index] = object;
        return modelArray[index];
    }
}