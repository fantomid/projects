import format.psx.*;
import format.psx.tim.*;
import format.psx.cmp.*;
import h3d.scene.*;

class WipeoutShips extends hxd.App {

	var time : Float = 0.;
	var obj1 : Mesh;
	var obj2 : Mesh;

	override function init() {

		// creates a new unit cube
		var prim = new h3d.prim.Cube();

		// translate it so its center will be at the center of the cube
		prim.translate( -0.5, -0.5, -0.5);

		// unindex the faces to create hard edges normals
		prim.unindex();

		// add face normals
		prim.addNormals();

		// add texture coordinates
		prim.addUVs();

		// accesss the title image and convert it to a texture
		var wloader : wipeout.WipeoutLoader = cast(hxd.Res.loader, wipeout.WipeoutLoader);
		var image = wloader.loadTimImage("WIPEOUT/TEXTURES/WIPTITLE.TIM");
		var tex = image.toTexture();

		var objects = wloader.loadObjects("WIPEOUT/COMMON/ALLSH.PRM");
		var cmpImages = wloader.loadCmpImages("WIPEOUT/COMMON/ALLSH.CMP");
		var tex01 = cmpImages.toTexture(1);

		// create a material with this texture
		var mat = new h3d.mat.MeshMaterial(tex);

		// create a material with the second texture
		var mat02 = new h3d.mat.MeshMaterial(tex01);

		// our first cube mesh on the 3D scene with our created material
		obj1 = new Mesh(prim, mat, s3d);

		// creates another cube
		obj2 = new Mesh(prim, mat02, s3d);

		// set the second cube color
		//obj2.material.color.setColor(0xFFB280);

		// put it above the first cube
		obj2.z = 0.7;

		// scale it down to 60%
		obj2.scale(0.6);

		// adds a directional light to the scene
		var light = new h3d.scene.DirLight(new h3d.Vector(0.5, 0.5, -0.5), s3d);
		light.enableSpecular = true;

		// set the ambient light to 30%
		s3d.lightSystem.ambientLight.set(0.3, 0.3, 0.3);

		// activate lights on boss cubes
		obj1.material.mainPass.enableLights = true;
		obj2.material.mainPass.enableLights = true;
	}

	override function update( dt : Float ) {

		// time is flying...
		time += 0.01 * dt;

		// move the camera position around the two cubes
		var dist = 5;
		s3d.camera.pos.set(Math.cos(time) * dist, Math.sin(time) * dist, dist * 0.7 * Math.sin(time));

		// rotate the second cube along a given axis + angle
		obj2.setRotateAxis(-0.5, 2, Math.cos(time), time + Math.PI / 2);
	}

	static function main() {

		// initialize pak ressources
		wipeout.WipeoutRes.initPak();

		// start the application
		new WipeoutShips();
	}

}
