## The Superbuild script is used to automatically download and build project dependencies. 

# Using GIT to download third party libraries. An SVN/BitBucket URL will also work the same way
FIND_PACKAGE( Git REQUIRED )

OPTION( USE_GIT_PROTOCOL "If behind a firewall turn this off to use https instead." OFF )

SET( 
  CMAKE_MODULE_PATH
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake_modules
  ${CMAKE_MODULE_PATH}
)

SET(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_STANDARD_REQUIRED YES) 

IF(MSVC)
  SET( CMAKE_BUILD_TYPE "Debug;Release")
ELSEIF(UNIX)
  SET( CMAKE_BUILD_TYPE "Release")
ENDIF()

INCLUDE( ExternalProject )

MESSAGE( STATUS "Adding ITK-4.13.1 ...")
INCLUDE( ${CMAKE_CURRENT_SOURCE_DIR}/cmake_modules/External-ITK.cmake )
