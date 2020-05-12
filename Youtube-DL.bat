@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
CLS
:: Author Ahmer Afzal

TITLE "Download HD Videos Using Youtube-DL | Ahmer Afzal"

SET DOWNLOADLOCATION=".//Download//"
SET YOUTUBEDLLOCATION="Files//youtube-dl.exe"
SET FFMPEGLOCATION="Files//"
SET BATCHFILE="URLs.txt"
SET ARCHIVE="Downloaded.log"
:: SET AUDIOARGS="(bestaudio[acodec=opus]/bestaudio[acodec=vorbis]/bestaudio[acodec=aac]/bestaudio[acodec=m4a]/bestaudio)/best"
:: SET VIDEOARGS="(bestvideo[height>=1080][fps>30]/bestvideo[vcodec=vp9.2][height>=1080][fps>30]/bestvideo[vcodec=vp9][height>=1080][fps>30]/bestvideo[vcodec^=av01][height>=1080]/bestvideo[vcodec=vp9.2][height>=1080]/bestvideo[vcodec=vp9][height>=1080]/bestvideo[height>=1080]/bestvideo[vcodec^=av01][height>=720][fps>30]/bestvideo[vcodec=vp9.2][height>=720][fps>30]/bestvideo[vcodec=vp9][height>=720][fps>30]/bestvideo[vcodec^=av01][height>=720]/bestvideo[vcodec=vp9.2][height>=720]/bestvideo[vcodec=vp9][height>=720]/bestvideo[height>=720]/bestvideo)"

SET VIDMP4="bestvideo[height<=4320][fps<60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=2160][fps<60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=1440][fps<60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=1080][fps<60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=720][fps<60][ext=mp4]+bestaudio[ext=m4a]/mp4"

SET NEWARG="bestvideo[ext=webm][height>=4320][fps=60]+bestaudio/bestvideo[ext=mp4][height>=4320][fps=60]+bestaudio/bestvideo[ext=webm][height>=4320]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/bestvideo[ext=webm][height>=2160][fps=60]+bestaudio/bestvideo[ext=mp4][height>=2160][fps=60]+bestaudio/bestvideo[ext=webm][height>=2160]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/bestvideo[ext=webm][height>=1080][fps=60]+bestaudio/bestvideo[ext=mp4][height>=1080][fps=60]+bestaudio/bestvideo[ext=webm][height>=1080]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/bestvideo[ext=webm][height>=720][fps=60]+bestaudio/bestvideo[ext=mp4][height>=720][fps=60]+bestaudio/bestvideo[ext=webm][height>=720]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/best"

SET VIDMP4AHMER="bestvideo[height<=720][fps<60][ext=mp4]+bestaudio[ext=m4a]/mp4"

:menu
ECHO.
ECHO [1] Download Videos MP4 (99%% full HD)
ECHO.
ECHO [2] Download Videos Full HD (File convert into MKV)
ECHO.
ECHO [3] Download Audios (MP3)
ECHO.
ECHO [4] 720P For Ahmer Afzal
ECHO.
ECHO [5] Update Youtube-DL
ECHO.
ECHO [6] EXIT

ECHO.
SET CHOICE=0
SET /P CHOICE="Please choose one option: 
ECHO.
IF "%CHOICE%"=="1" GOTO MP4
IF "%CHOICE%"=="2" GOTO MKV
IF "%CHOICE%"=="3" GOTO MP3
IF "%CHOICE%"=="4" GOTO AHMER
IF "%CHOICE%"=="5" GOTO UPDATE
IF "%CHOICE%"=="6" GOTO :EOF
ECHO.
ECHO Invalid option
TIMEOUT /T 2 /NOBREAK > NUL
CLS
GOTO menu

:MKV
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --prefer-ffmpeg --no-part --add-metadata --format %NEWARG% --output "%DOWNLOADLOCATION%%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --merge-output-format "mkv" --ffmpeg-location %FFMPEGLOCATION%
ECHO.
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu

:MP4
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --prefer-ffmpeg --no-part --add-metadata --format %VIDMP4% --output "%DOWNLOADLOCATION%%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --merge-output-format "mp4" --ffmpeg-location %FFMPEGLOCATION%
ECHO.
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu

:MP3
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --no-part --add-metadata --all-subs --embed-thumbnail --embed-subs -x --audio-format "mp3" --audio-quality 0 --output "%DOWNLOADLOCATION%%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --ffmpeg-location %FFMPEGLOCATION%
ECHO.
CLS
GOTO menu

:AHMER
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --prefer-ffmpeg --no-part --add-metadata --format %VIDMP4AHMER% --output "%DOWNLOADLOCATION%%%(id)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --merge-output-format "mp4" --ffmpeg-location %FFMPEGLOCATION%
ECHO.
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu

:UPDATE
ECHO Current version is 
%YOUTUBEDLLOCATION% --version
%YOUTUBEDLLOCATION% --update
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu