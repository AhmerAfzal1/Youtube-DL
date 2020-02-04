@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
CLS
:: Author Ahmer Afzal

TITLE "Download HD Videos Using Youtube-DL | Ahmer Afzal"

SET DOWNLOADLOCATION=".//Download//"
SET YOUTUBEDLLOCATION="Files//youtube-dl.exe"
SET FFMPEGLOCATION="Files//"
SET BATCHFILE="Batch-Downloads.txt"
SET MERGEOUTPUTFORMAT="mkv
SET AUDIOARGS="(bestaudio[acodec=opus]/bestaudio[acodec=vorbis]/bestaudio[acodec=aac]/bestaudio[acodec=m4a]/bestaudio)/best"
SET VIDEOARGS="(bestvideo[vcodec^=av01][height>=3072][fps>30]/bestvideo[vcodec=vp9.2][height>=3072][fps>30]/bestvideo[vcodec=vp9][height>=3072][fps>30]/bestvideo[vcodec^=av01][height>=3072]/bestvideo[vcodec=vp9.2][height>=3072]/bestvideo[vcodec=vp9][height>=3072]/bestvideo[height>=3072]/bestvideo[vcodec^=av01][height>=2160][fps>30]/bestvideo[vcodec=vp9.2][height>=2160][fps>30]/bestvideo[vcodec=vp9][height>=2160][fps>30]/bestvideo[vcodec^=av01][height>=2160]/bestvideo[vcodec=vp9.2][height>=2160]/bestvideo[vcodec=vp9][height>=2160]/bestvideo[height>=2160]/bestvideo[vcodec^=av01][height>=1440][fps>30]/bestvideo[vcodec=vp9.2][height>=1440][fps>30]/bestvideo[vcodec=vp9][height>=1440][fps>30]/bestvideo[vcodec^=av01][height>=1440]/bestvideo[vcodec=vp9.2][height>=1440]/bestvideo[vcodec=vp9][height>=1440]/bestvideo[height>=1440]/bestvideo[vcodec^=av01][height>=1080][fps>30]/bestvideo[vcodec=vp9.2][height>=1080][fps>30]/bestvideo[vcodec=vp9][height>=1080][fps>30]/bestvideo[vcodec^=av01][height>=1080]/bestvideo[vcodec=vp9.2][height>=1080]/bestvideo[vcodec=vp9][height>=1080]/bestvideo[height>=1080]/bestvideo[vcodec^=av01][height>=720][fps>30]/bestvideo[vcodec=vp9.2][height>=720][fps>30]/bestvideo[vcodec=vp9][height>=720][fps>30]/bestvideo[vcodec^=av01][height>=720]/bestvideo[vcodec=vp9.2][height>=720]/bestvideo[vcodec=vp9][height>=720]/bestvideo[height>=720]/bestvideo)"

:menu
ECHO.
ECHO [1] Download Videos
ECHO [2] Download Audios
ECHO [3] Update Youtube-DL
ECHO [4] EXIT
ECHO.
SET CHOICE=0
SET /P CHOICE="Please choose one option: 
ECHO.
IF "%CHOICE%"=="1" GOTO video
IF "%CHOICE%"=="2" GOTO audio
IF "%CHOICE%"=="3" GOTO update
IF "%CHOICE%"=="4" GOTO :EOF
ECHO.
ECHO Invalid option
TIMEOUT /T 2 /NOBREAK > NUL
CLS
GOTO menu

:video
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --newline --no-part --add-metadata --all-subs --embed-subs --format %VIDEOARGS%+%AUDIOARGS% --output "%DOWNLOADLOCATION%%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive "Downloaded.log" --ffmpeg-location %FFMPEGLOCATION% --merge-output-format %MERGEOUTPUTFORMAT%
ECHO.
CLS
GOTO menu

:audio
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --newline --no-part --add-metadata --all-subs --embed-thumbnail --embed-subs -x --audio-format "mp3" --audio-quality 0 --output "%DOWNLOADLOCATION%%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive "Downloaded.log" --ffmpeg-location %FFMPEGLOCATION%
ECHO.
CLS
GOTO menu

:update
%YOUTUBEDLLOCATION% --update
TIMEOUT /T 3 /NOBREAK > NUL
CLS
GOTO menu