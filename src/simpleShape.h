/**
 * File:	simpleShape.h
 *
 * Interface for creating shapes
 */

#ifndef __addTriangles__
#define __addTriangles__

#include "object_gl.h"

void clearShape ();
 
void addTriangle (float x0, float y0, float z0,
                  float x1, float y1, float z1,
                  float x2, float y2, float z2,
                  float u0, float v0,
                  float u1, float v1,
                  float u2, float v2);

GLuint *getElements ();
vertex_t *getVertices ();

size_t nVertices ();

#endif
