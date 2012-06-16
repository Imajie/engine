/*
 * File:	bullet_physics.h
 *
 * Provide a wrapper around bullet physics functions
 */
#ifndef BULLET_PHYSICS_H
#define BULLET_PHYSICS_H

#include <btBulletDynamicsCommon.h>
#include <vector>

class BulletPhysics
{
	public:
		/*
		 * Create a bullet physics world
		 */
		BulletPhysics();

		/*
		 * Cleanup the world
		 */
		~BulletPhysics();

		/*
		 * Add an arbitrary object to the world
		 */
		btCollisionObject* addObject(btCollisionObject *body);
		btCollisionObject* addObject(double mass, btDefaultMotionState *motionState, btCollisionShape *collisionShape, btVector3 inertia);

		/*
		 * Remove an arbitrary object from the world
		 */
		void removeObject(btCollisionObject *body);

		/* 
		 * run the world for deltaT time 
		 */
		void tick( double deltaT );

		/*
		 * Access the bullet world
		 */
		btDiscreteDynamicsWorld* getWorld();

	private:
		// the bullet world
		btDiscreteDynamicsWorld *world;
		btBroadphaseInterface *broadphase;
		btDefaultCollisionConfiguration *collisionConfig;
		btCollisionDispatcher *dispatcher;
		btSequentialImpulseConstraintSolver *solver;

		// objects in the world
		std::vector<btCollisionObject*> objects;

		// collision shapes in the world
		std::vector<btCollisionShape*> collisionShapes;
};

#endif
