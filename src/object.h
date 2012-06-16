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
#include <aiScene.h>

class Object
{
	public:
		// load object from file
		Object(World *world, const aiScene *scene, const aiNode *node, btCollisionObject *body);

		// create object with specified data
		Object(World *world, vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btCollisionObject *body, btVector3 color);

		// cleanup memory
		~Object();

		// draw this object in the scene
		void draw(void);

	private:
		// load in an aiNode
		void processNode( const aiScene *scene, const aiNode *node, std::vector<vertex_t> &v_data, std::vector<GLuint> &e_data );

		// create the actual object
		void createObject(vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btCollisionObject *body, aiColor3D color); //aiMaterial *material);

		// The world we are in
		World *world;

		// The bullet instance of this object
		btCollisionObject *bullet;

		// The OpenGL buffers
		GLuint gl_buf[2];

		// vertex data for this object
		vertex_t *vertex_data;
		size_t vertex_count;

		// vertex connectedness data
		GLuint *edges;
		size_t edge_count;

		// material - TODO
		//aiMaterial *material;
		aiColor3D color;
};

#endif
