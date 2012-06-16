/*
 * File:	player.cpp
 *
 * The player character
 */
#include <btBulletDynamicsCommon.h>
#include "object.h"
#include "player.h"

Player::Player( btVector3 position, double height, double width, double walkSpeed, double turnSpeed, double maxStep, double maxSlope )
	: walkVel(walkSpeed), turnVel(turnSpeed), cameraPitch(0.0), cameraYaw(0.0)
{
	btTransform start;
	start.setIdentity();
	start.setOrigin(position);

	ghost = new btPairCachingGhostObject();
	ghost->setWorldTransform(start);

	shape = new btCapsuleShape(width, height);
	ghost->setCollisionShape(shape);
	ghost->setCollisionFlags(btCollisionObject::CF_CHARACTER_OBJECT);

	controller = new btKinematicCharacterController( ghost, shape, maxStep );
	controller->setMaxSlope( maxSlope );

	controller->setGravity( 9.8 );
	controller->setMaxJumpHeight( 1.0 );
	controller->setJumpSpeed( 0.5 * 9.8 );

}

Player::~Player()
{
	delete controller;
	delete shape;
	delete ghost;
}

/*
 * update the character position/orientation
 *
 * forward, backward, left, right correspond to strafe movements
 * dx, dy correspond to mouse movements
 * elapsed is the time since last update
 */
void Player::update( int forward, int backward, int left, int right, int dx, int dy, int jump, double elapsed )
{
	btTransform trans = ghost->getWorldTransform();

	// speed for this update
	double walkSpeed = walkVel * elapsed;
	double turnSpeed = turnVel * elapsed;

	// direction to move
	btVector3 walkDir = btVector3(0, 0, 0);

	if( dx )
	{
		// don't rotate the model for this
		cameraYaw -= turnSpeed*dx;

		while( cameraYaw < -M_PI ) cameraYaw += 2*M_PI;
		while( cameraYaw >  M_PI ) cameraYaw -= 2*M_PI;
	}
	if( dy )
	{
		// don't rotate the model for this
		cameraPitch -= turnSpeed*dy;

		if( cameraPitch < -M_PI/2.0 ) cameraPitch = -M_PI/2.0;
		if( cameraPitch >  M_PI/2.0 ) cameraPitch =  M_PI/2.0;
	}

	// get directions
	btVector3 forwardDir	= btVector3(0, 0, 1);
	btVector3 upDir			= btVector3(0, 1, 0);
	btVector3 sideDir		= btVector3(1, 0, 0);

	forwardDir = forwardDir.rotate( btVector3( 0, 1, 0 ), cameraYaw );
	sideDir    = sideDir.rotate( btVector3( 0, 1, 0 ), cameraYaw );

	// movement
	if( forward )
		walkDir -= forwardDir;
	if( backward )
		walkDir += forwardDir;
	if( right )
		walkDir += sideDir;
	if( left )
		walkDir -= sideDir;

	if( jump )
		controller->jump();


	controller->setWalkDirection( walkDir*walkSpeed );

	// make sure we don't have a rotation on the model
	ghost->getWorldTransform().setRotation(btQuaternion(0,0,0,1));
}


/*
 * Get the underlying character controller
 */
btKinematicCharacterController* Player::getController()
{
	return controller;
}

/*
 * Get the transform for the camera view
 */
btTransform Player::getViewTransform(void)
{
	btTransform trans = ghost->getWorldTransform();

	// apply the pitch
	btMatrix3x3 rot; //= trans.getBasis();
	rot.setIdentity();
	rot *= btMatrix3x3( btQuaternion( btVector3(0, 1, 0), cameraYaw ) );
	rot *= btMatrix3x3( btQuaternion( btVector3(1, 0, 0), cameraPitch ) );
	trans.setBasis(rot);

	return trans.inverse();
}

