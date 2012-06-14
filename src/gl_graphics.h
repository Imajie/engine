/*
 * File:	gl_graphics.h
 *
 * Provides an interface to OpenGL for graphical output
 */
#ifndef GL_GRAPHICS_H
#define GL_GRAPHICS_H

#include "object_gl.h"
#include <SDL/SDL.h>
#include <boost/function.hpp>
#include <btBulletDynamicsCommon.h>

#define RUN_GAME_LOOP	1

class GLGraphics
{
	public:
		/*
		 * initialize SDL
		 */
		static int init();

		/*
		 * create a new window
		 */
		GLGraphics(unsigned int w, unsigned int h, const char *title);

		/*
		 * set callbacks
		 */
		void setMouseCallback(boost::function<void (int button, int state, int x, int y)> func);
		void setKeyboardCallback(boost::function<void (SDLKey key, int x, int y)> func);
		void setDisplayCallback(boost::function<void (void)> func);

		// set the modelview matrix
		void setModelView( btTransform model );

		// lighting
		void setLightingParams( float* ambient, float* diffuse, float* specular, float shininess );

		// reset attrib pointers
		void setAttribPointers(void);

		/*
		 * Run the main loop, doesn't return
		 */
		void main_loop( boost::function<void (double delta_t)> gameloop, double millis );

		void setupShaders( const char *vshader, const char *fshader );

		// camera positioning
		void lookat( btVector3 e, btVector3 l, btVector3 up );

		void perspective( float fovy, float aspect, float near, float far );

	private:
		//
		// functions
		//
		static unsigned int gameloop_timer(unsigned int interval, void* _this);
		
		// for shaders
		char *textFileRead(const char *fn);
		int textFileWrite(char *fn, char *s);
		void printShaderInfoLog(GLuint obj);
		void printProgramInfoLog(GLuint obj);

	    boost::function<void (void)> display_cb;
	    boost::function<void (int button, int state, int x, int y)> mouse_cb;
	    boost::function<void (SDLKey key, int x, int y)> keyboard_cb;
		
		//
		// variables
		// 
		unsigned int width;
		unsigned int height;

		// OpenGL program
		GLuint program;

		// OpenGL shader params
		GLuint modelView_loc;
		GLuint projection_loc;

		GLuint vertex_loc;
		GLuint normal_loc;
		GLuint texture_loc;

		GLuint ambient_loc;
		GLuint diffuse_loc;
		GLuint specular_loc;
		GLuint shininess_loc;
		GLuint light_loc;

		SDL_Surface *screen;

		// projection matrix
		btTransform viewTrans;
		float projection_mat[16];

		// is initialized?
		static bool is_init;
};

#endif
