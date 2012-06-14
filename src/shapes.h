/**
 * File:	shapes.h
 *
 * Header for creating simple shapes
 */

#ifndef __shapes__
#define __shapes__

void makeCube		(World *world, 					int subdivisions, 							double mass, btVector3 color, btQuaternion orientation, btVector3 location);
void makeCylinder	(World *world, float radius,	int radialDivisions, int heightDivisions,	double mass, btVector3 color, btQuaternion orientation, btVector3 location);
void makeCone		(World *world, float radius,	int radialDivisions, int heightDivisions,	double mass, btVector3 color, btQuaternion orientation, btVector3 location);
void makeSphere 	(World *world, float radius,	int slices, int stacks,						double mass, btVector3 color, btQuaternion orientation, btVector3 location);

#endif
