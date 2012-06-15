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
#include "player.h"

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
		 * Set Player
		 */
		void setPlayer( Player *player );

		/*
		 * run main loop
		 */
		void main_loop(void);

	private:
		GLGraphics		*graphics;
		BulletPhysics	*physics;
		Player			*player;

		// objects in the scene
		std::vector<Object*> objects;

		// player movement
		int forward, backward, left, right, dx, dy, jump;

		// callbacks
		void gameloop(double elapsed);
		void keyboard(SDLKey key, int state, int x, int y);
		void mouse_press(int button, int state, int x, int y);
		void mouse_moved(int dx, int dy, int x, int y);
};

#endif
