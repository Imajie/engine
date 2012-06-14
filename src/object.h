/*
 * File:	object.h
 *
 * An object in the game
 */
#ifndef OBJECT_H
#define OBJECT_H

// forward declare world
class World;

#include <btBulletDynamicsCommon.h>
#include "object_gl.h"

class Object
{
	public:
		// load object from file
		Object(World *world, const char *filename, btVector3 color);

		// create object with specified data
		Object(World *world, vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btRigidBody *body, btVector3 color);

		// cleanup memory
		~Object();

		// draw this object in the scene
		void draw(void);

	private:
		// create the actual object
		void createObject(vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btRigidBody *body, btVector3 color);

		// The world we are in
		World *world;

		// The bullet instance of this object
		btRigidBody *bullet;

		// The OpenGL buffers
		GLuint gl_buf[2];

		// vertex data for this object
		vertex_t *vertex_data;
		size_t vertex_count;

		// vertex connectedness data
		GLuint *edges;
		size_t edge_count;

		// object color
		btVector3 color;
};

#endif
