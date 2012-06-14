/*
 * File:	object_gl.h
 *
 * Specific funcionality for OpenGL interface
 */
#ifndef OBJECT_GL_H
#define OBJECT_GL_H

#include <GL/glew.h>
#include <GL/gl.h>
#include <GL/glu.h>

#define BUFFER_OFFSET(x)	((char*)NULL+(x))

extern "C" {
	typedef struct {
		float x, y, z;
		float nx, ny, nz;
		float u, v;
	} vertex_t;
}

#endif
