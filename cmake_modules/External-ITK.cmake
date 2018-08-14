SET(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_STANDARD_REQUIRED YES) 

ExternalProject_Add( 
  ITK
  DEPENDS ${ITK_DEPENDS}
  URL https://github.com/InsightSoftwareConsortium/ITK/archive/v4.13.1.zip
  SOURCE_DIR ITK-source
  BINARY_DIR ITK-build
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  #INSTALL_COMMAND ""
  CMAKE_GENERATOR ${gen}
  CMAKE_ARGS
    ${ep_common_args}   
    #-DCMAKE_CONFIGURATION_TYPES=${CMAKE_CONFIGURATION_TYPES}
    -DBUILD_EXAMPLES:BOOL=OFF # examples are not needed
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS} 
    -DBUILD_TESTING:BOOL=OFF # testing the ITK build is not required
    -DITK_DYNAMIC_LOADING:BOOL=OFF
    -DModule_ITKReview:BOOL=ON
    -DModule_SkullStrip:BOOL=ON
    -DModule_TextureFeatures:BOOL=ON
    -DModule_RLEImage:BOOL=ON
    -DModule_IsotropicWavelets:BOOL=ON
    -DModule_PrincipalComponentsAnalysis:BOOL=ON
    -DModule_MGHIO:BOOL=ON
    -DModule_SCIFIO:BOOL=ON
    -DVCL_INCLUDE_CXX_0X:BOOL=ON
    -DVCL_INCLUDE_CXX_0X:BOOL=ON
    -DDCMTK_USE_ICU:BOOL=OFF
    -DCMAKE_DEBUG_POSTFIX:STRING=d
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE} # toggle for type of build if something different that 
    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/install
)