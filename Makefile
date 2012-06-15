DIRS=src
SOURCES=$(foreach dir,${DIRS},$(wildcard ${dir}/*.cpp))
OBJS=$(subst .cpp,.o,${SOURCES})

BULLET_LIBS=$(shell pkg-config --libs bullet)
BULLET_INCLUDES=$(shell pkg-config --cflags bullet)

BOOST_LIBS=-lboost_system
BOOST_INCLUDES=

GL_LIBS=-lGL -lglut -lGLU -lGLEW
GL_INCLUDES=

SDL_LIBS=$(shell pkg-config --libs sdl)
SDL_INCLUDES=$(shell pkg-config --cflags sdl)

TARGET=bullet_test

CXX=g++ -std=gnu++11
CXXFLAGS=-ggdb ${BULLET_INCLUDES} ${BOOST_INCLUDES} ${GL_INCLUDES} ${SDL_INCLUDES}

LIBS=${BULLET_LIBS} ${BOOST_LIBS} ${GL_LIBS} ${SDL_LIBS} -lrt

.PHONY: all
all: ${TARGET}

${TARGET}: ${OBJS}
	${CXX} -o $@ $^ ${LIBS}

.PHONY: clean realclean depend
	
depend:
	@makedepend ${SOURCES} -- ${CXXFLAGS} 2> /dev/null
	-rm Makefile.bak

realclean: clean
	-rm ${TARGET}

clean:
	-rm ${OBJS}
# DO NOT DELETE

src/simpleShape.o: src/object_gl.h /usr/include/GL/glew.h
src/simpleShape.o: /usr/include/stdint.h /usr/include/features.h
src/simpleShape.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/simpleShape.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
src/simpleShape.o: /usr/include/bits/wchar.h /usr/include/GL/glu.h
src/simpleShape.o: /usr/include/GL/gl.h
src/gl_graphics.o: /usr/include/stdio.h /usr/include/features.h
src/gl_graphics.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/gl_graphics.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
src/gl_graphics.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
src/gl_graphics.o: /usr/include/libio.h /usr/include/_G_config.h
src/gl_graphics.o: /usr/include/wchar.h /usr/include/bits/wchar.h
src/gl_graphics.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
src/gl_graphics.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
src/gl_graphics.o: /usr/include/bits/waitflags.h
src/gl_graphics.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
src/gl_graphics.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
src/gl_graphics.o: /usr/include/sys/types.h /usr/include/time.h
src/gl_graphics.o: /usr/include/sys/select.h /usr/include/bits/select.h
src/gl_graphics.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
src/gl_graphics.o: /usr/include/sys/sysmacros.h
src/gl_graphics.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
src/gl_graphics.o: /usr/include/string.h /usr/include/SDL/SDL.h
src/gl_graphics.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
src/gl_graphics.o: /usr/include/SDL/SDL_config.h
src/gl_graphics.o: /usr/include/SDL/SDL_platform.h /usr/include/inttypes.h
src/gl_graphics.o: /usr/include/stdint.h /usr/include/ctype.h
src/gl_graphics.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
src/gl_graphics.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
src/gl_graphics.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
src/gl_graphics.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
src/gl_graphics.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
src/gl_graphics.o: /usr/include/SDL/SDL_cpuinfo.h
src/gl_graphics.o: /usr/include/SDL/SDL_events.h
src/gl_graphics.o: /usr/include/SDL/SDL_active.h
src/gl_graphics.o: /usr/include/SDL/SDL_keyboard.h
src/gl_graphics.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
src/gl_graphics.o: /usr/include/SDL/SDL_video.h
src/gl_graphics.o: /usr/include/SDL/SDL_joystick.h
src/gl_graphics.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
src/gl_graphics.o: /usr/include/SDL/SDL_timer.h
src/gl_graphics.o: /usr/include/SDL/SDL_version.h /usr/include/boost/bind.hpp
src/gl_graphics.o: /usr/include/boost/bind/bind.hpp
src/gl_graphics.o: /usr/include/boost/config.hpp
src/gl_graphics.o: /usr/include/boost/config/select_compiler_config.hpp
src/gl_graphics.o: /usr/include/boost/config/compiler/gcc.hpp
src/gl_graphics.o: /usr/include/boost/config/select_platform_config.hpp
src/gl_graphics.o: /usr/include/boost/config/suffix.hpp
src/gl_graphics.o: /usr/include/boost/ref.hpp /usr/include/boost/config.hpp
src/gl_graphics.o: /usr/include/boost/utility/addressof.hpp
src/gl_graphics.o: /usr/include/boost/detail/workaround.hpp
src/gl_graphics.o: /usr/include/boost/mpl/bool.hpp
src/gl_graphics.o: /usr/include/boost/mpl/bool_fwd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/adl_barrier.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/adl.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/msvc.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/intel.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/gcc.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/workaround.hpp
src/gl_graphics.o: /usr/include/boost/mpl/integral_c_tag.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/static_constant.hpp
src/gl_graphics.o: /usr/include/boost/mem_fn.hpp
src/gl_graphics.o: /usr/include/boost/bind/mem_fn.hpp
src/gl_graphics.o: /usr/include/boost/get_pointer.hpp
src/gl_graphics.o: /usr/include/boost/config/no_tr1/memory.hpp
src/gl_graphics.o: /usr/include/boost/bind/mem_fn_template.hpp
src/gl_graphics.o: /usr/include/boost/bind/mem_fn_cc.hpp
src/gl_graphics.o: /usr/include/boost/type.hpp
src/gl_graphics.o: /usr/include/boost/is_placeholder.hpp
src/gl_graphics.o: /usr/include/boost/bind/arg.hpp
src/gl_graphics.o: /usr/include/boost/visit_each.hpp
src/gl_graphics.o: /usr/include/boost/bind/storage.hpp
src/gl_graphics.o: /usr/include/boost/bind/bind_template.hpp
src/gl_graphics.o: /usr/include/boost/bind/bind_cc.hpp
src/gl_graphics.o: /usr/include/boost/bind/bind_mf_cc.hpp
src/gl_graphics.o: /usr/include/boost/bind/bind_mf2_cc.hpp
src/gl_graphics.o: /usr/include/boost/bind/placeholders.hpp src/object_gl.h
src/gl_graphics.o: /usr/include/GL/glew.h /usr/include/GL/glu.h
src/gl_graphics.o: /usr/include/GL/gl.h src/gl_graphics.h
src/gl_graphics.o: /usr/include/boost/function.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/iterate.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/iteration/iterate.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/arithmetic/dec.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/config/config.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/arithmetic/inc.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/array/elem.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/array/data.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/tuple/elem.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/cat.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/facilities/overload.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/variadic/size.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/tuple/rem.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/variadic/elem.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/array/size.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/slot/slot.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/slot/detail/def.hpp
src/gl_graphics.o: /usr/include/boost/function/detail/prologue.hpp
src/gl_graphics.o: /usr/include/boost/config/no_tr1/functional.hpp
src/gl_graphics.o: /usr/include/boost/throw_exception.hpp
src/gl_graphics.o: /usr/include/boost/exception/detail/attribute_noreturn.hpp
src/gl_graphics.o: /usr/include/boost/function/function_base.hpp
src/gl_graphics.o: /usr/include/boost/detail/sp_typeinfo.hpp
src/gl_graphics.o: /usr/include/boost/assert.hpp /usr/include/assert.h
src/gl_graphics.o: /usr/include/boost/current_function.hpp
src/gl_graphics.o: /usr/include/boost/integer.hpp
src/gl_graphics.o: /usr/include/boost/integer_fwd.hpp
src/gl_graphics.o: /usr/include/boost/limits.hpp
src/gl_graphics.o: /usr/include/boost/cstdint.hpp /usr/include/limits.h
src/gl_graphics.o: /usr/include/bits/posix1_lim.h
src/gl_graphics.o: /usr/include/bits/local_lim.h /usr/include/linux/limits.h
src/gl_graphics.o: /usr/include/bits/posix2_lim.h
src/gl_graphics.o: /usr/include/bits/xopen_lim.h
src/gl_graphics.o: /usr/include/boost/integer_traits.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/has_trivial_copy.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/config.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/intrinsics.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_volatile.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/cv_traits_impl.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/yes_no_type.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/bool_trait_def.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/template_arity_spec.hpp
src/gl_graphics.o: /usr/include/boost/mpl/int.hpp
src/gl_graphics.o: /usr/include/boost/mpl/int_fwd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/nttp_decl.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/nttp.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/integral_wrapper.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/static_cast.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/template_arity_fwd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/preprocessor/params.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/preprocessor.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/comma_if.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/punctuation/comma_if.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/control/if.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/control/iif.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/logical/bool.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/facilities/empty.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/punctuation/comma.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/repeat.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/repetition/repeat.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/debug/error.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/detail/auto_rec.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/tuple/eat.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/inc.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/lambda.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/ttp.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/ctps.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/overload_resolution.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/integral_constant.hpp
src/gl_graphics.o: /usr/include/boost/mpl/integral_c.hpp
src/gl_graphics.o: /usr/include/boost/mpl/integral_c_fwd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/lambda_support.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/yes_no.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/arrays.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/na_fwd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/preprocessor/enum.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/tuple/to_list.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/list/for_each_i.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/list/adt.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/detail/is_binary.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/detail/check.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/logical/compl.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/repetition/for.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/repetition/detail/for.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/control/expr_iif.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/bool_trait_undef.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_pod.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_void.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_scalar.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_arithmetic.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_integral.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_float.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/ice_or.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_enum.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/add_reference.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_reference.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_lvalue_reference.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_rvalue_reference.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/ice.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/ice_and.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/ice_not.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/ice_eq.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/type_trait_def.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/type_trait_undef.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_convertible.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_array.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_abstract.hpp
src/gl_graphics.o: /usr/include/boost/static_assert.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_class.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_union.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/remove_cv.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/broken_compiler_spec.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/add_rvalue_reference.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_function.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/false_result.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/is_function_ptr_helper.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_pointer.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_member_pointer.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_member_function_pointer.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/is_mem_fun_pointer_impl.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/has_trivial_destructor.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/is_const.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/composite_traits.hpp
src/gl_graphics.o: /usr/include/boost/mpl/if.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/value_wknd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/integral.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/eti.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/na_spec.hpp
src/gl_graphics.o: /usr/include/boost/mpl/lambda_fwd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/void_fwd.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/na.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/arity.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/config/dtp.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/preprocessor/def_params_tail.hpp
src/gl_graphics.o: /usr/include/boost/mpl/limits/arity.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/logical/and.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/logical/bitand.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/identity.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/facilities/identity.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/empty.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/arithmetic/add.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/control/while.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/list/fold_left.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/list/detail/fold_left.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/list/fold_right.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/list/detail/fold_right.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/list/reverse.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/control/detail/while.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/arithmetic/sub.hpp
src/gl_graphics.o: /usr/include/boost/mpl/aux_/lambda_arity_param.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/alignment_of.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/size_t_trait_def.hpp
src/gl_graphics.o: /usr/include/boost/mpl/size_t.hpp
src/gl_graphics.o: /usr/include/boost/mpl/size_t_fwd.hpp
src/gl_graphics.o: /usr/include/boost/type_traits/detail/size_t_trait_undef.hpp
src/gl_graphics.o: /usr/include/boost/utility/enable_if.hpp
src/gl_graphics.o: /usr/include/boost/function_equal.hpp
src/gl_graphics.o: /usr/include/boost/function/function_fwd.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/enum.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/repetition/enum.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/enum_params.hpp
src/gl_graphics.o: /usr/include/boost/preprocessor/repetition/enum_params.hpp
src/gl_graphics.o: /usr/include/bullet/btBulletDynamicsCommon.h
src/gl_graphics.o: /usr/include/bullet/btBulletCollisionCommon.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btVector3.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btScalar.h
src/gl_graphics.o: /usr/include/math.h /usr/include/bits/huge_val.h
src/gl_graphics.o: /usr/include/bits/huge_valf.h
src/gl_graphics.o: /usr/include/bits/huge_vall.h /usr/include/bits/inf.h
src/gl_graphics.o: /usr/include/bits/nan.h /usr/include/bits/mathdef.h
src/gl_graphics.o: /usr/include/bits/mathcalls.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btMinMax.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btTransform.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btVector3.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btQuadWord.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btMotionState.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btTransform.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDispatcher.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btScalar.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btPersistentManifold.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btTransformUtil.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btManifoldResult.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btDiscreteCollisionDetectorInterface.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseInterface.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btPolyhedralConvexShape.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexInternalShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionMargin.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btAabbUtil2.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btMinMax.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btSphereShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCapsuleShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCylinderShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConeShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStaticPlaneShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConcaveShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleCallback.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexHullShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMesh.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStridingMeshInterface.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btOptimizedBvh.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btQuantizedBvh.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleInfoMap.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btHashMap.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btSerializer.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btStackAlloc.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btHashMap.h
src/gl_graphics.o: /usr/include/memory.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCompoundShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTetrahedronShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btEmptyShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btMultiSphereShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btUniformScalingShape.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionConfiguration.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btSimpleBroadphase.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btAxisSweep3.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvt.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btDefaultMotionState.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btMotionState.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btQuickprof.h
src/gl_graphics.o: /usr/include/bullet/LinearMath/btIDebugDraw.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Dynamics/btDynamicsWorld.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactSolverInfo.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Dynamics/btSimpleDynamicsWorld.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btJacobianEntry.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverBody.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHingeConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConeTwistConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSliderConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btUniversalConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHinge2Constraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConstraintSolver.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Vehicle/btRaycastVehicle.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Vehicle/btVehicleRaycaster.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Vehicle/btWheelInfo.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Dynamics/btActionInterface.h
src/gl_graphics.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/bullet_physics.o: /usr/include/bullet/btBulletDynamicsCommon.h
src/bullet_physics.o: /usr/include/bullet/btBulletCollisionCommon.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btVector3.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btScalar.h
src/bullet_physics.o: /usr/include/math.h /usr/include/features.h
src/bullet_physics.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/bullet_physics.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
src/bullet_physics.o: /usr/include/bits/huge_val.h
src/bullet_physics.o: /usr/include/bits/huge_valf.h
src/bullet_physics.o: /usr/include/bits/huge_vall.h /usr/include/bits/inf.h
src/bullet_physics.o: /usr/include/bits/nan.h /usr/include/bits/mathdef.h
src/bullet_physics.o: /usr/include/bits/mathcalls.h /usr/include/stdlib.h
src/bullet_physics.o: /usr/include/bits/waitflags.h
src/bullet_physics.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
src/bullet_physics.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
src/bullet_physics.o: /usr/include/xlocale.h /usr/include/sys/types.h
src/bullet_physics.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
src/bullet_physics.o: /usr/include/time.h /usr/include/sys/select.h
src/bullet_physics.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
src/bullet_physics.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
src/bullet_physics.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
src/bullet_physics.o: /usr/include/assert.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btMinMax.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btTransform.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btVector3.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btQuadWord.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btMotionState.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btTransform.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDispatcher.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btScalar.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btPersistentManifold.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btTransformUtil.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btManifoldResult.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btDiscreteCollisionDetectorInterface.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseInterface.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btPolyhedralConvexShape.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexInternalShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionMargin.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btAabbUtil2.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btMinMax.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btSphereShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCapsuleShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCylinderShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConeShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStaticPlaneShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConcaveShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleCallback.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexHullShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMesh.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStridingMeshInterface.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btOptimizedBvh.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btQuantizedBvh.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleInfoMap.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btHashMap.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btSerializer.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btStackAlloc.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btHashMap.h
src/bullet_physics.o: /usr/include/memory.h /usr/include/string.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCompoundShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTetrahedronShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btEmptyShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btMultiSphereShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionShapes/btUniformScalingShape.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionConfiguration.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btSimpleBroadphase.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btAxisSweep3.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvt.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btDefaultMotionState.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btMotionState.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btQuickprof.h
src/bullet_physics.o: /usr/include/stdio.h /usr/include/libio.h
src/bullet_physics.o: /usr/include/_G_config.h /usr/include/wchar.h
src/bullet_physics.o: /usr/include/bits/wchar.h /usr/include/bits/stdio_lim.h
src/bullet_physics.o: /usr/include/bits/sys_errlist.h
src/bullet_physics.o: /usr/include/bullet/LinearMath/btIDebugDraw.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Dynamics/btDynamicsWorld.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactSolverInfo.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Dynamics/btSimpleDynamicsWorld.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btJacobianEntry.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverBody.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHingeConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConeTwistConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSliderConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btUniversalConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHinge2Constraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConstraintSolver.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Vehicle/btRaycastVehicle.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Vehicle/btVehicleRaycaster.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Vehicle/btWheelInfo.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Dynamics/btActionInterface.h
src/bullet_physics.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btGhostObject.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/bullet_physics.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/bullet_physics.o: src/bullet_physics.h
src/player.o: /usr/include/bullet/btBulletDynamicsCommon.h
src/player.o: /usr/include/bullet/btBulletCollisionCommon.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/player.o: /usr/include/bullet/LinearMath/btVector3.h
src/player.o: /usr/include/bullet/LinearMath/btScalar.h /usr/include/math.h
src/player.o: /usr/include/features.h /usr/include/sys/cdefs.h
src/player.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
src/player.o: /usr/include/gnu/stubs-64.h /usr/include/bits/huge_val.h
src/player.o: /usr/include/bits/huge_valf.h /usr/include/bits/huge_vall.h
src/player.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
src/player.o: /usr/include/bits/mathdef.h /usr/include/bits/mathcalls.h
src/player.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
src/player.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
src/player.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
src/player.o: /usr/include/xlocale.h /usr/include/sys/types.h
src/player.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
src/player.o: /usr/include/time.h /usr/include/sys/select.h
src/player.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
src/player.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
src/player.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
src/player.o: /usr/include/assert.h /usr/include/bullet/LinearMath/btMinMax.h
src/player.o: /usr/include/bullet/LinearMath/btTransform.h
src/player.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/player.o: /usr/include/bullet/LinearMath/btVector3.h
src/player.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/player.o: /usr/include/bullet/LinearMath/btQuadWord.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/player.o: /usr/include/bullet/LinearMath/btMotionState.h
src/player.o: /usr/include/bullet/LinearMath/btTransform.h
src/player.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/player.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/player.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDispatcher.h
src/player.o: /usr/include/bullet/LinearMath/btScalar.h
src/player.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btPersistentManifold.h
src/player.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/player.o: /usr/include/bullet/LinearMath/btTransformUtil.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btManifoldResult.h
src/player.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btDiscreteCollisionDetectorInterface.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseInterface.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btPolyhedralConvexShape.h
src/player.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexInternalShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionMargin.h
src/player.o: /usr/include/bullet/LinearMath/btAabbUtil2.h
src/player.o: /usr/include/bullet/LinearMath/btMinMax.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btSphereShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCapsuleShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCylinderShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConeShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStaticPlaneShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConcaveShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleCallback.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexHullShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMesh.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStridingMeshInterface.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btOptimizedBvh.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btQuantizedBvh.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleInfoMap.h
src/player.o: /usr/include/bullet/LinearMath/btHashMap.h
src/player.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/player.o: /usr/include/bullet/LinearMath/btSerializer.h
src/player.o: /usr/include/bullet/LinearMath/btStackAlloc.h
src/player.o: /usr/include/bullet/LinearMath/btHashMap.h
src/player.o: /usr/include/memory.h /usr/include/string.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCompoundShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTetrahedronShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btEmptyShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btMultiSphereShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionShapes/btUniformScalingShape.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionConfiguration.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btSimpleBroadphase.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btAxisSweep3.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvt.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/player.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/player.o: /usr/include/bullet/LinearMath/btDefaultMotionState.h
src/player.o: /usr/include/bullet/LinearMath/btMotionState.h
src/player.o: /usr/include/bullet/LinearMath/btQuickprof.h
src/player.o: /usr/include/stdio.h /usr/include/libio.h
src/player.o: /usr/include/_G_config.h /usr/include/wchar.h
src/player.o: /usr/include/bits/wchar.h /usr/include/bits/stdio_lim.h
src/player.o: /usr/include/bits/sys_errlist.h
src/player.o: /usr/include/bullet/LinearMath/btIDebugDraw.h
src/player.o: /usr/include/bullet/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.h
src/player.o: /usr/include/bullet/BulletDynamics/Dynamics/btDynamicsWorld.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactSolverInfo.h
src/player.o: /usr/include/bullet/BulletDynamics/Dynamics/btSimpleDynamicsWorld.h
src/player.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btJacobianEntry.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverBody.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHingeConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConeTwistConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSliderConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btUniversalConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHinge2Constraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConstraintSolver.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactConstraint.h
src/player.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/player.o: /usr/include/bullet/BulletDynamics/Vehicle/btRaycastVehicle.h
src/player.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/player.o: /usr/include/bullet/BulletDynamics/Vehicle/btVehicleRaycaster.h
src/player.o: /usr/include/bullet/BulletDynamics/Vehicle/btWheelInfo.h
src/player.o: /usr/include/bullet/BulletDynamics/Dynamics/btActionInterface.h
src/player.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/player.o: src/object.h src/object_gl.h /usr/include/GL/glew.h
src/player.o: /usr/include/stdint.h /usr/include/GL/glu.h
src/player.o: /usr/include/GL/gl.h src/player.h
src/player.o: /usr/include/bullet/BulletDynamics/Character/btKinematicCharacterController.h
src/player.o: /usr/include/bullet/BulletDynamics/Character/btCharacterControllerInterface.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btGhostObject.h
src/player.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/player.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/world.o: src/gl_graphics.h src/object_gl.h /usr/include/GL/glew.h
src/world.o: /usr/include/stdint.h /usr/include/features.h
src/world.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/world.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
src/world.o: /usr/include/bits/wchar.h /usr/include/GL/glu.h
src/world.o: /usr/include/GL/gl.h /usr/include/SDL/SDL.h
src/world.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
src/world.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
src/world.o: /usr/include/stdio.h /usr/include/bits/types.h
src/world.o: /usr/include/bits/typesizes.h /usr/include/libio.h
src/world.o: /usr/include/_G_config.h /usr/include/wchar.h
src/world.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
src/world.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
src/world.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
src/world.o: /usr/include/endian.h /usr/include/bits/endian.h
src/world.o: /usr/include/bits/byteswap.h /usr/include/sys/types.h
src/world.o: /usr/include/time.h /usr/include/sys/select.h
src/world.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
src/world.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
src/world.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
src/world.o: /usr/include/string.h /usr/include/inttypes.h
src/world.o: /usr/include/ctype.h /usr/include/iconv.h
src/world.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
src/world.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
src/world.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
src/world.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
src/world.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
src/world.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
src/world.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
src/world.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
src/world.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
src/world.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
src/world.o: /usr/include/SDL/SDL_version.h /usr/include/boost/function.hpp
src/world.o: /usr/include/boost/preprocessor/iterate.hpp
src/world.o: /usr/include/boost/preprocessor/iteration/iterate.hpp
src/world.o: /usr/include/boost/preprocessor/arithmetic/dec.hpp
src/world.o: /usr/include/boost/preprocessor/config/config.hpp
src/world.o: /usr/include/boost/preprocessor/arithmetic/inc.hpp
src/world.o: /usr/include/boost/preprocessor/array/elem.hpp
src/world.o: /usr/include/boost/preprocessor/array/data.hpp
src/world.o: /usr/include/boost/preprocessor/tuple/elem.hpp
src/world.o: /usr/include/boost/preprocessor/cat.hpp
src/world.o: /usr/include/boost/preprocessor/facilities/overload.hpp
src/world.o: /usr/include/boost/preprocessor/variadic/size.hpp
src/world.o: /usr/include/boost/preprocessor/tuple/rem.hpp
src/world.o: /usr/include/boost/preprocessor/variadic/elem.hpp
src/world.o: /usr/include/boost/preprocessor/array/size.hpp
src/world.o: /usr/include/boost/preprocessor/slot/slot.hpp
src/world.o: /usr/include/boost/preprocessor/slot/detail/def.hpp
src/world.o: /usr/include/boost/detail/workaround.hpp
src/world.o: /usr/include/boost/config.hpp
src/world.o: /usr/include/boost/function/detail/prologue.hpp
src/world.o: /usr/include/boost/config/no_tr1/functional.hpp
src/world.o: /usr/include/boost/throw_exception.hpp
src/world.o: /usr/include/boost/exception/detail/attribute_noreturn.hpp
src/world.o: /usr/include/boost/function/function_base.hpp
src/world.o: /usr/include/boost/detail/sp_typeinfo.hpp
src/world.o: /usr/include/boost/assert.hpp /usr/include/assert.h
src/world.o: /usr/include/boost/current_function.hpp
src/world.o: /usr/include/boost/integer.hpp
src/world.o: /usr/include/boost/integer_fwd.hpp /usr/include/boost/limits.hpp
src/world.o: /usr/include/boost/cstdint.hpp /usr/include/limits.h
src/world.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
src/world.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h
src/world.o: /usr/include/bits/xopen_lim.h
src/world.o: /usr/include/boost/integer_traits.hpp
src/world.o: /usr/include/boost/type_traits/has_trivial_copy.hpp
src/world.o: /usr/include/boost/type_traits/config.hpp
src/world.o: /usr/include/boost/type_traits/intrinsics.hpp
src/world.o: /usr/include/boost/type_traits/is_volatile.hpp
src/world.o: /usr/include/boost/type_traits/detail/cv_traits_impl.hpp
src/world.o: /usr/include/boost/type_traits/detail/yes_no_type.hpp
src/world.o: /usr/include/boost/type_traits/detail/bool_trait_def.hpp
src/world.o: /usr/include/boost/type_traits/detail/template_arity_spec.hpp
src/world.o: /usr/include/boost/mpl/int.hpp
src/world.o: /usr/include/boost/mpl/int_fwd.hpp
src/world.o: /usr/include/boost/mpl/aux_/adl_barrier.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/adl.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/msvc.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/intel.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/gcc.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/workaround.hpp
src/world.o: /usr/include/boost/mpl/aux_/nttp_decl.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/nttp.hpp
src/world.o: /usr/include/boost/mpl/aux_/integral_wrapper.hpp
src/world.o: /usr/include/boost/mpl/integral_c_tag.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/static_constant.hpp
src/world.o: /usr/include/boost/mpl/aux_/static_cast.hpp
src/world.o: /usr/include/boost/mpl/aux_/template_arity_fwd.hpp
src/world.o: /usr/include/boost/mpl/aux_/preprocessor/params.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/preprocessor.hpp
src/world.o: /usr/include/boost/preprocessor/comma_if.hpp
src/world.o: /usr/include/boost/preprocessor/punctuation/comma_if.hpp
src/world.o: /usr/include/boost/preprocessor/control/if.hpp
src/world.o: /usr/include/boost/preprocessor/control/iif.hpp
src/world.o: /usr/include/boost/preprocessor/logical/bool.hpp
src/world.o: /usr/include/boost/preprocessor/facilities/empty.hpp
src/world.o: /usr/include/boost/preprocessor/punctuation/comma.hpp
src/world.o: /usr/include/boost/preprocessor/repeat.hpp
src/world.o: /usr/include/boost/preprocessor/repetition/repeat.hpp
src/world.o: /usr/include/boost/preprocessor/debug/error.hpp
src/world.o: /usr/include/boost/preprocessor/detail/auto_rec.hpp
src/world.o: /usr/include/boost/preprocessor/tuple/eat.hpp
src/world.o: /usr/include/boost/preprocessor/inc.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/lambda.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/ttp.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/ctps.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/overload_resolution.hpp
src/world.o: /usr/include/boost/type_traits/integral_constant.hpp
src/world.o: /usr/include/boost/mpl/bool.hpp
src/world.o: /usr/include/boost/mpl/bool_fwd.hpp
src/world.o: /usr/include/boost/mpl/integral_c.hpp
src/world.o: /usr/include/boost/mpl/integral_c_fwd.hpp
src/world.o: /usr/include/boost/mpl/aux_/lambda_support.hpp
src/world.o: /usr/include/boost/mpl/aux_/yes_no.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/arrays.hpp
src/world.o: /usr/include/boost/mpl/aux_/na_fwd.hpp
src/world.o: /usr/include/boost/mpl/aux_/preprocessor/enum.hpp
src/world.o: /usr/include/boost/preprocessor/tuple/to_list.hpp
src/world.o: /usr/include/boost/preprocessor/list/for_each_i.hpp
src/world.o: /usr/include/boost/preprocessor/list/adt.hpp
src/world.o: /usr/include/boost/preprocessor/detail/is_binary.hpp
src/world.o: /usr/include/boost/preprocessor/detail/check.hpp
src/world.o: /usr/include/boost/preprocessor/logical/compl.hpp
src/world.o: /usr/include/boost/preprocessor/repetition/for.hpp
src/world.o: /usr/include/boost/preprocessor/repetition/detail/for.hpp
src/world.o: /usr/include/boost/preprocessor/control/expr_iif.hpp
src/world.o: /usr/include/boost/type_traits/detail/bool_trait_undef.hpp
src/world.o: /usr/include/boost/type_traits/is_pod.hpp
src/world.o: /usr/include/boost/type_traits/is_void.hpp
src/world.o: /usr/include/boost/type_traits/is_scalar.hpp
src/world.o: /usr/include/boost/type_traits/is_arithmetic.hpp
src/world.o: /usr/include/boost/type_traits/is_integral.hpp
src/world.o: /usr/include/boost/type_traits/is_float.hpp
src/world.o: /usr/include/boost/type_traits/detail/ice_or.hpp
src/world.o: /usr/include/boost/type_traits/is_enum.hpp
src/world.o: /usr/include/boost/type_traits/add_reference.hpp
src/world.o: /usr/include/boost/type_traits/is_reference.hpp
src/world.o: /usr/include/boost/type_traits/is_lvalue_reference.hpp
src/world.o: /usr/include/boost/type_traits/is_rvalue_reference.hpp
src/world.o: /usr/include/boost/type_traits/ice.hpp
src/world.o: /usr/include/boost/type_traits/detail/ice_and.hpp
src/world.o: /usr/include/boost/type_traits/detail/ice_not.hpp
src/world.o: /usr/include/boost/type_traits/detail/ice_eq.hpp
src/world.o: /usr/include/boost/type_traits/detail/type_trait_def.hpp
src/world.o: /usr/include/boost/type_traits/detail/type_trait_undef.hpp
src/world.o: /usr/include/boost/type_traits/is_convertible.hpp
src/world.o: /usr/include/boost/type_traits/is_array.hpp
src/world.o: /usr/include/boost/type_traits/is_abstract.hpp
src/world.o: /usr/include/boost/static_assert.hpp
src/world.o: /usr/include/boost/type_traits/is_class.hpp
src/world.o: /usr/include/boost/type_traits/is_union.hpp
src/world.o: /usr/include/boost/type_traits/remove_cv.hpp
src/world.o: /usr/include/boost/type_traits/broken_compiler_spec.hpp
src/world.o: /usr/include/boost/type_traits/add_rvalue_reference.hpp
src/world.o: /usr/include/boost/type_traits/is_function.hpp
src/world.o: /usr/include/boost/type_traits/detail/false_result.hpp
src/world.o: /usr/include/boost/type_traits/detail/is_function_ptr_helper.hpp
src/world.o: /usr/include/boost/type_traits/is_pointer.hpp
src/world.o: /usr/include/boost/type_traits/is_member_pointer.hpp
src/world.o: /usr/include/boost/type_traits/is_member_function_pointer.hpp
src/world.o: /usr/include/boost/type_traits/detail/is_mem_fun_pointer_impl.hpp
src/world.o: /usr/include/boost/type_traits/has_trivial_destructor.hpp
src/world.o: /usr/include/boost/type_traits/is_const.hpp
src/world.o: /usr/include/boost/type_traits/composite_traits.hpp
src/world.o: /usr/include/boost/ref.hpp
src/world.o: /usr/include/boost/utility/addressof.hpp
src/world.o: /usr/include/boost/mpl/if.hpp
src/world.o: /usr/include/boost/mpl/aux_/value_wknd.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/integral.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/eti.hpp
src/world.o: /usr/include/boost/mpl/aux_/na_spec.hpp
src/world.o: /usr/include/boost/mpl/lambda_fwd.hpp
src/world.o: /usr/include/boost/mpl/void_fwd.hpp
src/world.o: /usr/include/boost/mpl/aux_/na.hpp
src/world.o: /usr/include/boost/mpl/aux_/arity.hpp
src/world.o: /usr/include/boost/mpl/aux_/config/dtp.hpp
src/world.o: /usr/include/boost/mpl/aux_/preprocessor/def_params_tail.hpp
src/world.o: /usr/include/boost/mpl/limits/arity.hpp
src/world.o: /usr/include/boost/preprocessor/logical/and.hpp
src/world.o: /usr/include/boost/preprocessor/logical/bitand.hpp
src/world.o: /usr/include/boost/preprocessor/identity.hpp
src/world.o: /usr/include/boost/preprocessor/facilities/identity.hpp
src/world.o: /usr/include/boost/preprocessor/empty.hpp
src/world.o: /usr/include/boost/preprocessor/arithmetic/add.hpp
src/world.o: /usr/include/boost/preprocessor/control/while.hpp
src/world.o: /usr/include/boost/preprocessor/list/fold_left.hpp
src/world.o: /usr/include/boost/preprocessor/list/detail/fold_left.hpp
src/world.o: /usr/include/boost/preprocessor/list/fold_right.hpp
src/world.o: /usr/include/boost/preprocessor/list/detail/fold_right.hpp
src/world.o: /usr/include/boost/preprocessor/list/reverse.hpp
src/world.o: /usr/include/boost/preprocessor/control/detail/while.hpp
src/world.o: /usr/include/boost/preprocessor/arithmetic/sub.hpp
src/world.o: /usr/include/boost/mpl/aux_/lambda_arity_param.hpp
src/world.o: /usr/include/boost/type_traits/alignment_of.hpp
src/world.o: /usr/include/boost/type_traits/detail/size_t_trait_def.hpp
src/world.o: /usr/include/boost/mpl/size_t.hpp
src/world.o: /usr/include/boost/mpl/size_t_fwd.hpp
src/world.o: /usr/include/boost/type_traits/detail/size_t_trait_undef.hpp
src/world.o: /usr/include/boost/utility/enable_if.hpp
src/world.o: /usr/include/boost/function_equal.hpp
src/world.o: /usr/include/boost/function/function_fwd.hpp
src/world.o: /usr/include/boost/mem_fn.hpp /usr/include/boost/bind/mem_fn.hpp
src/world.o: /usr/include/boost/get_pointer.hpp
src/world.o: /usr/include/boost/config/no_tr1/memory.hpp
src/world.o: /usr/include/boost/bind/mem_fn_template.hpp
src/world.o: /usr/include/boost/bind/mem_fn_cc.hpp
src/world.o: /usr/include/boost/preprocessor/enum.hpp
src/world.o: /usr/include/boost/preprocessor/repetition/enum.hpp
src/world.o: /usr/include/boost/preprocessor/enum_params.hpp
src/world.o: /usr/include/boost/preprocessor/repetition/enum_params.hpp
src/world.o: /usr/include/bullet/btBulletDynamicsCommon.h
src/world.o: /usr/include/bullet/btBulletCollisionCommon.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/world.o: /usr/include/bullet/LinearMath/btVector3.h
src/world.o: /usr/include/bullet/LinearMath/btScalar.h /usr/include/math.h
src/world.o: /usr/include/bits/huge_val.h /usr/include/bits/huge_valf.h
src/world.o: /usr/include/bits/huge_vall.h /usr/include/bits/inf.h
src/world.o: /usr/include/bits/nan.h /usr/include/bits/mathdef.h
src/world.o: /usr/include/bits/mathcalls.h
src/world.o: /usr/include/bullet/LinearMath/btMinMax.h
src/world.o: /usr/include/bullet/LinearMath/btTransform.h
src/world.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/world.o: /usr/include/bullet/LinearMath/btVector3.h
src/world.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/world.o: /usr/include/bullet/LinearMath/btQuadWord.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/world.o: /usr/include/bullet/LinearMath/btMotionState.h
src/world.o: /usr/include/bullet/LinearMath/btTransform.h
src/world.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/world.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/world.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDispatcher.h
src/world.o: /usr/include/bullet/LinearMath/btScalar.h
src/world.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btPersistentManifold.h
src/world.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/world.o: /usr/include/bullet/LinearMath/btTransformUtil.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btManifoldResult.h
src/world.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btDiscreteCollisionDetectorInterface.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseInterface.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btPolyhedralConvexShape.h
src/world.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexInternalShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionMargin.h
src/world.o: /usr/include/bullet/LinearMath/btAabbUtil2.h
src/world.o: /usr/include/bullet/LinearMath/btMinMax.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btSphereShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCapsuleShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCylinderShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConeShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStaticPlaneShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConcaveShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleCallback.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexHullShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMesh.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStridingMeshInterface.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btOptimizedBvh.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btQuantizedBvh.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleInfoMap.h
src/world.o: /usr/include/bullet/LinearMath/btHashMap.h
src/world.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/world.o: /usr/include/bullet/LinearMath/btSerializer.h
src/world.o: /usr/include/bullet/LinearMath/btStackAlloc.h
src/world.o: /usr/include/bullet/LinearMath/btHashMap.h /usr/include/memory.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCompoundShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTetrahedronShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btEmptyShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btMultiSphereShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionShapes/btUniformScalingShape.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionConfiguration.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btSimpleBroadphase.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btAxisSweep3.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvt.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/world.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/world.o: /usr/include/bullet/LinearMath/btDefaultMotionState.h
src/world.o: /usr/include/bullet/LinearMath/btMotionState.h
src/world.o: /usr/include/bullet/LinearMath/btQuickprof.h
src/world.o: /usr/include/bullet/LinearMath/btIDebugDraw.h
src/world.o: /usr/include/bullet/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.h
src/world.o: /usr/include/bullet/BulletDynamics/Dynamics/btDynamicsWorld.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactSolverInfo.h
src/world.o: /usr/include/bullet/BulletDynamics/Dynamics/btSimpleDynamicsWorld.h
src/world.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btJacobianEntry.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverBody.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHingeConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConeTwistConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSliderConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btUniversalConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHinge2Constraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConstraintSolver.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactConstraint.h
src/world.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/world.o: /usr/include/bullet/BulletDynamics/Vehicle/btRaycastVehicle.h
src/world.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/world.o: /usr/include/bullet/BulletDynamics/Vehicle/btVehicleRaycaster.h
src/world.o: /usr/include/bullet/BulletDynamics/Vehicle/btWheelInfo.h
src/world.o: /usr/include/bullet/BulletDynamics/Dynamics/btActionInterface.h
src/world.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/world.o: src/bullet_physics.h src/world.h src/object.h src/player.h
src/world.o: /usr/include/bullet/BulletDynamics/Character/btKinematicCharacterController.h
src/world.o: /usr/include/bullet/BulletDynamics/Character/btCharacterControllerInterface.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btGhostObject.h
src/world.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/world.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/world.o: /usr/include/boost/bind.hpp /usr/include/boost/bind/bind.hpp
src/world.o: /usr/include/boost/config.hpp
src/world.o: /usr/include/boost/config/select_compiler_config.hpp
src/world.o: /usr/include/boost/config/compiler/gcc.hpp
src/world.o: /usr/include/boost/config/select_platform_config.hpp
src/world.o: /usr/include/boost/config/suffix.hpp /usr/include/boost/type.hpp
src/world.o: /usr/include/boost/is_placeholder.hpp
src/world.o: /usr/include/boost/bind/arg.hpp
src/world.o: /usr/include/boost/visit_each.hpp
src/world.o: /usr/include/boost/bind/storage.hpp
src/world.o: /usr/include/boost/bind/bind_template.hpp
src/world.o: /usr/include/boost/bind/bind_cc.hpp
src/world.o: /usr/include/boost/bind/bind_mf_cc.hpp
src/world.o: /usr/include/boost/bind/bind_mf2_cc.hpp
src/world.o: /usr/include/boost/bind/placeholders.hpp
src/main.o: /usr/include/time.h /usr/include/bits/types.h
src/main.o: /usr/include/features.h /usr/include/sys/cdefs.h
src/main.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
src/main.o: /usr/include/gnu/stubs-64.h /usr/include/bits/typesizes.h
src/main.o: src/world.h src/gl_graphics.h src/object_gl.h
src/main.o: /usr/include/GL/glew.h /usr/include/stdint.h
src/main.o: /usr/include/bits/wchar.h /usr/include/GL/glu.h
src/main.o: /usr/include/GL/gl.h /usr/include/SDL/SDL.h
src/main.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
src/main.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
src/main.o: /usr/include/stdio.h /usr/include/libio.h
src/main.o: /usr/include/_G_config.h /usr/include/wchar.h
src/main.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
src/main.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
src/main.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
src/main.o: /usr/include/endian.h /usr/include/bits/endian.h
src/main.o: /usr/include/bits/byteswap.h /usr/include/sys/types.h
src/main.o: /usr/include/sys/select.h /usr/include/bits/select.h
src/main.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
src/main.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
src/main.o: /usr/include/alloca.h /usr/include/string.h
src/main.o: /usr/include/inttypes.h /usr/include/ctype.h /usr/include/iconv.h
src/main.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
src/main.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
src/main.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
src/main.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
src/main.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
src/main.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
src/main.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
src/main.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
src/main.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
src/main.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
src/main.o: /usr/include/SDL/SDL_version.h /usr/include/boost/function.hpp
src/main.o: /usr/include/boost/preprocessor/iterate.hpp
src/main.o: /usr/include/boost/preprocessor/iteration/iterate.hpp
src/main.o: /usr/include/boost/preprocessor/arithmetic/dec.hpp
src/main.o: /usr/include/boost/preprocessor/config/config.hpp
src/main.o: /usr/include/boost/preprocessor/arithmetic/inc.hpp
src/main.o: /usr/include/boost/preprocessor/array/elem.hpp
src/main.o: /usr/include/boost/preprocessor/array/data.hpp
src/main.o: /usr/include/boost/preprocessor/tuple/elem.hpp
src/main.o: /usr/include/boost/preprocessor/cat.hpp
src/main.o: /usr/include/boost/preprocessor/facilities/overload.hpp
src/main.o: /usr/include/boost/preprocessor/variadic/size.hpp
src/main.o: /usr/include/boost/preprocessor/tuple/rem.hpp
src/main.o: /usr/include/boost/preprocessor/variadic/elem.hpp
src/main.o: /usr/include/boost/preprocessor/array/size.hpp
src/main.o: /usr/include/boost/preprocessor/slot/slot.hpp
src/main.o: /usr/include/boost/preprocessor/slot/detail/def.hpp
src/main.o: /usr/include/boost/detail/workaround.hpp
src/main.o: /usr/include/boost/config.hpp
src/main.o: /usr/include/boost/function/detail/prologue.hpp
src/main.o: /usr/include/boost/config/no_tr1/functional.hpp
src/main.o: /usr/include/boost/throw_exception.hpp
src/main.o: /usr/include/boost/exception/detail/attribute_noreturn.hpp
src/main.o: /usr/include/boost/function/function_base.hpp
src/main.o: /usr/include/boost/detail/sp_typeinfo.hpp
src/main.o: /usr/include/boost/assert.hpp /usr/include/assert.h
src/main.o: /usr/include/boost/current_function.hpp
src/main.o: /usr/include/boost/integer.hpp /usr/include/boost/integer_fwd.hpp
src/main.o: /usr/include/boost/limits.hpp /usr/include/boost/cstdint.hpp
src/main.o: /usr/include/limits.h /usr/include/bits/posix1_lim.h
src/main.o: /usr/include/bits/local_lim.h /usr/include/linux/limits.h
src/main.o: /usr/include/bits/posix2_lim.h /usr/include/bits/xopen_lim.h
src/main.o: /usr/include/boost/integer_traits.hpp
src/main.o: /usr/include/boost/type_traits/has_trivial_copy.hpp
src/main.o: /usr/include/boost/type_traits/config.hpp
src/main.o: /usr/include/boost/type_traits/intrinsics.hpp
src/main.o: /usr/include/boost/type_traits/is_volatile.hpp
src/main.o: /usr/include/boost/type_traits/detail/cv_traits_impl.hpp
src/main.o: /usr/include/boost/type_traits/detail/yes_no_type.hpp
src/main.o: /usr/include/boost/type_traits/detail/bool_trait_def.hpp
src/main.o: /usr/include/boost/type_traits/detail/template_arity_spec.hpp
src/main.o: /usr/include/boost/mpl/int.hpp /usr/include/boost/mpl/int_fwd.hpp
src/main.o: /usr/include/boost/mpl/aux_/adl_barrier.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/adl.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/msvc.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/intel.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/gcc.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/workaround.hpp
src/main.o: /usr/include/boost/mpl/aux_/nttp_decl.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/nttp.hpp
src/main.o: /usr/include/boost/mpl/aux_/integral_wrapper.hpp
src/main.o: /usr/include/boost/mpl/integral_c_tag.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/static_constant.hpp
src/main.o: /usr/include/boost/mpl/aux_/static_cast.hpp
src/main.o: /usr/include/boost/mpl/aux_/template_arity_fwd.hpp
src/main.o: /usr/include/boost/mpl/aux_/preprocessor/params.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/preprocessor.hpp
src/main.o: /usr/include/boost/preprocessor/comma_if.hpp
src/main.o: /usr/include/boost/preprocessor/punctuation/comma_if.hpp
src/main.o: /usr/include/boost/preprocessor/control/if.hpp
src/main.o: /usr/include/boost/preprocessor/control/iif.hpp
src/main.o: /usr/include/boost/preprocessor/logical/bool.hpp
src/main.o: /usr/include/boost/preprocessor/facilities/empty.hpp
src/main.o: /usr/include/boost/preprocessor/punctuation/comma.hpp
src/main.o: /usr/include/boost/preprocessor/repeat.hpp
src/main.o: /usr/include/boost/preprocessor/repetition/repeat.hpp
src/main.o: /usr/include/boost/preprocessor/debug/error.hpp
src/main.o: /usr/include/boost/preprocessor/detail/auto_rec.hpp
src/main.o: /usr/include/boost/preprocessor/tuple/eat.hpp
src/main.o: /usr/include/boost/preprocessor/inc.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/lambda.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/ttp.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/ctps.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/overload_resolution.hpp
src/main.o: /usr/include/boost/type_traits/integral_constant.hpp
src/main.o: /usr/include/boost/mpl/bool.hpp
src/main.o: /usr/include/boost/mpl/bool_fwd.hpp
src/main.o: /usr/include/boost/mpl/integral_c.hpp
src/main.o: /usr/include/boost/mpl/integral_c_fwd.hpp
src/main.o: /usr/include/boost/mpl/aux_/lambda_support.hpp
src/main.o: /usr/include/boost/mpl/aux_/yes_no.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/arrays.hpp
src/main.o: /usr/include/boost/mpl/aux_/na_fwd.hpp
src/main.o: /usr/include/boost/mpl/aux_/preprocessor/enum.hpp
src/main.o: /usr/include/boost/preprocessor/tuple/to_list.hpp
src/main.o: /usr/include/boost/preprocessor/list/for_each_i.hpp
src/main.o: /usr/include/boost/preprocessor/list/adt.hpp
src/main.o: /usr/include/boost/preprocessor/detail/is_binary.hpp
src/main.o: /usr/include/boost/preprocessor/detail/check.hpp
src/main.o: /usr/include/boost/preprocessor/logical/compl.hpp
src/main.o: /usr/include/boost/preprocessor/repetition/for.hpp
src/main.o: /usr/include/boost/preprocessor/repetition/detail/for.hpp
src/main.o: /usr/include/boost/preprocessor/control/expr_iif.hpp
src/main.o: /usr/include/boost/type_traits/detail/bool_trait_undef.hpp
src/main.o: /usr/include/boost/type_traits/is_pod.hpp
src/main.o: /usr/include/boost/type_traits/is_void.hpp
src/main.o: /usr/include/boost/type_traits/is_scalar.hpp
src/main.o: /usr/include/boost/type_traits/is_arithmetic.hpp
src/main.o: /usr/include/boost/type_traits/is_integral.hpp
src/main.o: /usr/include/boost/type_traits/is_float.hpp
src/main.o: /usr/include/boost/type_traits/detail/ice_or.hpp
src/main.o: /usr/include/boost/type_traits/is_enum.hpp
src/main.o: /usr/include/boost/type_traits/add_reference.hpp
src/main.o: /usr/include/boost/type_traits/is_reference.hpp
src/main.o: /usr/include/boost/type_traits/is_lvalue_reference.hpp
src/main.o: /usr/include/boost/type_traits/is_rvalue_reference.hpp
src/main.o: /usr/include/boost/type_traits/ice.hpp
src/main.o: /usr/include/boost/type_traits/detail/ice_and.hpp
src/main.o: /usr/include/boost/type_traits/detail/ice_not.hpp
src/main.o: /usr/include/boost/type_traits/detail/ice_eq.hpp
src/main.o: /usr/include/boost/type_traits/detail/type_trait_def.hpp
src/main.o: /usr/include/boost/type_traits/detail/type_trait_undef.hpp
src/main.o: /usr/include/boost/type_traits/is_convertible.hpp
src/main.o: /usr/include/boost/type_traits/is_array.hpp
src/main.o: /usr/include/boost/type_traits/is_abstract.hpp
src/main.o: /usr/include/boost/static_assert.hpp
src/main.o: /usr/include/boost/type_traits/is_class.hpp
src/main.o: /usr/include/boost/type_traits/is_union.hpp
src/main.o: /usr/include/boost/type_traits/remove_cv.hpp
src/main.o: /usr/include/boost/type_traits/broken_compiler_spec.hpp
src/main.o: /usr/include/boost/type_traits/add_rvalue_reference.hpp
src/main.o: /usr/include/boost/type_traits/is_function.hpp
src/main.o: /usr/include/boost/type_traits/detail/false_result.hpp
src/main.o: /usr/include/boost/type_traits/detail/is_function_ptr_helper.hpp
src/main.o: /usr/include/boost/type_traits/is_pointer.hpp
src/main.o: /usr/include/boost/type_traits/is_member_pointer.hpp
src/main.o: /usr/include/boost/type_traits/is_member_function_pointer.hpp
src/main.o: /usr/include/boost/type_traits/detail/is_mem_fun_pointer_impl.hpp
src/main.o: /usr/include/boost/type_traits/has_trivial_destructor.hpp
src/main.o: /usr/include/boost/type_traits/is_const.hpp
src/main.o: /usr/include/boost/type_traits/composite_traits.hpp
src/main.o: /usr/include/boost/ref.hpp
src/main.o: /usr/include/boost/utility/addressof.hpp
src/main.o: /usr/include/boost/mpl/if.hpp
src/main.o: /usr/include/boost/mpl/aux_/value_wknd.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/integral.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/eti.hpp
src/main.o: /usr/include/boost/mpl/aux_/na_spec.hpp
src/main.o: /usr/include/boost/mpl/lambda_fwd.hpp
src/main.o: /usr/include/boost/mpl/void_fwd.hpp
src/main.o: /usr/include/boost/mpl/aux_/na.hpp
src/main.o: /usr/include/boost/mpl/aux_/arity.hpp
src/main.o: /usr/include/boost/mpl/aux_/config/dtp.hpp
src/main.o: /usr/include/boost/mpl/aux_/preprocessor/def_params_tail.hpp
src/main.o: /usr/include/boost/mpl/limits/arity.hpp
src/main.o: /usr/include/boost/preprocessor/logical/and.hpp
src/main.o: /usr/include/boost/preprocessor/logical/bitand.hpp
src/main.o: /usr/include/boost/preprocessor/identity.hpp
src/main.o: /usr/include/boost/preprocessor/facilities/identity.hpp
src/main.o: /usr/include/boost/preprocessor/empty.hpp
src/main.o: /usr/include/boost/preprocessor/arithmetic/add.hpp
src/main.o: /usr/include/boost/preprocessor/control/while.hpp
src/main.o: /usr/include/boost/preprocessor/list/fold_left.hpp
src/main.o: /usr/include/boost/preprocessor/list/detail/fold_left.hpp
src/main.o: /usr/include/boost/preprocessor/list/fold_right.hpp
src/main.o: /usr/include/boost/preprocessor/list/detail/fold_right.hpp
src/main.o: /usr/include/boost/preprocessor/list/reverse.hpp
src/main.o: /usr/include/boost/preprocessor/control/detail/while.hpp
src/main.o: /usr/include/boost/preprocessor/arithmetic/sub.hpp
src/main.o: /usr/include/boost/mpl/aux_/lambda_arity_param.hpp
src/main.o: /usr/include/boost/type_traits/alignment_of.hpp
src/main.o: /usr/include/boost/type_traits/detail/size_t_trait_def.hpp
src/main.o: /usr/include/boost/mpl/size_t.hpp
src/main.o: /usr/include/boost/mpl/size_t_fwd.hpp
src/main.o: /usr/include/boost/type_traits/detail/size_t_trait_undef.hpp
src/main.o: /usr/include/boost/utility/enable_if.hpp
src/main.o: /usr/include/boost/function_equal.hpp
src/main.o: /usr/include/boost/function/function_fwd.hpp
src/main.o: /usr/include/boost/mem_fn.hpp /usr/include/boost/bind/mem_fn.hpp
src/main.o: /usr/include/boost/get_pointer.hpp
src/main.o: /usr/include/boost/config/no_tr1/memory.hpp
src/main.o: /usr/include/boost/bind/mem_fn_template.hpp
src/main.o: /usr/include/boost/bind/mem_fn_cc.hpp
src/main.o: /usr/include/boost/preprocessor/enum.hpp
src/main.o: /usr/include/boost/preprocessor/repetition/enum.hpp
src/main.o: /usr/include/boost/preprocessor/enum_params.hpp
src/main.o: /usr/include/boost/preprocessor/repetition/enum_params.hpp
src/main.o: /usr/include/bullet/btBulletDynamicsCommon.h
src/main.o: /usr/include/bullet/btBulletCollisionCommon.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/main.o: /usr/include/bullet/LinearMath/btVector3.h
src/main.o: /usr/include/bullet/LinearMath/btScalar.h /usr/include/math.h
src/main.o: /usr/include/bits/huge_val.h /usr/include/bits/huge_valf.h
src/main.o: /usr/include/bits/huge_vall.h /usr/include/bits/inf.h
src/main.o: /usr/include/bits/nan.h /usr/include/bits/mathdef.h
src/main.o: /usr/include/bits/mathcalls.h
src/main.o: /usr/include/bullet/LinearMath/btMinMax.h
src/main.o: /usr/include/bullet/LinearMath/btTransform.h
src/main.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/main.o: /usr/include/bullet/LinearMath/btVector3.h
src/main.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/main.o: /usr/include/bullet/LinearMath/btQuadWord.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/main.o: /usr/include/bullet/LinearMath/btMotionState.h
src/main.o: /usr/include/bullet/LinearMath/btTransform.h
src/main.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/main.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/main.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDispatcher.h
src/main.o: /usr/include/bullet/LinearMath/btScalar.h
src/main.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btPersistentManifold.h
src/main.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/main.o: /usr/include/bullet/LinearMath/btTransformUtil.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btManifoldResult.h
src/main.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btDiscreteCollisionDetectorInterface.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseInterface.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btPolyhedralConvexShape.h
src/main.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexInternalShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionMargin.h
src/main.o: /usr/include/bullet/LinearMath/btAabbUtil2.h
src/main.o: /usr/include/bullet/LinearMath/btMinMax.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btSphereShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCapsuleShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCylinderShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConeShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStaticPlaneShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConcaveShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleCallback.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexHullShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMesh.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStridingMeshInterface.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btOptimizedBvh.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btQuantizedBvh.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleInfoMap.h
src/main.o: /usr/include/bullet/LinearMath/btHashMap.h
src/main.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/main.o: /usr/include/bullet/LinearMath/btSerializer.h
src/main.o: /usr/include/bullet/LinearMath/btStackAlloc.h
src/main.o: /usr/include/bullet/LinearMath/btHashMap.h /usr/include/memory.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCompoundShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTetrahedronShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btEmptyShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btMultiSphereShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionShapes/btUniformScalingShape.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionConfiguration.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btSimpleBroadphase.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btAxisSweep3.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvt.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/main.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/main.o: /usr/include/bullet/LinearMath/btDefaultMotionState.h
src/main.o: /usr/include/bullet/LinearMath/btMotionState.h
src/main.o: /usr/include/bullet/LinearMath/btQuickprof.h
src/main.o: /usr/include/bullet/LinearMath/btIDebugDraw.h
src/main.o: /usr/include/bullet/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.h
src/main.o: /usr/include/bullet/BulletDynamics/Dynamics/btDynamicsWorld.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactSolverInfo.h
src/main.o: /usr/include/bullet/BulletDynamics/Dynamics/btSimpleDynamicsWorld.h
src/main.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btJacobianEntry.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverBody.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHingeConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConeTwistConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSliderConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btUniversalConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHinge2Constraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConstraintSolver.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactConstraint.h
src/main.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/main.o: /usr/include/bullet/BulletDynamics/Vehicle/btRaycastVehicle.h
src/main.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/main.o: /usr/include/bullet/BulletDynamics/Vehicle/btVehicleRaycaster.h
src/main.o: /usr/include/bullet/BulletDynamics/Vehicle/btWheelInfo.h
src/main.o: /usr/include/bullet/BulletDynamics/Dynamics/btActionInterface.h
src/main.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/main.o: src/bullet_physics.h src/object.h src/player.h
src/main.o: /usr/include/bullet/BulletDynamics/Character/btKinematicCharacterController.h
src/main.o: /usr/include/bullet/BulletDynamics/Character/btCharacterControllerInterface.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btGhostObject.h
src/main.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/main.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/main.o: src/shapes.h
src/shapes.o: /usr/include/math.h /usr/include/features.h
src/shapes.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/shapes.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
src/shapes.o: /usr/include/bits/huge_val.h /usr/include/bits/huge_valf.h
src/shapes.o: /usr/include/bits/huge_vall.h /usr/include/bits/inf.h
src/shapes.o: /usr/include/bits/nan.h /usr/include/bits/mathdef.h
src/shapes.o: /usr/include/bits/mathcalls.h src/simpleShape.h src/object_gl.h
src/shapes.o: /usr/include/GL/glew.h /usr/include/stdint.h
src/shapes.o: /usr/include/bits/wchar.h /usr/include/GL/glu.h
src/shapes.o: /usr/include/GL/gl.h src/object.h
src/shapes.o: /usr/include/bullet/btBulletDynamicsCommon.h
src/shapes.o: /usr/include/bullet/btBulletCollisionCommon.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/shapes.o: /usr/include/bullet/LinearMath/btVector3.h
src/shapes.o: /usr/include/bullet/LinearMath/btScalar.h /usr/include/stdlib.h
src/shapes.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
src/shapes.o: /usr/include/endian.h /usr/include/bits/endian.h
src/shapes.o: /usr/include/bits/byteswap.h /usr/include/xlocale.h
src/shapes.o: /usr/include/sys/types.h /usr/include/bits/types.h
src/shapes.o: /usr/include/bits/typesizes.h /usr/include/time.h
src/shapes.o: /usr/include/sys/select.h /usr/include/bits/select.h
src/shapes.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
src/shapes.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
src/shapes.o: /usr/include/alloca.h /usr/include/assert.h
src/shapes.o: /usr/include/bullet/LinearMath/btMinMax.h
src/shapes.o: /usr/include/bullet/LinearMath/btTransform.h
src/shapes.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/shapes.o: /usr/include/bullet/LinearMath/btVector3.h
src/shapes.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/shapes.o: /usr/include/bullet/LinearMath/btQuadWord.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/shapes.o: /usr/include/bullet/LinearMath/btMotionState.h
src/shapes.o: /usr/include/bullet/LinearMath/btTransform.h
src/shapes.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/shapes.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/shapes.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDispatcher.h
src/shapes.o: /usr/include/bullet/LinearMath/btScalar.h
src/shapes.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btPersistentManifold.h
src/shapes.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/shapes.o: /usr/include/bullet/LinearMath/btTransformUtil.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btManifoldResult.h
src/shapes.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btDiscreteCollisionDetectorInterface.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseInterface.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btPolyhedralConvexShape.h
src/shapes.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexInternalShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionMargin.h
src/shapes.o: /usr/include/bullet/LinearMath/btAabbUtil2.h
src/shapes.o: /usr/include/bullet/LinearMath/btMinMax.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btSphereShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCapsuleShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCylinderShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConeShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStaticPlaneShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConcaveShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleCallback.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexHullShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMesh.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStridingMeshInterface.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btOptimizedBvh.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btQuantizedBvh.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleInfoMap.h
src/shapes.o: /usr/include/bullet/LinearMath/btHashMap.h
src/shapes.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/shapes.o: /usr/include/bullet/LinearMath/btSerializer.h
src/shapes.o: /usr/include/bullet/LinearMath/btStackAlloc.h
src/shapes.o: /usr/include/bullet/LinearMath/btHashMap.h
src/shapes.o: /usr/include/memory.h /usr/include/string.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCompoundShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTetrahedronShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btEmptyShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btMultiSphereShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionShapes/btUniformScalingShape.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionConfiguration.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btSimpleBroadphase.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btAxisSweep3.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvt.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/shapes.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/shapes.o: /usr/include/bullet/LinearMath/btDefaultMotionState.h
src/shapes.o: /usr/include/bullet/LinearMath/btMotionState.h
src/shapes.o: /usr/include/bullet/LinearMath/btQuickprof.h
src/shapes.o: /usr/include/stdio.h /usr/include/libio.h
src/shapes.o: /usr/include/_G_config.h /usr/include/wchar.h
src/shapes.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/shapes.o: /usr/include/bullet/LinearMath/btIDebugDraw.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Dynamics/btDynamicsWorld.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactSolverInfo.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Dynamics/btSimpleDynamicsWorld.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btJacobianEntry.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverBody.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHingeConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConeTwistConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSliderConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btUniversalConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHinge2Constraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConstraintSolver.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactConstraint.h
src/shapes.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Vehicle/btRaycastVehicle.h
src/shapes.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Vehicle/btVehicleRaycaster.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Vehicle/btWheelInfo.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Dynamics/btActionInterface.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/shapes.o: src/world.h src/gl_graphics.h /usr/include/SDL/SDL.h
src/shapes.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
src/shapes.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
src/shapes.o: /usr/include/inttypes.h /usr/include/ctype.h
src/shapes.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
src/shapes.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
src/shapes.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
src/shapes.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
src/shapes.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
src/shapes.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
src/shapes.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
src/shapes.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
src/shapes.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
src/shapes.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
src/shapes.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
src/shapes.o: /usr/include/boost/function.hpp
src/shapes.o: /usr/include/boost/preprocessor/iterate.hpp
src/shapes.o: /usr/include/boost/preprocessor/iteration/iterate.hpp
src/shapes.o: /usr/include/boost/preprocessor/arithmetic/dec.hpp
src/shapes.o: /usr/include/boost/preprocessor/config/config.hpp
src/shapes.o: /usr/include/boost/preprocessor/arithmetic/inc.hpp
src/shapes.o: /usr/include/boost/preprocessor/array/elem.hpp
src/shapes.o: /usr/include/boost/preprocessor/array/data.hpp
src/shapes.o: /usr/include/boost/preprocessor/tuple/elem.hpp
src/shapes.o: /usr/include/boost/preprocessor/cat.hpp
src/shapes.o: /usr/include/boost/preprocessor/facilities/overload.hpp
src/shapes.o: /usr/include/boost/preprocessor/variadic/size.hpp
src/shapes.o: /usr/include/boost/preprocessor/tuple/rem.hpp
src/shapes.o: /usr/include/boost/preprocessor/variadic/elem.hpp
src/shapes.o: /usr/include/boost/preprocessor/array/size.hpp
src/shapes.o: /usr/include/boost/preprocessor/slot/slot.hpp
src/shapes.o: /usr/include/boost/preprocessor/slot/detail/def.hpp
src/shapes.o: /usr/include/boost/detail/workaround.hpp
src/shapes.o: /usr/include/boost/config.hpp
src/shapes.o: /usr/include/boost/function/detail/prologue.hpp
src/shapes.o: /usr/include/boost/config/no_tr1/functional.hpp
src/shapes.o: /usr/include/boost/throw_exception.hpp
src/shapes.o: /usr/include/boost/exception/detail/attribute_noreturn.hpp
src/shapes.o: /usr/include/boost/function/function_base.hpp
src/shapes.o: /usr/include/boost/detail/sp_typeinfo.hpp
src/shapes.o: /usr/include/boost/assert.hpp
src/shapes.o: /usr/include/boost/current_function.hpp
src/shapes.o: /usr/include/boost/integer.hpp
src/shapes.o: /usr/include/boost/integer_fwd.hpp
src/shapes.o: /usr/include/boost/limits.hpp /usr/include/boost/cstdint.hpp
src/shapes.o: /usr/include/limits.h /usr/include/bits/posix1_lim.h
src/shapes.o: /usr/include/bits/local_lim.h /usr/include/linux/limits.h
src/shapes.o: /usr/include/bits/posix2_lim.h /usr/include/bits/xopen_lim.h
src/shapes.o: /usr/include/boost/integer_traits.hpp
src/shapes.o: /usr/include/boost/type_traits/has_trivial_copy.hpp
src/shapes.o: /usr/include/boost/type_traits/config.hpp
src/shapes.o: /usr/include/boost/type_traits/intrinsics.hpp
src/shapes.o: /usr/include/boost/type_traits/is_volatile.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/cv_traits_impl.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/yes_no_type.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/bool_trait_def.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/template_arity_spec.hpp
src/shapes.o: /usr/include/boost/mpl/int.hpp
src/shapes.o: /usr/include/boost/mpl/int_fwd.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/adl_barrier.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/adl.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/msvc.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/intel.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/gcc.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/workaround.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/nttp_decl.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/nttp.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/integral_wrapper.hpp
src/shapes.o: /usr/include/boost/mpl/integral_c_tag.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/static_constant.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/static_cast.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/template_arity_fwd.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/preprocessor/params.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/preprocessor.hpp
src/shapes.o: /usr/include/boost/preprocessor/comma_if.hpp
src/shapes.o: /usr/include/boost/preprocessor/punctuation/comma_if.hpp
src/shapes.o: /usr/include/boost/preprocessor/control/if.hpp
src/shapes.o: /usr/include/boost/preprocessor/control/iif.hpp
src/shapes.o: /usr/include/boost/preprocessor/logical/bool.hpp
src/shapes.o: /usr/include/boost/preprocessor/facilities/empty.hpp
src/shapes.o: /usr/include/boost/preprocessor/punctuation/comma.hpp
src/shapes.o: /usr/include/boost/preprocessor/repeat.hpp
src/shapes.o: /usr/include/boost/preprocessor/repetition/repeat.hpp
src/shapes.o: /usr/include/boost/preprocessor/debug/error.hpp
src/shapes.o: /usr/include/boost/preprocessor/detail/auto_rec.hpp
src/shapes.o: /usr/include/boost/preprocessor/tuple/eat.hpp
src/shapes.o: /usr/include/boost/preprocessor/inc.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/lambda.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/ttp.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/ctps.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/overload_resolution.hpp
src/shapes.o: /usr/include/boost/type_traits/integral_constant.hpp
src/shapes.o: /usr/include/boost/mpl/bool.hpp
src/shapes.o: /usr/include/boost/mpl/bool_fwd.hpp
src/shapes.o: /usr/include/boost/mpl/integral_c.hpp
src/shapes.o: /usr/include/boost/mpl/integral_c_fwd.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/lambda_support.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/yes_no.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/arrays.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/na_fwd.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/preprocessor/enum.hpp
src/shapes.o: /usr/include/boost/preprocessor/tuple/to_list.hpp
src/shapes.o: /usr/include/boost/preprocessor/list/for_each_i.hpp
src/shapes.o: /usr/include/boost/preprocessor/list/adt.hpp
src/shapes.o: /usr/include/boost/preprocessor/detail/is_binary.hpp
src/shapes.o: /usr/include/boost/preprocessor/detail/check.hpp
src/shapes.o: /usr/include/boost/preprocessor/logical/compl.hpp
src/shapes.o: /usr/include/boost/preprocessor/repetition/for.hpp
src/shapes.o: /usr/include/boost/preprocessor/repetition/detail/for.hpp
src/shapes.o: /usr/include/boost/preprocessor/control/expr_iif.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/bool_trait_undef.hpp
src/shapes.o: /usr/include/boost/type_traits/is_pod.hpp
src/shapes.o: /usr/include/boost/type_traits/is_void.hpp
src/shapes.o: /usr/include/boost/type_traits/is_scalar.hpp
src/shapes.o: /usr/include/boost/type_traits/is_arithmetic.hpp
src/shapes.o: /usr/include/boost/type_traits/is_integral.hpp
src/shapes.o: /usr/include/boost/type_traits/is_float.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/ice_or.hpp
src/shapes.o: /usr/include/boost/type_traits/is_enum.hpp
src/shapes.o: /usr/include/boost/type_traits/add_reference.hpp
src/shapes.o: /usr/include/boost/type_traits/is_reference.hpp
src/shapes.o: /usr/include/boost/type_traits/is_lvalue_reference.hpp
src/shapes.o: /usr/include/boost/type_traits/is_rvalue_reference.hpp
src/shapes.o: /usr/include/boost/type_traits/ice.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/ice_and.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/ice_not.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/ice_eq.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/type_trait_def.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/type_trait_undef.hpp
src/shapes.o: /usr/include/boost/type_traits/is_convertible.hpp
src/shapes.o: /usr/include/boost/type_traits/is_array.hpp
src/shapes.o: /usr/include/boost/type_traits/is_abstract.hpp
src/shapes.o: /usr/include/boost/static_assert.hpp
src/shapes.o: /usr/include/boost/type_traits/is_class.hpp
src/shapes.o: /usr/include/boost/type_traits/is_union.hpp
src/shapes.o: /usr/include/boost/type_traits/remove_cv.hpp
src/shapes.o: /usr/include/boost/type_traits/broken_compiler_spec.hpp
src/shapes.o: /usr/include/boost/type_traits/add_rvalue_reference.hpp
src/shapes.o: /usr/include/boost/type_traits/is_function.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/false_result.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/is_function_ptr_helper.hpp
src/shapes.o: /usr/include/boost/type_traits/is_pointer.hpp
src/shapes.o: /usr/include/boost/type_traits/is_member_pointer.hpp
src/shapes.o: /usr/include/boost/type_traits/is_member_function_pointer.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/is_mem_fun_pointer_impl.hpp
src/shapes.o: /usr/include/boost/type_traits/has_trivial_destructor.hpp
src/shapes.o: /usr/include/boost/type_traits/is_const.hpp
src/shapes.o: /usr/include/boost/type_traits/composite_traits.hpp
src/shapes.o: /usr/include/boost/ref.hpp
src/shapes.o: /usr/include/boost/utility/addressof.hpp
src/shapes.o: /usr/include/boost/mpl/if.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/value_wknd.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/integral.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/eti.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/na_spec.hpp
src/shapes.o: /usr/include/boost/mpl/lambda_fwd.hpp
src/shapes.o: /usr/include/boost/mpl/void_fwd.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/na.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/arity.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/config/dtp.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/preprocessor/def_params_tail.hpp
src/shapes.o: /usr/include/boost/mpl/limits/arity.hpp
src/shapes.o: /usr/include/boost/preprocessor/logical/and.hpp
src/shapes.o: /usr/include/boost/preprocessor/logical/bitand.hpp
src/shapes.o: /usr/include/boost/preprocessor/identity.hpp
src/shapes.o: /usr/include/boost/preprocessor/facilities/identity.hpp
src/shapes.o: /usr/include/boost/preprocessor/empty.hpp
src/shapes.o: /usr/include/boost/preprocessor/arithmetic/add.hpp
src/shapes.o: /usr/include/boost/preprocessor/control/while.hpp
src/shapes.o: /usr/include/boost/preprocessor/list/fold_left.hpp
src/shapes.o: /usr/include/boost/preprocessor/list/detail/fold_left.hpp
src/shapes.o: /usr/include/boost/preprocessor/list/fold_right.hpp
src/shapes.o: /usr/include/boost/preprocessor/list/detail/fold_right.hpp
src/shapes.o: /usr/include/boost/preprocessor/list/reverse.hpp
src/shapes.o: /usr/include/boost/preprocessor/control/detail/while.hpp
src/shapes.o: /usr/include/boost/preprocessor/arithmetic/sub.hpp
src/shapes.o: /usr/include/boost/mpl/aux_/lambda_arity_param.hpp
src/shapes.o: /usr/include/boost/type_traits/alignment_of.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/size_t_trait_def.hpp
src/shapes.o: /usr/include/boost/mpl/size_t.hpp
src/shapes.o: /usr/include/boost/mpl/size_t_fwd.hpp
src/shapes.o: /usr/include/boost/type_traits/detail/size_t_trait_undef.hpp
src/shapes.o: /usr/include/boost/utility/enable_if.hpp
src/shapes.o: /usr/include/boost/function_equal.hpp
src/shapes.o: /usr/include/boost/function/function_fwd.hpp
src/shapes.o: /usr/include/boost/mem_fn.hpp
src/shapes.o: /usr/include/boost/bind/mem_fn.hpp
src/shapes.o: /usr/include/boost/get_pointer.hpp
src/shapes.o: /usr/include/boost/config/no_tr1/memory.hpp
src/shapes.o: /usr/include/boost/bind/mem_fn_template.hpp
src/shapes.o: /usr/include/boost/bind/mem_fn_cc.hpp
src/shapes.o: /usr/include/boost/preprocessor/enum.hpp
src/shapes.o: /usr/include/boost/preprocessor/repetition/enum.hpp
src/shapes.o: /usr/include/boost/preprocessor/enum_params.hpp
src/shapes.o: /usr/include/boost/preprocessor/repetition/enum_params.hpp
src/shapes.o: src/bullet_physics.h src/player.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Character/btKinematicCharacterController.h
src/shapes.o: /usr/include/bullet/BulletDynamics/Character/btCharacterControllerInterface.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btGhostObject.h
src/shapes.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/shapes.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/object.o: src/object_gl.h /usr/include/GL/glew.h /usr/include/stdint.h
src/object.o: /usr/include/features.h /usr/include/sys/cdefs.h
src/object.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
src/object.o: /usr/include/gnu/stubs-64.h /usr/include/bits/wchar.h
src/object.o: /usr/include/GL/glu.h /usr/include/GL/gl.h src/object.h
src/object.o: /usr/include/bullet/btBulletDynamicsCommon.h
src/object.o: /usr/include/bullet/btBulletCollisionCommon.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
src/object.o: /usr/include/bullet/LinearMath/btVector3.h
src/object.o: /usr/include/bullet/LinearMath/btScalar.h /usr/include/math.h
src/object.o: /usr/include/bits/huge_val.h /usr/include/bits/huge_valf.h
src/object.o: /usr/include/bits/huge_vall.h /usr/include/bits/inf.h
src/object.o: /usr/include/bits/nan.h /usr/include/bits/mathdef.h
src/object.o: /usr/include/bits/mathcalls.h /usr/include/stdlib.h
src/object.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
src/object.o: /usr/include/endian.h /usr/include/bits/endian.h
src/object.o: /usr/include/bits/byteswap.h /usr/include/xlocale.h
src/object.o: /usr/include/sys/types.h /usr/include/bits/types.h
src/object.o: /usr/include/bits/typesizes.h /usr/include/time.h
src/object.o: /usr/include/sys/select.h /usr/include/bits/select.h
src/object.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
src/object.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
src/object.o: /usr/include/alloca.h /usr/include/assert.h
src/object.o: /usr/include/bullet/LinearMath/btMinMax.h
src/object.o: /usr/include/bullet/LinearMath/btTransform.h
src/object.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/object.o: /usr/include/bullet/LinearMath/btVector3.h
src/object.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/object.o: /usr/include/bullet/LinearMath/btQuadWord.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/object.o: /usr/include/bullet/LinearMath/btMotionState.h
src/object.o: /usr/include/bullet/LinearMath/btTransform.h
src/object.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/object.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/object.o: /usr/include/bullet/LinearMath/btAlignedAllocator.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDispatcher.h
src/object.o: /usr/include/bullet/LinearMath/btScalar.h
src/object.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btPersistentManifold.h
src/object.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/object.o: /usr/include/bullet/LinearMath/btTransformUtil.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btManifoldResult.h
src/object.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btDiscreteCollisionDetectorInterface.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseInterface.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btBroadphaseProxy.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionObject.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btPolyhedralConvexShape.h
src/object.o: /usr/include/bullet/LinearMath/btMatrix3x3.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexInternalShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCollisionMargin.h
src/object.o: /usr/include/bullet/LinearMath/btAabbUtil2.h
src/object.o: /usr/include/bullet/LinearMath/btMinMax.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btSphereShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCapsuleShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCylinderShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBoxShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConeShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStaticPlaneShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConcaveShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleCallback.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexHullShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMesh.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btStridingMeshInterface.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btOptimizedBvh.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btQuantizedBvh.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleInfoMap.h
src/object.o: /usr/include/bullet/LinearMath/btHashMap.h
src/object.o: /usr/include/bullet/LinearMath/btAlignedObjectArray.h
src/object.o: /usr/include/bullet/LinearMath/btSerializer.h
src/object.o: /usr/include/bullet/LinearMath/btStackAlloc.h
src/object.o: /usr/include/bullet/LinearMath/btHashMap.h
src/object.o: /usr/include/memory.h /usr/include/string.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btScaledBvhTriangleMeshShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleMeshShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btCompoundShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btTetrahedronShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btEmptyShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btMultiSphereShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionShapes/btUniformScalingShape.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btActivatingCollisionAlgorithm.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionCreateFunc.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btDefaultCollisionConfiguration.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionConfiguration.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionDispatcher.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btSimpleBroadphase.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCache.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btAxisSweep3.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvt.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btMultiSapBroadphase.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btDbvtBroadphase.h
src/object.o: /usr/include/bullet/LinearMath/btQuaternion.h
src/object.o: /usr/include/bullet/LinearMath/btDefaultMotionState.h
src/object.o: /usr/include/bullet/LinearMath/btMotionState.h
src/object.o: /usr/include/bullet/LinearMath/btQuickprof.h
src/object.o: /usr/include/stdio.h /usr/include/libio.h
src/object.o: /usr/include/_G_config.h /usr/include/wchar.h
src/object.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/object.o: /usr/include/bullet/LinearMath/btIDebugDraw.h
src/object.o: /usr/include/bullet/BulletDynamics/Dynamics/btDiscreteDynamicsWorld.h
src/object.o: /usr/include/bullet/BulletDynamics/Dynamics/btDynamicsWorld.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactSolverInfo.h
src/object.o: /usr/include/bullet/BulletDynamics/Dynamics/btSimpleDynamicsWorld.h
src/object.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btPoint2PointConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btJacobianEntry.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSolverBody.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHingeConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConeTwistConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSliderConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btUniversalConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btHinge2Constraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btSequentialImpulseConstraintSolver.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btConstraintSolver.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btContactConstraint.h
src/object.o: /usr/include/bullet/BulletCollision/NarrowPhaseCollision/btManifoldPoint.h
src/object.o: /usr/include/bullet/BulletDynamics/Vehicle/btRaycastVehicle.h
src/object.o: /usr/include/bullet/BulletDynamics/ConstraintSolver/btTypedConstraint.h
src/object.o: /usr/include/bullet/BulletDynamics/Vehicle/btVehicleRaycaster.h
src/object.o: /usr/include/bullet/BulletDynamics/Vehicle/btWheelInfo.h
src/object.o: /usr/include/bullet/BulletDynamics/Dynamics/btActionInterface.h
src/object.o: /usr/include/bullet/BulletDynamics/Dynamics/btRigidBody.h
src/object.o: src/world.h src/gl_graphics.h /usr/include/SDL/SDL.h
src/object.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
src/object.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
src/object.o: /usr/include/inttypes.h /usr/include/ctype.h
src/object.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
src/object.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
src/object.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
src/object.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
src/object.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
src/object.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
src/object.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
src/object.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
src/object.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
src/object.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
src/object.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
src/object.o: /usr/include/boost/function.hpp
src/object.o: /usr/include/boost/preprocessor/iterate.hpp
src/object.o: /usr/include/boost/preprocessor/iteration/iterate.hpp
src/object.o: /usr/include/boost/preprocessor/arithmetic/dec.hpp
src/object.o: /usr/include/boost/preprocessor/config/config.hpp
src/object.o: /usr/include/boost/preprocessor/arithmetic/inc.hpp
src/object.o: /usr/include/boost/preprocessor/array/elem.hpp
src/object.o: /usr/include/boost/preprocessor/array/data.hpp
src/object.o: /usr/include/boost/preprocessor/tuple/elem.hpp
src/object.o: /usr/include/boost/preprocessor/cat.hpp
src/object.o: /usr/include/boost/preprocessor/facilities/overload.hpp
src/object.o: /usr/include/boost/preprocessor/variadic/size.hpp
src/object.o: /usr/include/boost/preprocessor/tuple/rem.hpp
src/object.o: /usr/include/boost/preprocessor/variadic/elem.hpp
src/object.o: /usr/include/boost/preprocessor/array/size.hpp
src/object.o: /usr/include/boost/preprocessor/slot/slot.hpp
src/object.o: /usr/include/boost/preprocessor/slot/detail/def.hpp
src/object.o: /usr/include/boost/detail/workaround.hpp
src/object.o: /usr/include/boost/config.hpp
src/object.o: /usr/include/boost/function/detail/prologue.hpp
src/object.o: /usr/include/boost/config/no_tr1/functional.hpp
src/object.o: /usr/include/boost/throw_exception.hpp
src/object.o: /usr/include/boost/exception/detail/attribute_noreturn.hpp
src/object.o: /usr/include/boost/function/function_base.hpp
src/object.o: /usr/include/boost/detail/sp_typeinfo.hpp
src/object.o: /usr/include/boost/assert.hpp
src/object.o: /usr/include/boost/current_function.hpp
src/object.o: /usr/include/boost/integer.hpp
src/object.o: /usr/include/boost/integer_fwd.hpp
src/object.o: /usr/include/boost/limits.hpp /usr/include/boost/cstdint.hpp
src/object.o: /usr/include/limits.h /usr/include/bits/posix1_lim.h
src/object.o: /usr/include/bits/local_lim.h /usr/include/linux/limits.h
src/object.o: /usr/include/bits/posix2_lim.h /usr/include/bits/xopen_lim.h
src/object.o: /usr/include/boost/integer_traits.hpp
src/object.o: /usr/include/boost/type_traits/has_trivial_copy.hpp
src/object.o: /usr/include/boost/type_traits/config.hpp
src/object.o: /usr/include/boost/type_traits/intrinsics.hpp
src/object.o: /usr/include/boost/type_traits/is_volatile.hpp
src/object.o: /usr/include/boost/type_traits/detail/cv_traits_impl.hpp
src/object.o: /usr/include/boost/type_traits/detail/yes_no_type.hpp
src/object.o: /usr/include/boost/type_traits/detail/bool_trait_def.hpp
src/object.o: /usr/include/boost/type_traits/detail/template_arity_spec.hpp
src/object.o: /usr/include/boost/mpl/int.hpp
src/object.o: /usr/include/boost/mpl/int_fwd.hpp
src/object.o: /usr/include/boost/mpl/aux_/adl_barrier.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/adl.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/msvc.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/intel.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/gcc.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/workaround.hpp
src/object.o: /usr/include/boost/mpl/aux_/nttp_decl.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/nttp.hpp
src/object.o: /usr/include/boost/mpl/aux_/integral_wrapper.hpp
src/object.o: /usr/include/boost/mpl/integral_c_tag.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/static_constant.hpp
src/object.o: /usr/include/boost/mpl/aux_/static_cast.hpp
src/object.o: /usr/include/boost/mpl/aux_/template_arity_fwd.hpp
src/object.o: /usr/include/boost/mpl/aux_/preprocessor/params.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/preprocessor.hpp
src/object.o: /usr/include/boost/preprocessor/comma_if.hpp
src/object.o: /usr/include/boost/preprocessor/punctuation/comma_if.hpp
src/object.o: /usr/include/boost/preprocessor/control/if.hpp
src/object.o: /usr/include/boost/preprocessor/control/iif.hpp
src/object.o: /usr/include/boost/preprocessor/logical/bool.hpp
src/object.o: /usr/include/boost/preprocessor/facilities/empty.hpp
src/object.o: /usr/include/boost/preprocessor/punctuation/comma.hpp
src/object.o: /usr/include/boost/preprocessor/repeat.hpp
src/object.o: /usr/include/boost/preprocessor/repetition/repeat.hpp
src/object.o: /usr/include/boost/preprocessor/debug/error.hpp
src/object.o: /usr/include/boost/preprocessor/detail/auto_rec.hpp
src/object.o: /usr/include/boost/preprocessor/tuple/eat.hpp
src/object.o: /usr/include/boost/preprocessor/inc.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/lambda.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/ttp.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/ctps.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/overload_resolution.hpp
src/object.o: /usr/include/boost/type_traits/integral_constant.hpp
src/object.o: /usr/include/boost/mpl/bool.hpp
src/object.o: /usr/include/boost/mpl/bool_fwd.hpp
src/object.o: /usr/include/boost/mpl/integral_c.hpp
src/object.o: /usr/include/boost/mpl/integral_c_fwd.hpp
src/object.o: /usr/include/boost/mpl/aux_/lambda_support.hpp
src/object.o: /usr/include/boost/mpl/aux_/yes_no.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/arrays.hpp
src/object.o: /usr/include/boost/mpl/aux_/na_fwd.hpp
src/object.o: /usr/include/boost/mpl/aux_/preprocessor/enum.hpp
src/object.o: /usr/include/boost/preprocessor/tuple/to_list.hpp
src/object.o: /usr/include/boost/preprocessor/list/for_each_i.hpp
src/object.o: /usr/include/boost/preprocessor/list/adt.hpp
src/object.o: /usr/include/boost/preprocessor/detail/is_binary.hpp
src/object.o: /usr/include/boost/preprocessor/detail/check.hpp
src/object.o: /usr/include/boost/preprocessor/logical/compl.hpp
src/object.o: /usr/include/boost/preprocessor/repetition/for.hpp
src/object.o: /usr/include/boost/preprocessor/repetition/detail/for.hpp
src/object.o: /usr/include/boost/preprocessor/control/expr_iif.hpp
src/object.o: /usr/include/boost/type_traits/detail/bool_trait_undef.hpp
src/object.o: /usr/include/boost/type_traits/is_pod.hpp
src/object.o: /usr/include/boost/type_traits/is_void.hpp
src/object.o: /usr/include/boost/type_traits/is_scalar.hpp
src/object.o: /usr/include/boost/type_traits/is_arithmetic.hpp
src/object.o: /usr/include/boost/type_traits/is_integral.hpp
src/object.o: /usr/include/boost/type_traits/is_float.hpp
src/object.o: /usr/include/boost/type_traits/detail/ice_or.hpp
src/object.o: /usr/include/boost/type_traits/is_enum.hpp
src/object.o: /usr/include/boost/type_traits/add_reference.hpp
src/object.o: /usr/include/boost/type_traits/is_reference.hpp
src/object.o: /usr/include/boost/type_traits/is_lvalue_reference.hpp
src/object.o: /usr/include/boost/type_traits/is_rvalue_reference.hpp
src/object.o: /usr/include/boost/type_traits/ice.hpp
src/object.o: /usr/include/boost/type_traits/detail/ice_and.hpp
src/object.o: /usr/include/boost/type_traits/detail/ice_not.hpp
src/object.o: /usr/include/boost/type_traits/detail/ice_eq.hpp
src/object.o: /usr/include/boost/type_traits/detail/type_trait_def.hpp
src/object.o: /usr/include/boost/type_traits/detail/type_trait_undef.hpp
src/object.o: /usr/include/boost/type_traits/is_convertible.hpp
src/object.o: /usr/include/boost/type_traits/is_array.hpp
src/object.o: /usr/include/boost/type_traits/is_abstract.hpp
src/object.o: /usr/include/boost/static_assert.hpp
src/object.o: /usr/include/boost/type_traits/is_class.hpp
src/object.o: /usr/include/boost/type_traits/is_union.hpp
src/object.o: /usr/include/boost/type_traits/remove_cv.hpp
src/object.o: /usr/include/boost/type_traits/broken_compiler_spec.hpp
src/object.o: /usr/include/boost/type_traits/add_rvalue_reference.hpp
src/object.o: /usr/include/boost/type_traits/is_function.hpp
src/object.o: /usr/include/boost/type_traits/detail/false_result.hpp
src/object.o: /usr/include/boost/type_traits/detail/is_function_ptr_helper.hpp
src/object.o: /usr/include/boost/type_traits/is_pointer.hpp
src/object.o: /usr/include/boost/type_traits/is_member_pointer.hpp
src/object.o: /usr/include/boost/type_traits/is_member_function_pointer.hpp
src/object.o: /usr/include/boost/type_traits/detail/is_mem_fun_pointer_impl.hpp
src/object.o: /usr/include/boost/type_traits/has_trivial_destructor.hpp
src/object.o: /usr/include/boost/type_traits/is_const.hpp
src/object.o: /usr/include/boost/type_traits/composite_traits.hpp
src/object.o: /usr/include/boost/ref.hpp
src/object.o: /usr/include/boost/utility/addressof.hpp
src/object.o: /usr/include/boost/mpl/if.hpp
src/object.o: /usr/include/boost/mpl/aux_/value_wknd.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/integral.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/eti.hpp
src/object.o: /usr/include/boost/mpl/aux_/na_spec.hpp
src/object.o: /usr/include/boost/mpl/lambda_fwd.hpp
src/object.o: /usr/include/boost/mpl/void_fwd.hpp
src/object.o: /usr/include/boost/mpl/aux_/na.hpp
src/object.o: /usr/include/boost/mpl/aux_/arity.hpp
src/object.o: /usr/include/boost/mpl/aux_/config/dtp.hpp
src/object.o: /usr/include/boost/mpl/aux_/preprocessor/def_params_tail.hpp
src/object.o: /usr/include/boost/mpl/limits/arity.hpp
src/object.o: /usr/include/boost/preprocessor/logical/and.hpp
src/object.o: /usr/include/boost/preprocessor/logical/bitand.hpp
src/object.o: /usr/include/boost/preprocessor/identity.hpp
src/object.o: /usr/include/boost/preprocessor/facilities/identity.hpp
src/object.o: /usr/include/boost/preprocessor/empty.hpp
src/object.o: /usr/include/boost/preprocessor/arithmetic/add.hpp
src/object.o: /usr/include/boost/preprocessor/control/while.hpp
src/object.o: /usr/include/boost/preprocessor/list/fold_left.hpp
src/object.o: /usr/include/boost/preprocessor/list/detail/fold_left.hpp
src/object.o: /usr/include/boost/preprocessor/list/fold_right.hpp
src/object.o: /usr/include/boost/preprocessor/list/detail/fold_right.hpp
src/object.o: /usr/include/boost/preprocessor/list/reverse.hpp
src/object.o: /usr/include/boost/preprocessor/control/detail/while.hpp
src/object.o: /usr/include/boost/preprocessor/arithmetic/sub.hpp
src/object.o: /usr/include/boost/mpl/aux_/lambda_arity_param.hpp
src/object.o: /usr/include/boost/type_traits/alignment_of.hpp
src/object.o: /usr/include/boost/type_traits/detail/size_t_trait_def.hpp
src/object.o: /usr/include/boost/mpl/size_t.hpp
src/object.o: /usr/include/boost/mpl/size_t_fwd.hpp
src/object.o: /usr/include/boost/type_traits/detail/size_t_trait_undef.hpp
src/object.o: /usr/include/boost/utility/enable_if.hpp
src/object.o: /usr/include/boost/function_equal.hpp
src/object.o: /usr/include/boost/function/function_fwd.hpp
src/object.o: /usr/include/boost/mem_fn.hpp
src/object.o: /usr/include/boost/bind/mem_fn.hpp
src/object.o: /usr/include/boost/get_pointer.hpp
src/object.o: /usr/include/boost/config/no_tr1/memory.hpp
src/object.o: /usr/include/boost/bind/mem_fn_template.hpp
src/object.o: /usr/include/boost/bind/mem_fn_cc.hpp
src/object.o: /usr/include/boost/preprocessor/enum.hpp
src/object.o: /usr/include/boost/preprocessor/repetition/enum.hpp
src/object.o: /usr/include/boost/preprocessor/enum_params.hpp
src/object.o: /usr/include/boost/preprocessor/repetition/enum_params.hpp
src/object.o: src/bullet_physics.h src/player.h
src/object.o: /usr/include/bullet/BulletDynamics/Character/btKinematicCharacterController.h
src/object.o: /usr/include/bullet/BulletDynamics/Character/btCharacterControllerInterface.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btGhostObject.h
src/object.o: /usr/include/bullet/BulletCollision/BroadphaseCollision/btOverlappingPairCallback.h
src/object.o: /usr/include/bullet/BulletCollision/CollisionDispatch/btCollisionWorld.h
