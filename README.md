# Acquisition

This is a fork of the [acquisition project](https://github.com/xyzz/acquisition/releases). This fork is made to support Qt4 and Linux correctly for Acquisition. Since the original is not interested in Qt4 support, this fork won't be kept up to date with the original project and its features won't be added to the Acquisition project. It is also unlikely that I do any Windows build from this project, but I'll try to keep the compatibility nevertheless.

Acquisition is an inventory management tool for [Path of Exile](https://www.pathofexile.com/).

It is written in C++, uses Qt widget toolkit and runs on Windows and Linux.

Differences with the original project:
 * Support QT4
 * Support g++ compiler

## Compiling/developing Acquisition

### Linux

Either open `acquisition.pro` in Qt Creator and build or do `qmake && make`.

### Windows

On Windows you can use either Visual Studio or MinGW version of Qt Creator. Alternatively you can also use Visual Studio with Qt Add-in. Note that only Visual Studio 2013 Update 3 is supported.
