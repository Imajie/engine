/*
 * File:	world_loader.h
 *
 * Load in the objects saved in the paired .bullet and .TODO files
 */
#ifndef WORLD_LOADER_H
#define WORLD_LOADER_H

#include <btBulletDynamicsCommon.h>
#include <BulletWorldImporter/btBulletWorldImporter.h>
#include <assimp.hpp>
#include <aiScene.h>
#include <aiPostProcess.h>

#include "world.h"
#include "object.h"

class WorldLoader
{
	public:
		WorldLoader( World *world );
		~WorldLoader( );

		bool load( const char *filename );

	private:
		const aiScene *scene;
		World *world;

		// Importers, own the imported data, so they must live on
		btBulletWorldImporter *bullet_import;
		Assimp::Importer *assimp_import;
};

#endif
