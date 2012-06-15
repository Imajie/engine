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
	:forward(0), backward(0), left(0), right(0), dx(0), dy(0), jump(0)
{
	graphics = new GLGraphics(w, h, title);

	physics = new BulletPhysics();

	/*
	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(-20, 20, -20, 20, -20, 20);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	*/
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

void World::setPlayer(Player *player)
{
	if( this->player )
	{
		physics->getWorld()->removeCollisionObject( this->player->getController()->getGhostObject() );
		physics->getWorld()->removeAction( this->player->getController() );
	}
	this->player = player;

	physics->getWorld()->addCollisionObject( player->getController()->getGhostObject(), btBroadphaseProxy::CharacterFilter, btBroadphaseProxy::StaticFilter|btBroadphaseProxy::DefaultFilter );
	physics->getWorld()->addAction( player->getController() );

}

void World::addObject(Object *object)
{
	objects.push_back(object);
}

void World::removeObject(Object *object)
{
	objects.erase( std::remove(objects.begin(), objects.end(), object), objects.end() );
}

/* keyboard callback */
void World::keyboard(SDLKey key, int state, int x, int y )
{
	switch( key )
	{
		case SDLK_w:
			forward = state;
			break;
		case SDLK_a:
			left = state;
			break;
		case SDLK_s:
			backward = state;
			break;
		case SDLK_d:
			right = state;
			break;
		case SDLK_SPACE:
			jump = state;
			break;
	}
}

/* mouse press callback */
void World::mouse_press( int button, int state, int x, int y )
{
	
}

/* mouse move callback */
void World::mouse_moved( int dx, int dy, int x, int y )
{
	this->dx += dx;
	this->dy += dy;
}

/* gameloop callback */
void World::gameloop(double elapsed)
{
	//printf("world: enter gameloop, elapsed(%f)\n", elapsed);
	if( player )
	{
		player->update( forward, backward, left, right, dx, dy, jump, elapsed );
		graphics->setViewTransform( this->player->getViewTransform() );
	}
	dx = 0;
	dy = 0;

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
	graphics->setKeyboardCallback( boost::bind(&World::keyboard, this, _1, _2, _3, _4) );
	graphics->setMousePressCallback( boost::bind(&World::mouse_press, this, _1, _2, _3, _4) );
	graphics->setMouseMovedCallback( boost::bind(&World::mouse_moved, this, _1, _2, _3, _4) );
	graphics->main_loop( boost::bind(&World::gameloop, this, _1), 900.0/60.0 );
}

