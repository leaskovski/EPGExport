#!/bin/bash

PACKAGE_NAME=enigma2-plugin-extensions-epgexport
VERSION=1.4-r1
INSTALL_LOCATION=/usr/lib/enigma2/python/Plugins/Extensions/EPGExport

# Make the directory for putting all the files in for the IPK
mkdir -p ./${PACKAGE_NAME}/control
mkdir -p ./${PACKAGE_NAME}/data/${INSTALL_LOCATION}

# Copy the plugin files to the package folder
cp -r ../src/* ./${PACKAGE_NAME}/data/${INSTALL_LOCATION}

# Create the control file for control.tar
cat > ./${PACKAGE_NAME}/control/control <<EOF
Package: $PACKAGE_NAME
Version: $VERSION
Description: EPGExport Plugin
Section: base
Priority: optional
Maintainer: Leaskovski
Architecture: all
OE: enigma2-plugins
Homepage: https://github.com/leaskovski/EPGExport
Depends: python-requests, python-lzma
EOF

# Create the prerm file for control.tar
cat > ./${PACKAGE_NAME}/control/prerm <<EOF
#!/bin/sh
rm $INSTALL_LOCATION/*.pyo > /dev/null 2>&1
rm $INSTALL_LOCATION/*.pyc > /dev/null 2>&1
exit 0
EOF

# Create the debian-binary file
cat > ./${PACKAGE_NAME}/debian-binary <<EOF
2.0
EOF

# Package files
pushd ./${PACKAGE_NAME}/control
tar --numeric-owner --group=0 --owner=0 -czf ../control.tar.gz ./*
popd
pushd ./${PACKAGE_NAME}/data
tar --numeric-owner --group=0 --owner=0 -czf ../data.tar.gz ./*
popd
pushd ./${PACKAGE_NAME}
tar --numeric-owner --group=0 --owner=0 -cf ../${PACKAGE_NAME}_${VERSION}_all.ipk ./debian-binary ./data.tar.gz ./control.tar.gz 
popd

# Clean up
rm -r ./${PACKAGE_NAME}