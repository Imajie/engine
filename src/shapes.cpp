/**
 * shapes.cpp
 *
 * Routines for tessellating a number of basic shapes
 */

#include <math.h>

#include "simpleShape.h"
#include "object.h"
#include "world.h"
#include <btBulletDynamicsCommon.h>

/**
 * makeCube - Create a unit cube, centered at the origin, with a given number
 * of subdivisions in each direction on each face.
 *
 * @param subdivision - number of equal subdivisons to be made in each 
 *        direction along each face
 *
 * Can only use calls to addTriangle()
 */
void makeCube (World *world, btVector3 scale, int subdiv, double mass, btVector3 color, btQuaternion orientation, btVector3 location)
{
	clearShape();

	double x = scale.getX() / 2.0;
	double y = scale.getY() / 2.0;
	double z = scale.getZ() / 2.0;

    float subdivisions = subdiv;
    for( int i = 0; i < subdiv; i++ )
    {
        for( int j = 0; j < subdiv; j++ )
        {
            // x-y face upper
            addTriangle(x-(i+1)/subdivisions, y-(j+0)/subdivisions, z, 
						x-(i+0)/subdivisions, y-(j+1)/subdivisions, z,
                        x-(i+0)/subdivisions, y-(j+0)/subdivisions, z,
                        (i+1)/subdivisions, j/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        i/subdivisions,     j/subdivisions );

            addTriangle(x-(i+1)/subdivisions, y-(j+0)/subdivisions, z,
                        x-(i+1)/subdivisions, y-(j+1)/subdivisions, z,
                        x-(i+0)/subdivisions, y-(j+1)/subdivisions, z,
                        (i+1)/subdivisions, j/subdivisions,
                        (i+1)/subdivisions, (j+1)/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions );

            // x-y face  lower
            addTriangle(x-(i+0)/subdivisions, y-(j+0)/subdivisions, -z,
                        x-(i+0)/subdivisions, y-(j+1)/subdivisions, -z,
                        x-(i+1)/subdivisions, y-(j+0)/subdivisions, -z,
                        i/subdivisions,     j/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions );

            addTriangle(x-(i+1)/subdivisions, y-(j+0)/subdivisions, -z,
                        x-(i+0)/subdivisions, y-(j+1)/subdivisions, -z,
                        x-(i+1)/subdivisions, y-(j+1)/subdivisions, -z,
                        (i+1)/subdivisions, j/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        (i+1)/subdivisions, (j+1)/subdivisions );

            // x-z face upper
            addTriangle(x-(i+0)/subdivisions, y, z-(j+0)/subdivisions,
                        x-(i+0)/subdivisions, y, z-(j+1)/subdivisions,
                        x-(i+1)/subdivisions, y, z-(j+0)/subdivisions,
                        i/subdivisions,     j/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions );

            addTriangle(x-(i+0)/subdivisions, y, z-(j+1)/subdivisions,
                        x-(i+1)/subdivisions, y, z-(j+1)/subdivisions,
                        x-(i+1)/subdivisions, y, z-(j+0)/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        (i+1)/subdivisions, (j+1)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions );

            // x-z face lower
            addTriangle(x-(i+1)/subdivisions, -y, z-(j+0)/subdivisions,
                        x-(i+0)/subdivisions, -y, z-(j+1)/subdivisions,
                        x-(i+0)/subdivisions, -y, z-(j+0)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        i/subdivisions,     j/subdivisions );

            addTriangle(x-(i+1)/subdivisions, -y, z-(j+1)/subdivisions,
                        x-(i+0)/subdivisions, -y, z-(j+1)/subdivisions,
                        x-(i+1)/subdivisions, -y, z-(j+0)/subdivisions,
                        (i+1)/subdivisions, (j+1)/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions );

            // y-z face upper
            addTriangle(x, y-(i+1)/subdivisions, z-(j+0)/subdivisions,
                        x, y-(i+0)/subdivisions, z-(j+1)/subdivisions,
                        x, y-(i+0)/subdivisions, z-(j+0)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        i/subdivisions,     j/subdivisions );

            addTriangle(x, y-(i+1)/subdivisions, z-(j+0)/subdivisions,
                        x, y-(i+1)/subdivisions, z-(j+1)/subdivisions,
                        x, y-(i+0)/subdivisions, z-(j+1)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions,
                        (i+1)/subdivisions, (j+1)/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions );

            // y-z face lower
            addTriangle(-x, y-(i+0)/subdivisions, z-(j+0)/subdivisions,
                        -x, y-(i+0)/subdivisions, z-(j+1)/subdivisions,
                        -x, y-(i+1)/subdivisions, z-(j+0)/subdivisions,
                        i/subdivisions,     j/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions );

            addTriangle(-x, y-(i+0)/subdivisions, z-(j+1)/subdivisions,
                        -x, y-(i+1)/subdivisions, z-(j+1)/subdivisions,
                        -x, y-(i+1)/subdivisions, z-(j+0)/subdivisions,
                        i/subdivisions,     (j+1)/subdivisions,
                        (i+1)/subdivisions, (j+1)/subdivisions,
                        (i+1)/subdivisions, j/subdivisions );
            
        }
    }

	btCollisionShape *collide = new btBoxShape(scale.absolute()/2.0);
	btVector3 inertia;

	collide->calculateLocalInertia(mass, inertia);
	btDefaultMotionState *motion = new btDefaultMotionState(btTransform(orientation, location));

	world->addObject(new Object(world, getVertices(), nVertices(), getElements(), nVertices(), world->getPhysics()->addObject(mass, motion, collide, inertia), color ));
}


/**
 * makeCylinder - Create polygons for a cylinder with unit height, centered at
 * the origin, with separate number of radial subdivisions and height 
 * subdivisions.
 *
 * @param radius - Radius of the base of the cylinder
 * @param radialDivision - number of subdivisions on the radial base
 * @param heightDivisions - number of subdivisions along the height
 *
 */
void makeCylinder (World *world, float radius, int radialDivisions, int heightDivisions, double mass, btVector3 color, btQuaternion orientation, btVector3 location)
{
	clearShape();

    double radialDiv = radialDivisions;
    double heightDiv = heightDivisions;

    for( int i = 0; i < radialDivisions; i++)
    {
        double angle      = 2*M_PI*i/radialDiv;
        double anglePlus1 = 2*M_PI*(i+1)/radialDiv;

        // top of cylinder
        addTriangle(radius*cos(anglePlus1), radius*sin(anglePlus1), 0.5,
                    0,                      0,                      0.5,
                    radius*cos(angle),      radius*sin(angle),      0.5,
                    angle/(2*M_PI),                 1,
                    (angle+anglePlus1)/(4*M_PI),    1,
                    anglePlus1/(2*M_PI),            1 );

        // bottom of cylinder
        addTriangle(radius*cos(angle),      radius*sin(angle),      -0.5,
                    0,                      0,                      -0.5,
                    radius*cos(anglePlus1), radius*sin(anglePlus1), -0.5,
                    angle/(2*M_PI),                 0,
                    (angle+anglePlus1)/(4*M_PI),    0,
                    anglePlus1/(2*M_PI),            0 );

        // rectangular part
        for( int j = 0; j < heightDivisions; j++ )
        {
            addTriangle(radius*cos(angle),      radius*sin(angle),      0.5-j/heightDiv,
                        radius*cos(angle),      radius*sin(angle),      0.5-(j+1)/heightDiv,
                        radius*cos(anglePlus1), radius*sin(anglePlus1), 0.5-(j+1)/heightDiv,
                        angle/(2*M_PI),         j/heightDiv,
                        angle/(2*M_PI),         (j+1)/heightDiv,
                        anglePlus1/(2*M_PI),    (j+1)/heightDiv );

            addTriangle(radius*cos(angle),      radius*sin(angle),      0.5-j/heightDiv,
                        radius*cos(anglePlus1), radius*sin(anglePlus1), 0.5-(j+1)/heightDiv,
                        radius*cos(anglePlus1), radius*sin(anglePlus1), 0.5-j/heightDiv,
                        angle/(2*M_PI),         j/heightDiv,
                        anglePlus1/(2*M_PI),    (j+1)/heightDiv,
                        anglePlus1/(2*M_PI),    j/heightDiv );
        }
    }

	btCollisionShape *collide = new btCylinderShapeZ(btVector3(0.5, 0.5, 0.5));
	btVector3 inertia;

	collide->calculateLocalInertia(mass, inertia);
	btDefaultMotionState *motion = new btDefaultMotionState(btTransform(orientation, location));

	world->addObject(new Object(world, getVertices(), nVertices(), getElements(), nVertices(), world->getPhysics()->addObject(mass, motion, collide, inertia), color ));
}


/**
 * makeCone - Create polygons for a cone with unit height, centered at the
 * origin, with separate number of radial subdivisions and height 
 * subdivisions.
 *
 * @param radius - Radius of the base of the cone
 * @param radialDivision - number of subdivisions on the radial base
 * @param heightDivisions - number of subdivisions along the height
 *
 */
void makeCone (World *world, float radius, int radialDivisions, int heightDivisions, double mass, btVector3 color, btQuaternion orientation, btVector3 location)
{
	clearShape();

    double radialDiv = radialDivisions;
    double heightDiv = heightDivisions;

    for( int i = 0; i < radialDivisions; i++ )
    {
        double angle      = 2*M_PI*i/radialDiv;
        double anglePlus1 = 2*M_PI*(i+1)/radialDiv;

        // base of cone
        addTriangle(radius*cos(angle),      radius*sin(angle),      -0.5,
                    0,                      0,                      -0.5,
                    radius*cos(anglePlus1), radius*sin(anglePlus1), -0.5,
                    angle/(2*M_PI),         0,
                    angle/(2*M_PI),         0,
                    anglePlus1/(2*M_PI),    0 );

        // sides of cone
        for( int j = 0; j < heightDivisions; j++ ) 
        {
            addTriangle(radius*j/heightDiv*cos(angle),          radius*j/heightDiv*sin(angle),          0.5-j/heightDiv,
                        radius*(j+1)/heightDiv*cos(angle),      radius*(j+1)/heightDiv*sin(angle),      0.5-(j+1)/heightDiv,
                        radius*(j+1)/heightDiv*cos(anglePlus1), radius*(j+1)/heightDiv*sin(anglePlus1), 0.5-(j+1)/heightDiv,
                        angle/(2*M_PI),         j/heightDiv,
                        angle/(2*M_PI),         (j+1)/heightDiv,
                        anglePlus1/(2*M_PI),    (j+1)/heightDiv );

            addTriangle(radius*j/heightDiv*cos(angle),          radius*j/heightDiv*sin(angle),          0.5-j/heightDiv,
                        radius*(j+1)/heightDiv*cos(anglePlus1), radius*(j+1)/heightDiv*sin(anglePlus1), 0.5-(j+1)/heightDiv,
                        radius*j/heightDiv*cos(anglePlus1),     radius*j/heightDiv*sin(anglePlus1),     0.5-j/heightDiv,
                        angle/(2*M_PI),         j/heightDiv,
                        anglePlus1/(2*M_PI),    (j+1)/heightDiv,
                        anglePlus1/(2*M_PI),    j/heightDiv );
        }
    }

	btCollisionShape *collide = new btConeShapeZ(radius, 1.0);
	btVector3 inertia;

	collide->calculateLocalInertia(mass, inertia);
	btDefaultMotionState *motion = new btDefaultMotionState(btTransform(orientation, location));

	world->addObject(new Object(world, getVertices(), nVertices(), getElements(), nVertices(), world->getPhysics()->addObject(mass, motion, collide, inertia), color ));
}



/**
 * makeSphere - Create sphere of a given radius, centered at the origin, 
 * using spherical coordinates with separate number of thetha and 
 * phi subdivisions.
 *
 * @param radius - Radius of the sphere
 * @param slides - number of subdivisions in the theta direction
 * @param stacks - Number of subdivisions in the phi direction.
 *
 * Can only use calls to addTriangle
 */
void makeSphere (World *world, float radius, int slices, int stacks, double mass, btVector3 color, btQuaternion orientation, btVector3 location)
{
	clearShape();

    int radialDiv = slices;
    int heightDiv = stacks;

    for( int j = 0; j < stacks; j++ )
    {
        for( int i = 0; i < slices; i++ )
        {
            double theta      = 2*M_PI*i/radialDiv; 
            double thetaPlus1 = 2*M_PI*(i+1)/radialDiv; 

            double phi        = M_PI*j/heightDiv;
            double phiPlus1   = M_PI*(j+1)/heightDiv;

            // top
            addTriangle(radius*cos(theta)*sin(phi),           radius*sin(theta)*sin(phi),           radius*cos(phi), 
                        radius*cos(theta)*sin(phiPlus1),      radius*sin(theta)*sin(phiPlus1),      radius*cos(phiPlus1),
                        radius*cos(thetaPlus1)*sin(phiPlus1), radius*sin(thetaPlus1)*sin(phiPlus1), radius*cos(phiPlus1),
                        theta/(2*M_PI),      1.0 - phi/M_PI,
                        theta/(2*M_PI),      1.0 - phiPlus1/M_PI,
                        thetaPlus1/(2*M_PI), 1.0 - phiPlus1/M_PI );

            addTriangle(radius*cos(theta)*sin(phi),           radius*sin(theta)*sin(phi),           radius*cos(phi),
                        radius*cos(thetaPlus1)*sin(phiPlus1), radius*sin(thetaPlus1)*sin(phiPlus1), radius*cos(phiPlus1),
                        radius*cos(thetaPlus1)*sin(phi),      radius*sin(thetaPlus1)*sin(phi),      radius*cos(phi),
                        theta/(2*M_PI),      1.0 - phi/M_PI,
                        thetaPlus1/(2*M_PI), 1.0 - phiPlus1/M_PI,
                        thetaPlus1/(2*M_PI), 1.0 - phi/M_PI );
        }
    }

	btCollisionShape *collide = new btSphereShape(1.0);
	btVector3 inertia;

	collide->calculateLocalInertia(mass, inertia);
	btDefaultMotionState *motion = new btDefaultMotionState(btTransform(orientation, location));

	world->addObject(new Object(world, getVertices(), nVertices(), getElements(), nVertices(), world->getPhysics()->addObject(mass, motion, collide, inertia), color ));
} 
