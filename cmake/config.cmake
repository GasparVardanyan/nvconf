set (CMAKE_EXPORT_COMPILE_COMMANDS ON)

get_filename_component (PROJECT_PATH "${cMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)

if (PROJECT_PATH MATCHES "^/src/work/.*")
	add_definitions (-DDATA_DIR=\"/src/work/data/${PROJECT_NAME}/\")
else ()
	add_definitions (-DDATA_DIR=\"${CMAKE_CURRENT_BINARY_DIR}/\")
endif ()
