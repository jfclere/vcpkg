include(vcpkg_common_functions)

vcpkg_download_distfile(ARCHIVE
  URLS "https://archive.apache.org/dist/httpd/httpd-2.4.41.tar.bz2"
  FILENAME "httpd-2.4.41.tar.bz2"
  SHA256 133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
