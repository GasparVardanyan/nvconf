set (CMAKE_EXPORT_COMPILE_COMMANDS ON)

get_filename_component (PROJECT_PATH "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)

if (PROJECT_PATH MATCHES "^/src/work/.*")
	# add_definitions (-DDATA_DIR=\"/src/work/data/${PROJECT_NAME}/\")
	set (DATA_DIR "/src/work/data/${PROJECT_NAME}/")
elseif (PROJECT_PATH MATCHES "^/src/.*")
	# add_definitions (-DDATA_DIR=/src/data/${PROJECT_NAME}/)
	set (DATA_DIR "/src/data/${PROJECT_NAME}/")
else ()
	# add_definitions (-DDATA_DIR=${CMAKE_CURRENT_BINARY_DIR}/)
	set (DATA_DIR "${CMAKE_CURRENT_BINARY_DIR}/")
endif ()

add_definitions (-DDATA_DIR="${DATA_DIR}")
