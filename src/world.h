/*
 * File:	world.h
 *
 * Combines OpenGL and Bullet into a single unified world
 */
#ifndef WORLD_H
#define WORLD_H

#include "gl_graphics.h"
#include "bullet_physics.h"
#include "object.h"

class World
{
	public:
		/*
		 * initialize
		 */
		static void init();

		/*
		 * Create a world
		 */
		World(unsigned int w, unsigned int h, const char *title);

		/*
		 * Cleanup world
		 */
		~World();

		/*
		 * Get graphics
		 */
		GLGraphics* getGraphics();

		/*
		 * Get physics
		 */
		BulletPhysics* getPhysics();

		/*
		 * Add Object
		 */
		void addObject( Object *object );

		/*
		 * Remove Object
		 */
		void removeObject( Object *object );

		/*
		 * run main loop
		 */
		void main_loop(void);

	private:
		GLGraphics    *graphics;
		BulletPhysics *physics;

		// objects in the scene
		std::vector<Object*> objects;

		// callbacks
		void gameloop(double elapsed);
};

#endif
