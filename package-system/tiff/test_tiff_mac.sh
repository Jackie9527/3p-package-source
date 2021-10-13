#
# Copyright (c) Contributors to the Open 3D Engine Project.
# For complete copyright and license terms please see the LICENSE at the root of this distribution.
# 
# SPDX-License-Identifier: Apache-2.0 OR MIT
#
#

rm -rf temp/build_test
mkdir temp/build_test

cmake -S test -B temp/build_test -G Xcode \
    -DCMAKE_TOOLCHAIN_FILE=../../../../Scripts/cmake/Platform/Mac/Toolchain_mac.cmake \
    -DCMAKE_MODULE_PATH="$DOWNLOADED_PACKAGE_FOLDERS;$PACKAGE_ROOT" || exit 1

cmake --build temp/build_test --parallel --config Release || exit 1

temp/build_test/Release/test_TIFF.app/Contents/MacOS/test_TIFF || exit 1

exit 0
