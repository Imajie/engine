
#include <time.h>

#include "world_loader.h"
#include "world.h"
#include "shapes.h"

#define WIDTH 1024
#define HEIGHT 768
int main( int argc, char **argv )
{
	/* initialize world */
	World::init();

	World *world = new World(WIDTH, HEIGHT, "bullet test");

	// setup shaders
	world->getGraphics()->setupShaders("vshader.glsl", "fshader.glsl");

	// add gravity
	world->getPhysics()->getWorld()->setGravity( btVector3(0, -9.8, 0) );

	// setup camera
	world->getGraphics()->perspective( 70.0*M_PI/180.0, ((double)WIDTH)/HEIGHT, 0.1, 200.0 );

	// add a player				position			height	width	speed	turnSpeed	maxStepSize
	Player *player = new Player( btVector3(2, 2, 0), 2.0, 	0.5,	2.0,	0.1,		0.1 );
	world->setPlayer( player );


	// create some objects						mass	color						rotation					position
	makeSphere(world, 1.0,				50, 50,	1.0,	btVector3(1.0, 0.0, 0.0), 	btQuaternion(0, 0, 0, 1),	btVector3(0, 50, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(0.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(0, 0, 0));

	// stairs
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(7, -0.75, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(8, -0.5, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(9, -0.25, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(0.0, 1.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(10, 0, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(11, 0.25, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(12, 0.5, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(13, 0.75, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(14, 1, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(15, 1.25, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(16, 1.5, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(17, 1.75, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(0.0, 1.0, 0.0), 	btQuaternion(0, 0, 0, 1),	btVector3(18, 2, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(19, 2.25, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(20, 2.5, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 0.0, 1.0), 	btQuaternion(0, 0, 0, 1),	btVector3(21, 2.75, 0));
	makeCube(world, btVector3(1,1,1),		1,	0.0,	btVector3(1.0, 1.0, 0.0), 	btQuaternion(0, 0, 0, 1),	btVector3(22, 3, 0));

	makeCube(world, btVector3(400,1,400), 100,	0.0,	btVector3(0.6, 0.6, 0.6), 	btQuaternion(0, 0, 0, 1),	btVector3(0, -1, 0));

	/*
	// add a floor
	btCollisionShape *floorShape = new btStaticPlaneShape( btVector3(0,1,0), 0 );
	btDefaultMotionState *floorMotion = new btDefaultMotionState( btTransform( btQuaternion(0,0,0,1), btVector3(0,-10,0) ) );
	btRigidBody::btRigidBodyConstructionInfo floorCI = btRigidBody::btRigidBodyConstructionInfo(0, floorMotion, floorShape, btVector3(0,0,0));
	btRigidBody *floor = new btRigidBody( floorCI );

	world->getPhysics()->getWorld()->addRigidBody( floor );
	*/

	WorldLoader loader( world );
	loader.load( "test" );

	// run main loop
	world->main_loop();

	// done
	return 0;
}
