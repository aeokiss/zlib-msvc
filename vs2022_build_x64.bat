@echo off

@call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

@set SrcDir=md5
@set ResDir=res

cd %SrcDir%

nmake -f ..\%ResDir%\Makefile.msvc clean
nmake -f ..\%ResDir%\Makefile.msvc NO_NLS=1 MFLAGS=-MTd DEBUG=1

cd ..

@set OutputLibDir=build\vs2022\x64\Debug

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy %SrcDir%\zlib.lib %OutputLibDir%
copy %SrcDir%\zlib.h %OutputLibDir%
copy %SrcDir%\zconf.h %OutputLibDir%
copy %SrcDir%\*.exe %OutputLibDir%
copy %SrcDir%\*.pdb %OutputLibDir%

cd %SrcDir%

nmake -f ..\%ResDir%\Makefile.msvc clean
nmake -f ..\%ResDir%\Makefile.msvc NO_NLS=1 MFLAGS=-MT

cd ..

@set OutputLibDir=build\vs2022\x64\Release

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy %SrcDir%\zlib.lib %OutputLibDir%
copy %SrcDir%\zlib.h %OutputLibDir%
copy %SrcDir%\zconf.h %OutputLibDir%
copy %SrcDir%\*.exe %OutputLibDir%
copy %SrcDir%\*.pdb %OutputLibDir%

pause
