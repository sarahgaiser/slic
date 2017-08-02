IF( NOT Geant4_TAG )
    SET( Geant4_TAG "v10.3.1" )
ENDIF()

IF ( Geant4_TAG EQUAL "master" )
    MESSAGE( FATAL_ERROR "Installing Geant4 from github master is not allowed." )
ENDIF()

IF ( NOT GEANT4_INSTALL_DATA )
    SET( GEANT4_INSTALL_DATA "ON" )
ENDIF()

EXTERNALPROJECT_ADD(
    Geant4

    GIT_REPOSITORY "https://github.com/Geant4/geant4"
    GIT_TAG ${Geant4_TAG}
    
    UPDATE_COMMAND ""
    PATCH_COMMAND ""

    SOURCE_DIR "${CMAKE_BINARY_DIR}/geant4"
    
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${DEPENDENCY_INSTALL_DIR}/geant4 -DGEANT4_INSTALL_DATA=${GEANT4_INSTALL_DATA}
    
    BUILD_COMMAND make -j4
)

STRING( REPLACE "v" "" Geant4_VERSION_NUMBER ${Geant4_TAG} )
SET( Geant4_DIR ${DEPENDENCY_INSTALL_DIR}/geant4/lib64/Geant4-${Geant4_VERSION_NUMBER} CACHE PATH "Geant4 install dir" FORCE )
