/*
 * File:	gl_graphics.cpp
 *
 * Provides an interface to OpenGL for graphical output
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <SDL/SDL.h>
#include <iostream>
#include <boost/bind.hpp>

#include "object_gl.h"
#include "gl_graphics.h"

bool GLGraphics::is_init = false;

#define CAMERA_MOVE_SPEED 0.1
#define CAMERA_TURN_SPEED 0.001

/*
 * Initialize SDL
 */
int GLGraphics::init()
{
	int error;
	if( !(error = SDL_Init( SDL_INIT_VIDEO | SDL_INIT_TIMER )) )
	{
		// enable keyrepeat
		SDL_EnableKeyRepeat(SDL_DEFAULT_REPEAT_DELAY, SDL_DEFAULT_REPEAT_INTERVAL);
		
		// grab mouse
		SDL_WM_GrabInput(SDL_GRAB_ON);
		SDL_ShowCursor(SDL_DISABLE);

		SDL_GL_SetAttribute(SDL_GL_SWAP_CONTROL, 1);

		SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
		SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 16);

		SDL_GL_SetAttribute(SDL_GL_RED_SIZE, 8);
		SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE, 8);
		SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE, 8);
		SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE, 8);

		is_init = true;
	}

	return error;
}

/*
 * Create a new window
 */
GLGraphics::GLGraphics(unsigned int w, unsigned int h, const char *title)
	: 
		width(w), height(h)
{
	// initialize if not done already
	if( !is_init )
	{
		GLGraphics::init();
	}

	// create the window
	screen = SDL_SetVideoMode(w, h, 0, SDL_OPENGL);
	
	if( glewInit() != GLEW_OK )
	{
		fprintf(stderr, "GLEW: error\n");
		exit(EXIT_FAILURE);
	}

	glEnable( GL_CULL_FACE );
	glEnable( GL_DEPTH_TEST );
	glDepthMask( GL_TRUE );
	glDepthFunc( GL_LESS );

	SDL_WM_SetCaption( title, title );

	glClearColor(0, 0, 0, 1);
	glClearDepth( 1.0 );
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

// set the model matrix
void GLGraphics::setModelTransform( btTransform model )
{
	float mat[16];
	btTransform modelview = viewTrans*model;
	modelview.getOpenGLMatrix(mat);

	glUniformMatrix4fv( modelView_loc, 1, GL_FALSE, mat );
	glUniformMatrix4fv( projection_loc, 1, GL_TRUE, projection_mat );
}

// reset the vertex attrib pointers
void GLGraphics::setAttribPointers( void )
{
	// set vertex attrib params, vertices, normals, and texture
	glVertexAttribPointer(vertex_loc,  3, GL_FLOAT, GL_FALSE, sizeof(vertex_t), BUFFER_OFFSET(0));
	glVertexAttribPointer(normal_loc,  3, GL_FLOAT, GL_FALSE, sizeof(vertex_t), BUFFER_OFFSET(sizeof(float)*3));
	glVertexAttribPointer(texture_loc, 2, GL_FLOAT, GL_FALSE, sizeof(vertex_t), BUFFER_OFFSET(sizeof(float)*6));

	// enable the attributes
	glEnableVertexAttribArray(vertex_loc);
	glEnableVertexAttribArray(normal_loc);
	glEnableVertexAttribArray(texture_loc);
}

void GLGraphics::setLightingParams( aiColor3D ambient, aiColor3D diffuse, aiColor3D specular, float shininess )
{
	float a[3], d[3], s[3];
	a[0] = ambient.r;
	a[1] = ambient.g;
	a[2] = ambient.b;

	d[0] = diffuse.r;
	d[1] = diffuse.g;
	d[2] = diffuse.b;

	s[0] = specular.r;
	s[1] = specular.g;
	s[2] = specular.b;

	glUniform1f( shininess_loc, shininess );
	glUniform3fv( ambient_loc, 1, a );
	glUniform3fv( diffuse_loc, 1, d );
	glUniform3fv( specular_loc, 1, s );

	float data[4];
	data[0] = 0.0;
	data[1] = 0.0;
	data[2] = 0.0;
	data[3] = 1.0;

	glUniform4fv( light_loc, 1, data );

	/*
	printf("ambient  = %f %f %f\n", ambient[0], ambient[1], ambient[2] );
	printf("diffuse  = %f %f %f\n", diffuse[0], diffuse[1], diffuse[2] );
	printf("specular = %f %f %f\n", specular[0], specular[1], specular[2] );
	printf("shininess = %f\n", shininess );

	printf("light position = %f %f %f\n", data[0], data[1], data[2]);
	*/
}

void GLGraphics::setViewTransform( btTransform view )
{
	viewTrans = view;
}

void GLGraphics::perspective( float fovy, float aspect, float near, float far )
{
	float f = 1.0/tan(fovy/2);
	float new_proj[16] = {
		f/aspect, 0.0, 0.0,                   0.0,
		0.0,      f,   0.0,                   0.0,
		0.0,      0.0, (far+near)/(near-far), 2.0f*far*near/(near-far),
		0.0,      0.0, -1.0,                  0.0 
	};

	memcpy(projection_mat, new_proj, sizeof(float)*16);
}


/*
 * set callbacks
 */
void GLGraphics::setMousePressCallback(boost::function<void (int button, int state, int x, int y)> func)
{
	mouse_press_cb = func;
}

void GLGraphics::setMouseMovedCallback(boost::function<void (int dx, int dy, int x, int y)> func)
{
	mouse_moved_cb = func;
}

void GLGraphics::setKeyboardCallback(boost::function<void (SDLKey key, int state, int x, int y)> func)
{
	keyboard_cb = func;
}

void GLGraphics::setDisplayCallback(boost::function<void (void)> func)
{
	display_cb = func;
}

/*
 * run SDL main loop
 */
void GLGraphics::main_loop( boost::function<void (double delta_t)> gameloop, double millis )
{
	bool done = false;
	SDL_Event event;
	SDL_TimerID timer = SDL_AddTimer(millis, gameloop_timer, this);

	struct timespec last, now;
	clock_gettime(CLOCK_MONOTONIC, &last);

	int mouse_x, mouse_y;
	while((!done) && (SDL_WaitEvent(&event))) {
		clock_gettime(CLOCK_MONOTONIC, &now);

		double elapsed = (now.tv_sec - last.tv_sec) + (now.tv_nsec - last.tv_nsec)/1000000000.0;

		int forward = 0;
		int side = 0;
		switch(event.type) {
			case SDL_USEREVENT:
				switch(event.user.code)
				{
					case RUN_GAME_LOOP:
						glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
						glCullFace( GL_BACK );

						gameloop(elapsed);

						SDL_GL_SwapBuffers();

						last.tv_sec = now.tv_sec;
						last.tv_nsec = now.tv_nsec;
						break;
				}
				break;

			case SDL_KEYDOWN:
			case SDL_KEYUP:
				if( keyboard_cb )
					keyboard_cb( event.key.keysym.sym, event.key.state, mouse_x, mouse_y );

				switch( event.key.keysym.sym )
				{
					case SDLK_ESCAPE:
						done = true;
						break;
				}
				break;

			case SDL_MOUSEMOTION:
				mouse_x = event.motion.x;
				mouse_y = event.motion.y;

				if( mouse_moved_cb )
					mouse_moved_cb(event.motion.xrel, event.motion.yrel, event.motion.x, event.motion.y);
				break;
			case SDL_MOUSEBUTTONDOWN:
			case SDL_MOUSEBUTTONUP:
				if( mouse_press_cb )
					mouse_press_cb(event.button.button, event.button.state, event.button.x, event.button.y);
				break;

			case SDL_QUIT:
				printf("quit\n");
				done = true;
				break;

			default:
				//printf("unknown (%i)\n", event.type);
				break;
		}

	}
}

unsigned int GLGraphics::gameloop_timer( unsigned int interval, void *_this)
{
	SDL_Event event;

	event.type = SDL_USEREVENT;
	event.user.code = RUN_GAME_LOOP;
	event.user.data1 = 0;
	event.user.data2 = 0;

	SDL_PushEvent( &event );

	return interval;
}

char *GLGraphics::textFileRead(const char *fn) {


	FILE *fp;
	char *content = NULL;

	int count=0;

	if (fn != NULL) {
		fp = fopen(fn,"rt");

		if (fp != NULL) {

			fseek(fp, 0, SEEK_END);
			count = ftell(fp);
			rewind(fp);

			if (count > 0) {
				content = (char *)malloc(sizeof(char) * (count+1));
				count = fread(content,sizeof(char),count,fp);
				content[count] = '\0';
			}
			fclose(fp);
		}
	}
	else {
		fprintf (stderr, "Error reading %s\n", fn);
	}
	return content;
}

int GLGraphics::textFileWrite(char *fn, char *s) {

	FILE *fp;
	int status = 0;

	if (fn != NULL) {
		fp = fopen(fn,"w");

		if (fp != NULL) {

			if (fwrite(s,sizeof(char),strlen(s),fp) == strlen(s))
				status = 1;
			fclose(fp);
		}
	}
	return(status);
}

void GLGraphics::printShaderInfoLog(GLuint obj)
{
	GLint infologLength = 0;
	GLsizei charsWritten  = 0;
	char *infoLog;

	glGetShaderiv(obj, GL_INFO_LOG_LENGTH,&infologLength);

	if (infologLength > 0)
	{   
		infoLog = (char *)malloc(infologLength);
		glGetShaderInfoLog(obj, infologLength, &charsWritten, infoLog);
		printf("%s\n",infoLog);
		free(infoLog);
	}   
}

void GLGraphics::printProgramInfoLog(GLuint obj)
{
	GLint infologLength = 0;
	GLsizei charsWritten  = 0;
	char *infoLog;

	glGetProgramiv(obj, GL_INFO_LOG_LENGTH,&infologLength);

	if (infologLength > 0)
	{   
		infoLog = (char *)malloc(infologLength);
		glGetProgramInfoLog(obj, infologLength, &charsWritten, infoLog);
		printf("%s\n",infoLog);
		free(infoLog);
	}   
}


/**
 * Auxillary function to set up a GLSL shader program.  requires the name of a vertex program and a fragment
 * program.  Returns a handle to the created GLSL program
 *
 * vert - Name of source file for vertex program
 * frag - Name of source file for fragment program
 */

void GLGraphics::setupShaders(const char *vert, const char *frag)
{
	// Read in shader source
	char *vs = NULL,*fs = NULL;

	// Create the shader 
	program = glCreateProgram();
	GLuint the_vert = glCreateShader(GL_VERTEX_SHADER);
	GLuint the_frag = glCreateShader(GL_FRAGMENT_SHADER);

	// Read in shader source
	vs = textFileRead(vert);
	if (!vs) {
		fprintf (stderr, "Error reading vertex shader file %s\n", vert);
		return;
	}
	fs = textFileRead(frag);
	if (!fs) {
		fprintf (stderr, "Error reading fragment shader file %s\n", frag);
		return;
	}

	glShaderSource(the_vert, 1, ((const char**)&vs),NULL);
	glShaderSource(the_frag, 1, ((const char**)&fs),NULL);

	free(vs);free(fs);

	// Compile the shader
	glCompileShader(the_vert);
	printShaderInfoLog(the_vert);
	glCompileShader(the_frag);
	printShaderInfoLog(the_frag);

	// Create the program -- attaching your shaders
	glAttachShader(program, the_vert);
	glAttachShader(program, the_frag);
	printProgramInfoLog(program);

	// Link the program
	glLinkProgram(program);
	printProgramInfoLog(program);

	glUseProgram(program);

	// get parameters from the shaders
	vertex_loc  = glGetAttribLocation(program, "vertex");
	normal_loc  = glGetAttribLocation(program, "normal");
	texture_loc = glGetAttribLocation(program, "texture");

	// matrices
	projection_loc = glGetUniformLocation(program, "projection");
	modelView_loc  = glGetUniformLocation(program, "modelview");

	// lighting
	ambient_loc		= glGetUniformLocation(program, "ambientProd");
	diffuse_loc		= glGetUniformLocation(program, "diffProd");
	specular_loc	= glGetUniformLocation(program, "specProd");
	shininess_loc	= glGetUniformLocation(program, "shininess");

	light_loc		= glGetUniformLocation(program, "lightPosition");

}
