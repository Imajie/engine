/*
 * File:	object.cpp
 *
 * An object in the game
 */
#include "object_gl.h"
#include "object.h"

#include <btBulletDynamicsCommon.h>
#include "world.h"

#define ELEM_IDX	0
#define VERT_IDX	1

// load object from file
Object::Object(World *world, const aiScene *scene, const aiNode *node, btCollisionObject *body)
	:
		world(world)
{
	// data
	std::vector<vertex_t> v_data_vec;
	std::vector<GLuint>   e_data_vec;
	processNode( scene, node, v_data_vec, e_data_vec );

	// get a material
	aiMaterial *material = NULL;
	if( node->mNumMeshes > 0 )
		material = scene->mMaterials[scene->mMeshes[node->mMeshes[0]]->mMaterialIndex];

	aiColor3D color(1,1,1);
	createObject(&v_data_vec[0], v_data_vec.size(), &e_data_vec[0], e_data_vec.size(), body, color);//material);
}

// create object with specified data
Object::Object(World *world, vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btCollisionObject *body, btVector3 color)
	:
		world(world)
{
	aiColor3D c(color.getX(), color.getY(), color.getZ());
	createObject(v_data, v_size, e_data, e_size, body, c);
}

// cleanup memory
Object::~Object()
{
	glDeleteBuffers( 2, gl_buf );

	delete edges;
	delete vertex_data;

	world->getPhysics()->removeObject(bullet);
}

// load in an aiNode
void Object::processNode( const aiScene *scene, const aiNode *node, std::vector<vertex_t> &v_data, std::vector<GLuint> &e_data )
{
	// process this node
	// 	process each mesh
	printf("Node %s has %lu meshes\n", node->mName.data, node->mNumMeshes);
	for( size_t mIdx = 0; mIdx < node->mNumMeshes; mIdx++ )
	{
		aiMesh *mesh = scene->mMeshes[node->mMeshes[mIdx]];

		// process each face in this mesh
		for( size_t fIdx = 0; fIdx < mesh->mNumFaces; fIdx++ )
		{
			aiFace face = mesh->mFaces[fIdx];
			// add each vertex in the face
			for( size_t iIdx = 0; iIdx < face.mNumIndices; iIdx++ )
			{
				vertex_t vertex;

				// position
				vertex.x = mesh->mVertices[face.mIndices[iIdx]].x;
				vertex.y = mesh->mVertices[face.mIndices[iIdx]].y;
				vertex.z = mesh->mVertices[face.mIndices[iIdx]].z;

				// normal
				vertex.nx = mesh->mNormals[face.mIndices[iIdx]].x;
				vertex.ny = mesh->mNormals[face.mIndices[iIdx]].y;
				vertex.nz = mesh->mNormals[face.mIndices[iIdx]].z;

				// texture
				vertex.u = mesh->mTextureCoords[face.mIndices[iIdx]][0].x;
				vertex.v = mesh->mTextureCoords[face.mIndices[iIdx]][0].y;

				v_data.push_back(vertex);
				e_data.push_back(v_data.size());
			}
		}
	}

	// process any children
	printf("Node %s has %lu children\n", node->mName.data, node->mNumChildren);
	for( size_t cIdx = 0; cIdx < node->mNumChildren; cIdx++ )
	{
		processNode( scene, node->mChildren[cIdx], v_data, e_data );
	}
}

// create the actual object
void Object::createObject(vertex_t *v_data, size_t v_size, GLuint *e_data, size_t e_size, btCollisionObject *body, aiColor3D color) //aiMaterial *material)
{
	vertex_data = v_data;
	vertex_count = v_size;
	edges = e_data;
	edge_count = e_size;
	bullet = body;
	this->color = color;
	//this->material = material;

	// generate and bind OpenGL buffers
	glGenBuffers( 2, gl_buf );

	glBindBuffer( GL_ELEMENT_ARRAY_BUFFER, gl_buf[ELEM_IDX] );
	glBindBuffer( GL_ARRAY_BUFFER, gl_buf[VERT_IDX] );

	glBufferData( GL_ELEMENT_ARRAY_BUFFER, e_size*sizeof(GLuint), e_data, GL_STATIC_DRAW );
	glBufferData( GL_ARRAY_BUFFER, v_size*sizeof(vertex_t), v_data, GL_STATIC_DRAW );
}

// draw this object in the scene
void Object::draw( void )
{
	// active this object
	glBindBuffer( GL_ELEMENT_ARRAY_BUFFER, gl_buf[ELEM_IDX] );
	glBindBuffer( GL_ARRAY_BUFFER, gl_buf[VERT_IDX] );

	// get the current state of the object
	btTransform trans;
	trans = bullet->getWorldTransform();

	// pass the transform to the shader
	world->getGraphics()->setModelTransform(trans);

	// set lighting
	aiColor3D ambient_diffuse(color);
	aiColor3D spec(1,1,1);
	double shininess = 10;

	/*
	if( material )
	{
		if( material->Get(AI_MATKEY_COLOR_DIFFUSE, ambient_diffuse) != AI_SUCCESS )
		{
			fprintf(stderr, "No diffuse color\n");
		}
		if( material->Get(AI_MATKEY_COLOR_SPECULAR, spec) != AI_SUCCESS )
		{
			fprintf(stderr, "No specular color\n");
		}
		if( material->Get(AI_MATKEY_SHININESS_STRENGTH, shininess) != AI_SUCCESS )
		{
			fprintf(stderr, "No specular color\n");
		}
	}
	else
	{
		//fprintf(stderr, "No material\n");
	}
	*/

	world->getGraphics()->setLightingParams( ambient_diffuse, ambient_diffuse, spec, shininess );

	// draw the element
	world->getGraphics()->setAttribPointers();
	glDrawElements( GL_TRIANGLES, vertex_count, GL_UNSIGNED_INT, BUFFER_OFFSET(0) );
}
