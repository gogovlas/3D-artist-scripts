:: Command line script for creating a basic folder structure for ZBrush projects
::
:: Example usage:
::    createZPR
::    createZPR myProjectName
::    createZPR -name myProjectName
::
:: author: Vlasis Gogousis
:: email: vgogousis@gmail.com

@ECHO OFF

IF NOT "%1"=="" (
    IF "%1"=="-name" (
        SET name=%2
    ) ELSE (
		SET name=%1
	)
) ELSE (
	SET name=.
)

ECHO:
IF NOT %name%==. (
	ECHO Creating project tree for: %name%
) ELSE (
	ECHO Creating project tree in current directory
)

ECHO:
SET /P createProject="Continue? (yes/no) or (help) "
ECHO:

IF %createProject%==yes (
	REM for storing random files, versions, junk, etc
	MKDIR "%name%/.archive"   

	REM ====================================================
	REM PUBLISH> any material that will be published
	REM any final work will be re-directed to this directory
	
	REM publishing root directory
	MKDIR "%name%/PUBLISH"
		
	REM 3D published files, like final models, scene files, etc
	MKDIR "%name%/PUBLISH/3D"
	REM images that will be published
	MKDIR "%name%/PUBLISH/img"
	REM videos that will be published
	MKDIR "%name%/PUBLISH/video"
	
	REM ===========================================================
	REM WORK> any files and resources used for creating the artwork 
	
	REM working root directory
	MKDIR "%name%/WORK"
	
	REM 3D root directory
	MKDIR "%name%/WORK/3D"
	REM zprojects directory
	MKDIR "%name%/WORK/3D/zprojects"   
	REM ztools directory
	MKDIR "%name%/WORK/3D/ztools"
	REM resources root directory
	MKDIR "%name%/WORK/3D/resources"   
	REM any alpha maps used for modeling
	MKDIR "%name%/WORK/3D/resources/alphas"   
	REM any lights for my scenes
	MKDIR "%name%/WORK/3D/resources/lights"   
	REM any custom materials I might be using
	MKDIR "%name%/WORK/3D/resources/materials"   
	REM camera views for rendering my project
	MKDIR "%name%/WORK/3D/resources/views"   
	REM this is for exporting stuff and sharing on other softwares
	MKDIR "%name%/WORK/3D/export"   
	REM obj files
	MKDIR "%name%/WORK/3D/export/obj"   
	REM 3D printing directory
	MKDIR "%name%/WORK/3D/3D_Print"   
	REM obj files/parts used for 3D printing
	MKDIR "%name%/WORK/3D/3D_Print/obj"   
	REM stl files/parts used for 3D printing
	MKDIR "%name%/WORK/3D/3D_Print/stl"   
	REM project/scene files for the 3D printer to load
	MKDIR "%name%/WORK/3D/3D_Print/projectFiles"   

	REM shortcut to link the final 3D work with the published 3D work
	MKLINK /J "%name%/WORK/3D/final" "%name%/PUBLISH/3D"   

	REM image root directory
	MKDIR "%name%/WORK/img"   
	REM compositing directory to combine various 2D work
	MKDIR "%name%/WORK/img/comp"   
	REM raw renders, ie render passses, ie diffuse, shadow, specular, alpha, etc
	MKDIR "%name%/WORK/img/raw"   
	REM any renders I might do that have no render passes
	MKDIR "%name%/WORK/img/renders"   
	
	REM make a shortcut to link the final 2D work with the published 2D work
	MKLINK /J "%name%/WORK/img/final" "%name%/PUBLISH/img/"   

	REM reference material, eg. images, sketches, color palettes, etc
	MKDIR "%name%/WORK/ref"   
	
	REM video root directory
	MKDIR "%name%/WORK/video"   
	REM for any animations I might create
	MKDIR "%name%/WORK/video/anim"   
	REM for any compositions I might do to combine video material of my project
	MKDIR "%name%/WORK/video/comp"   
	REM turntables for my models
	MKDIR "%name%/WORK/video/turntables"   
	REM timelapses of myself working on the models
	MKDIR "%name%/WORK/video/timelapses"   

	REM shortcut to link final video work to published video work
	MKLINK /J "%name%/WORK/video/final" "%name%/PUBLISH/video/"   


	ECHO:
	ECHO ===================================
	ECHO Created following folder structure:
	ECHO ===================================
	ECHO:
	TREE %name%
	ECHO:
	ECHO ***********************************
	ECHO:
	
) ELSE IF %createProject%==help (
	ECHO:
	ECHO Example usage:
	ECHO:
	ECHO     createZPR
	ECHO     createZPR myProjectName
	ECHO     createZPR -name myProjectName
	ECHO:
)
