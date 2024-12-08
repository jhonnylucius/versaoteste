project(versaoteste LANGUAGES CXX)

set(EPHEMERAL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ephemeral")

# Configuration provided via flutter tool.
if(EXISTS ${EPHEMERAL_DIR}/generated_config.cmake)
  include(${EPHEMERAL_DIR}/generated_config.cmake)
else()
  message(FATAL_ERROR "Missing generated_config.cmake. Please ensure it is generated or copied to ${EPHEMERAL_DIR}.")
endif()

# https://github.com/flutter/flutter/issues/57146.
set(WRAPPER_ROOT "${EPHEMERAL_DIR}/cpp_client_wrapper")

# Set fallback configurations for older versions of the flutter tool.
if (NOT DEFINED FLUTTER_TARGET_PLATFORM)
  set(FLUTTER_TARGET_PLATFORM "windows-x64")
endif()

# === Flutter Library ===
set(FLUTTER_LIBRARY "${EPHEMERAL_DIR}/flutter_windows.dll")

# Published to parent scope for install step.
set(FLUTTER_LIBRARY ${FLUTTER_LIBRARY})
set(FLUTTER_ICU_DATA_FILE "${EPHEMERAL_DIR}/icudtl.dat")
set(PROJECT_BUILD_DIR "${PROJECT_DIR}/build/")
set(AOT_LIBRARY "${PROJECT_DIR}/build/windows/app.so")

list(APPEND FLUTTER_LIBRARY_HEADERS
  "flutter_export.h"
  "flutter_windows.h"
)