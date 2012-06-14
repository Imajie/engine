/*
 * File:	object.cpp
 *
 * An object in the game
 */
#include "object_gl.h"
#include "object.h"

#include <btBulletDynamicsCommon.h>
#include "world.h"

#define ELEM_IDX	0
#define VERT_IDX	1

// load object from file
Object::Object(World *world, const char *filename, btVector3 color)
	:
		world(world)
{
	fprintf(stderr, "NOT IMPLEMENTED");
	exit(1);
}

// create object with specified data
Object::Object(World *world, vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btRigidBody *body, btVector3 color)
	:
		world(world)
{
	createObject(v_data, v_size, e_data, e_size, body, color);
}

// cleanup memory
Object::~Object()
{
	glDeleteBuffers( 2, gl_buf );

	delete edges;
	delete vertex_data;

	world->getPhysics()->removeObject(bullet);
}

// create the actual object
void Object::createObject(vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btRigidBody *body, btVector3 c)
{
	vertex_data = v_data;
	vertex_count = v_size;
	edges = e_data;
	edge_count = e_size;
	bullet = body;
	color = c;

	// generate and bind OpenGL buffers
	glGenBuffers( 2, gl_buf );

	glBindBuffer( GL_ELEMENT_ARRAY_BUFFER, gl_buf[ELEM_IDX] );
	glBindBuffer( GL_ARRAY_BUFFER, gl_buf[VERT_IDX] );

	glBufferData( GL_ELEMENT_ARRAY_BUFFER, e_size*sizeof(GLuint), e_data, GL_STATIC_DRAW );
	glBufferData( GL_ARRAY_BUFFER, v_size*sizeof(vertex_t), v_data, GL_STATIC_DRAW );
}

// draw this object in the scene
void Object::draw( void )
{
	// active this object
	glBindBuffer( GL_ELEMENT_ARRAY_BUFFER, gl_buf[ELEM_IDX] );
	glBindBuffer( GL_ARRAY_BUFFER, gl_buf[VERT_IDX] );

	// get the current state of the object
	btTransform trans;
	bullet->getMotionState()->getWorldTransform(trans);

	// pass the transform to the shader
	world->getGraphics()->setModelView( trans );

	// set lighting
	float ambient_diffuse[3];
	float spec[3];

	ambient_diffuse[0] = color.getX();
	ambient_diffuse[1] = color.getY();
	ambient_diffuse[2] = color.getZ();

	spec[0] = spec[1] = spec[2] = 1.0;

	world->getGraphics()->setLightingParams( ambient_diffuse, ambient_diffuse, spec, 10 );
	
	// draw the element
	world->getGraphics()->setAttribPointers();
	glDrawElements( GL_TRIANGLES, vertex_count, GL_UNSIGNED_INT, BUFFER_OFFSET(0) );
}
