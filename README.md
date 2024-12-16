# wpilib_android

## Description
This is a repository containing an Android build script for [wpilib](https://github.com/wpilibsuite/allwpilib) created by FTC Team 16391, the Rising Ninjas.

The build script in this repository will compile wpilib for: `arm64-v8a`, `x86_64`

## Instructions
### Compiling the libraries
If you wish to build the libraries for yourself, you may either use the included Nix flake, or ensure that you have the following tools installed:

* CMake
* GCC / Clang
* Tar
* Zip

Also, download the [Android NDK](https://developer.android.com/ndk/downloads) (version r27c at the time of writing), and extract it into the same directory as the build script.

In a terminal, enter the directory that the build script is in and run
```
$ ./build.sh
```

This will build wpilib, and create two directories in the same directory as the build script containing all of the built libraries. <strong>THIS WILL TAKE A WHILE!</strong> On top of that, it will automatically create two archives: `libaries.tar.gz` and `libraries.zip`.

<small>Note, these instructions are for Linux, if you are using Windows, then you will need to use the Windows Subsystem for Linux</small>

### Using the precompiled libraries
If you are looking for the precompiled libraries, visit [here](https://github.com/RisingNinjas-16391/wpilib_android/releases)