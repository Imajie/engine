/*
 * File:	player.h
 *
 * The player character
 */
#ifndef PLAYER_H
#define PLAYER_H

#include <btBulletDynamicsCommon.h>
#include <BulletDynamics/Character/btKinematicCharacterController.h>
#include <BulletCollision/CollisionDispatch/btGhostObject.h>
#include "object.h"

class Player // : public Object
{
	public:
		Player( btVector3 position, double height = 2.0, double width = 0.4, double walkSpeed = 2.0, double turnSpeed = 0.10, double maxStep = 0.3, double maxSlope = M_PI/6.0 );
		~Player();

		/*
		 * update the character position/orientation
		 *
		 * forward, backward, left, right correspond to strafe movements
		 * dx, dy correspond to mouse movements
		 * elapsed is the time since last update
		 */
		void update( int forward, int backward, int left, int right, int dx, int dy, int jump, double elapsed );


		/*
		 * Get the underlying character controller
		 */
		btKinematicCharacterController* getController();

		/*
		 * Get the transform for the camera view
		 */
		btTransform getViewTransform(void);

	private:
		double walkVel, turnVel;
		double cameraPitch;
		double cameraYaw;
		double width, height;

		btKinematicCharacterController *controller;
		btPairCachingGhostObject *ghost;
		btConvexShape *shape;
};


#endif
