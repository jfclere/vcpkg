include(vcpkg_common_functions)

vcpkg_download_distfile(ARCHIVE
  URLS "https://archive.apache.org/dist/httpd/httpd-2.4.41.tar.bz2"
  FILENAME "httpd-2.4.41.tar.bz2"
  SHA512 350cc7dcd2c439e0590338fa6da3f44df44f9bb885c381e91f91b14c2f48597f6f0bbac0ea118a8a67eaa70ae7edbb769beace368643ed73f6daee44c307b335
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
