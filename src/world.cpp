/*
 * File:	world.h
 *
 * Combines OpenGL and Bullet into a single unified world
 */
#include "gl_graphics.h"
#include "bullet_physics.h"
#include "world.h"
#include <boost/bind.hpp>
#include <time.h>

/*
 * initialize
 */
void World::init()
{
	GLGraphics::init();
}

World::World(unsigned int w, unsigned int h, const char *title)
{
	graphics = new GLGraphics(w, h, title);

	physics = new BulletPhysics();

	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(-20, 20, -20, 20, -20, 20);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}

/*
 * Cleanup world
 */
World::~World()
{
	for( size_t i = 0; i < objects.size(); i++ )
	{
		delete objects[i];
	}
}

/*
 * Get graphics
 */
GLGraphics* World::getGraphics()
{
	return graphics;
}

/*
 * Get physics
 */
BulletPhysics* World::getPhysics()
{
	return physics;
}

void World::addObject(Object *object)
{
	objects.push_back(object);
}

void World::removeObject(Object *object)
{
	objects.erase( std::remove(objects.begin(), objects.end(), object), objects.end() );
}

/* gameloop callback */
void World::gameloop(double elapsed)
{
	//printf("world: enter gameloop, elapsed(%f)\n", elapsed);
	physics->tick(elapsed);

	// draw each object
	for( size_t i = 0; i < objects.size(); i++ )
	{
		objects[i]->draw();
	}
}

/*
 * run main loop
 */
void World::main_loop(void)
{
	graphics->main_loop( boost::bind(&World::gameloop, this, _1), 1000.0/60.0 );
}

