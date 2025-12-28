set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
set (CMAKE_CXX_STANDARD 20)
set (CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_EXTENSIONS OFF)

cmake_host_system_information (RESULT HOSTNAME QUERY HOSTNAME)

if (DEFINED GCC14)
	if (HOSTNAME STREQUAL "work")
		# current cuda doesn't support gcc15 yet
		set (CMAKE_C_COMPILER "/usr/bin/gcc-14")
		set (CMAKE_CXX_COMPILER "/usr/bin/g++-14")
		set (CMAKE_CUDA_HOST_COMPILER "/usr/bin/g++-14")
	endif ()
endif ()

if (NOT DEFINED NO_PEDANTIC)
	add_compile_options (-pedantic-errors -Werror=pedantic)
	# add_compile_options ("$<$<COMPILE_LANGUAGE:CXX,C>:-pedantic-errors -Werror=pedantic>")
	# set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic-errors -Werror=pedantic")
	# set (CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -pedantic-errors -Werror=pedantic")
endif ()

get_filename_component (PROJECT_PATH "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)

if (PROJECT_PATH MATCHES "^/src/.*")
	# add_definitions (-DDATA_DIR=/src/data/${PROJECT_NAME}/)
	set (DATA_DIR "/src/data/${PROJECT_NAME}/")
else ()
	# add_definitions (-DDATA_DIR=${CMAKE_CURRENT_BINARY_DIR}/)
	set (DATA_DIR "${CMAKE_CURRENT_BINARY_DIR}/")
endif ()

add_definitions (-DDATA_DIR="${DATA_DIR}")
