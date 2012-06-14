
#include <time.h>

#include "world.h"
#include "shapes.h"

int main( int argc, char **argv )
{
	/* initialize world */
	World::init();

	World *world = new World(512, 512, "bullet test");

	// setup shaders
	world->getGraphics()->setupShaders("vshader.glsl", "fshader.glsl");

	// add gravity
	world->getPhysics()->getWorld()->setGravity( btVector3(0, 0, -10) );

	// setup camera
	world->getGraphics()->lookat(
			btVector3( 0, 10, 0 ),
			btVector3( 0, 0, 0 ), 
			btVector3( 0, 0, 1 ) 
		);

	world->getGraphics()->perspective( M_PI/2.0, 512.0/512.0, 1.0, 200.0 );

	// create some objects
	makeSphere(world, 1.0, 20, 20, 1.0, btVector3(1.0, 0.0, 0.0), btQuaternion(0, 0, 0, 1), btVector3(0, 0, 50));
	makeCube(world, 1, 0, btVector3(0.0, 0.0, 1.0), btQuaternion(0.1, 0, 0, 1), btVector3(0, 0, 0));

	// run main loop
	world->main_loop();

	// done
	return 0;
}
