/*
 * File:	bullet_physics.cpp
 *
 * Provide a wrapper around bullet physics functions
 */

#include <btBulletDynamicsCommon.h>
#include <BulletCollision/CollisionDispatch/btGhostObject.h>
#include "bullet_physics.h"
#include <algorithm>

/*
 * Create a bullet physics world
 */
BulletPhysics::BulletPhysics()
{
	// broadphase algorithm
	broadphase = new btDbvtBroadphase();
	broadphase->getOverlappingPairCache()->setInternalGhostPairCallback(new btGhostPairCallback());

	// collsion setup
	collisionConfig = new btDefaultCollisionConfiguration();
	dispatcher = new btCollisionDispatcher(collisionConfig);

	// collision solver
	solver = new btSequentialImpulseConstraintSolver();

	// create the world
	world = new btDiscreteDynamicsWorld(dispatcher, broadphase, solver, collisionConfig);
	world->getBroadphase()->getOverlappingPairCache()->setInternalGhostPairCallback(new btGhostPairCallback());
}

/*
 * Cleanup the world
 */
BulletPhysics::~BulletPhysics()
{
	// delete all objects
	for( size_t i = 0; i < objects.size(); i++ )
	{
		world->removeRigidBody(objects[i]);
		delete objects[i]->getMotionState();
		delete objects[i];
	}

	// delete all collision shapes
	for( size_t i = 0; i < collisionShapes.size(); i++ )
	{
		delete collisionShapes[i];
	}

	// cleanup
	delete world;
	delete solver;
	delete dispatcher;
	delete collisionConfig;
	delete broadphase;

}

/*
 * Add an arbitrary object to the world
 */
btRigidBody* BulletPhysics::addObject(double mass, btDefaultMotionState *motionState, btCollisionShape *collisionShape, btVector3 inertia)
{
	btRigidBody::btRigidBodyConstructionInfo info = btRigidBody::btRigidBodyConstructionInfo(mass, motionState, collisionShape, inertia);

	info.m_angularDamping = 0.2;
	info.m_linearDamping = 0.2;
	info.m_friction = 0.2;

	btRigidBody *body = new btRigidBody( info );
	world->addRigidBody(body);
	objects.push_back(body);
	collisionShapes.push_back(collisionShape);

	return body;
}

/*
 * Remove an arbitrary object from the world
 */
void BulletPhysics::removeObject(btRigidBody *body)
{
	world->removeRigidBody(body);
	delete body->getMotionState();
	delete body;

	// remove the object from our list
	objects.erase( std::remove( objects.begin(), objects.end(), body ), objects.end() );
}

/* 
 * run the world for deltaT time 
 */
void BulletPhysics::tick( double deltaT )
{
	world->stepSimulation( deltaT, 10 );
}

/*
 * Access the bullet world
 */
btDiscreteDynamicsWorld* BulletPhysics::getWorld()
{
	return world;
}
