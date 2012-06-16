/*
 * File:	world_loader.cpp
 *
 * Load in the objects saved in the paired .bullet and .TODO files
 */
#include <btBulletDynamicsCommon.h>
#include <BulletWorldImporter/btBulletWorldImporter.h>
#include <assimp/assimp.hpp>

#include "world_loader.h"
#include "world.h"
#include "object.h"

WorldLoader::WorldLoader( World *world )
	: world(world)
{
}

WorldLoader::~WorldLoader( )
{
	// delete nothing, it needs to stay alive
}

/* 
 * use this NOT loadFile()
 */
bool WorldLoader::load( const char *filename )
{
	char assimp_name[80];
	char bullet_name[80];

	strcpy( assimp_name, filename );
	strcpy( bullet_name, filename );

	strcat( assimp_name, ".3ds" );
	strcat( bullet_name, ".bullet" );

	// create importers
	assimp_import = new Assimp::Importer();
	bullet_import = new btBulletWorldImporter( world->getPhysics()->getWorld() );

	// make sure we only get triangles
	//assimp_import->SetPropertyInteger( AI_CONFIG_PP_SBP_REMOVE, aiPrimitiveType_LINE | aiPrimitiveType_POINT );

	// read the assimp scene first
	scene = assimp_import->ReadFile( assimp_name, 
			aiProcess_Triangulate           |   
			aiProcess_JoinIdenticalVertices |
			aiProcess_GenSmoothNormals      |   
			aiProcess_RemoveComponent       |   
			aiProcess_PreTransformVertices  |
			aiProcess_SortByPType);

	// now read the bullet data
	bool good = bullet_import->loadFile(bullet_name);

	if( !scene || !good )
	{
		fprintf(stderr, "WorldLoader: Error reading data, .blend = %i, .bullet = %i\n", !!scene, good);
		return false;
	}

	/*
	 * Now, run through the objects and match them up by name, 
	 * then create and add an Object to world
	 */
	size_t num_mesh = scene->mNumMeshes;
	size_t num_rigid = bullet_import->getNumRigidBodies();
	size_t num_collision = bullet_import->getNumCollisionShapes();

	printf("Meshes: %lu, Rigid: %lu, Collision: %lu\n", num_mesh, num_rigid, num_collision);

	printf("Node names:\n");
	for( size_t i = 0; i < scene->mRootNode->mNumChildren; i++ )
	{
		printf("\t%s\n", scene->mRootNode->mChildren[i]->mName.data);
	}

	printf("Rigid Bodies:\n");
	for( size_t i = 0; i < num_rigid; i++ )
	{
		btCollisionObject *body = bullet_import->getRigidBodyByIndex(i);
		printf("\t%s\n", bullet_import->getNameForPointer(body));
		aiNode *node = scene->mRootNode->FindNode(bullet_import->getNameForPointer(body));

		if( node )
		{
			printf("found node -> %s\n", node->mName.data);

			btTransform trans = body->getWorldTransform();
			float y, p, r;
			trans.getBasis().getEulerYPR(y,p,r);

			printf("\torigin -> %f, %f, %f\n", trans.getOrigin().getX(), trans.getOrigin().getY(),trans.getOrigin().getZ());
			printf("\typr    -> %f, %f, %f\n", y,p,r );

			// create object
			Object *obj = new Object(world, scene, node, body);
			world->addObject(obj);
		}
		else
		{
			printf("No such matching node\n");
		}
	}
	return true;
}
