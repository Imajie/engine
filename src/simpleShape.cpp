/**
 * File:	simpleShape.cpp
 *
 * Interface for creating simple shapes
 */

#include "object_gl.h"

#include <vector>
#include <iostream>

using namespace std;

/**
 * common variables...should probably make this a class and make these
 * data members
 */
vector<vertex_t> points;
vertex_t *pointArray = NULL;
GLuint *elemArray  = NULL;


/**
 * clear the current shape
 */
void clearShape ()
{
    if (pointArray) {
        delete [] pointArray;
        delete [] elemArray;
        pointArray = NULL;
        elemArray  = NULL;
    }
    points.clear();
}


/**
 * adds a triangle to the current shape
 */
void addTriangle (float x0, float y0, float z0,
                  float x1, float y1, float z1,
                  float x2, float y2, float z2,
                  float u0, float v0,
                  float u1, float v1,
                  float u2, float v2 )
{
    // compute the norm for each vertex
    float ux, uy, uz;
    float vx, vy, vz;

    // U = P2-P1
    ux = x1-x0;
    uy = y1-y0;
    uz = z1-z0;

    // V = P3-P1
    vx = x2-x0;
    vy = y2-y0;
    vz = z2-z0;

    float nx = (uy*vz-uz*vy);
    float ny = (uz*vx-ux*vz);
    float nz = (ux*vy-uy*vx);

	vertex_t vertex;

	// normal doesn't change
	vertex.nx = nx;
	vertex.ny = ny;
	vertex.nz = nz;

	// first vertex
	vertex.x = x0;
	vertex.y = y0;
	vertex.z = z0;
	vertex.u = u0;
	vertex.v = v0;

	points.push_back(vertex);
	
	// second vertex
	vertex.x = x1;
	vertex.y = y1;
	vertex.z = z1;
	vertex.u = u1;
	vertex.v = v1;

	points.push_back(vertex);

	// last vertex
	vertex.x = x2;
	vertex.y = y2;
	vertex.z = z2;
	vertex.u = u2;
	vertex.v = v2;

	points.push_back(vertex);
}


/**
 * gets the vertex points for the current shape
 */
vertex_t *getVertices ()
{
    // delete the old point array of we have one
    if (pointArray) {
        delete [] pointArray;
    }
    
    // create and fill a new point array
    pointArray = new vertex_t[points.size()];
    for (int i=0; i < points.size(); i++) {
        pointArray[i] = points[i];
    }
        
    return pointArray;
}

/**
 * gets the  array of elements for the  current shape
 */
GLuint *getElements ()
{
    // delete the old point array of we have one
    if (elemArray) {
        delete [] elemArray;
    }
    
    // create and fill a new point array
    elemArray = new GLuint[points.size()];
    for (int i=0; i < points.size(); i++) {
        elemArray[i] = i;
    }
    
    return elemArray;
}



/**
 * returns number of verticies in current shape
 */
size_t nVertices ()
{
    return points.size();
}
