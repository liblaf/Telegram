#!/usr/bin/env bash

export ANDROID_NDK="${ANDROID_NDK:-"${HOME}/Android/Sdk/ndk/21.4.7075529"}"
export TARGET_LLVM_HOME="${TARGET_LLVM_HOME:-"${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64"}"
export TARGET_CC="${TARGET_CC:-"${TARGET_LLVM_HOME}/bin/clang.bak"}"
export TARGET_CXX="${TARGET_CXX:-"${TARGET_LLVM_HOME}/bin/clang++.bak"}"
LLVM_CONFIG="${TARGET_LLVM_HOME}/bin/llvm-config"
export LIB_MONITOR_HOME="${HOME}/Desktop/liblaf/lib-monitor/llvm"

bash "${LIB_MONITOR_HOME}/inserter/wrap-ndk.sh"

export LD_LIBRARY_PATH="$("${LLVM_CONFIG}" --libdir)"
echo LD_LIBRARY_PATH="${LD_LIBRARY_PATH}"

gtk-launch android-studio-2021.3.1.16
