CHCP 65001
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
CLS
:: Author Ahmer Afzal

TITLE Download HD Videos Using Youtube-DL by Ahmer Afzal

SET DOWNLOADLOCATION=".//Download//"
SET YOUTUBEDLLOCATION="Files//youtube-dl.exe"
SET FFMPEGLOCATION="Files//"
SET BATCHFILE="URLs.txt"
SET ARCHIVE="Downloaded.log"
FOR /F "USEBACKQ" %%F IN (`powershell -NoLogo -NoProfile -Command ^(Get-Item "%YOUTUBEDLLOCATION%"^).VersionInfo.FileVersion`) DO (SET fileVersion=%%F)

SET VIDMP4="bestvideo[height<=4320][fps<=60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=2160][fps<=60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=1440][fps<=60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=1080][fps<=60][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=720][fps<=60][ext=mp4]+bestaudio[ext=m4a]/mp4"

SET NEWARG="bestvideo[ext=webm][height>=4320][fps=60]+bestaudio/bestvideo[ext=mp4][height>=4320][fps=60]+bestaudio/bestvideo[ext=webm][height>=4320]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/bestvideo[ext=webm][height>=2160][fps=60]+bestaudio/bestvideo[ext=mp4][height>=2160][fps=60]+bestaudio/bestvideo[ext=webm][height>=2160]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/bestvideo[ext=webm][height>=1080][fps=60]+bestaudio/bestvideo[ext=mp4][height>=1080][fps=60]+bestaudio/bestvideo[ext=webm][height>=1080]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/bestvideo[ext=webm][height>=720][fps=60]+bestaudio/bestvideo[ext=mp4][height>=720][fps=60]+bestaudio/bestvideo[ext=webm][height>=720]+bestaudio/bestvideo[ext=mp4]+bestaudio/bestvideo+bestaudio/best"

SET VIDMP4AHMER="bestvideo[height<=?720][ext=mp4]+bestaudio[ext=m4a]/mp4"

IF NOT EXIST %DOWNLOADLOCATION% MKDIR %DOWNLOADLOCATION%

:menu
ECHO.
ECHO       ╔══════════════════════════════════════════════════════╗
ECHO       ║                                                      ║
ECHO       ║  Download HD Videos Using Youtube-DL by Ahmer Afzal  ║
ECHO       ║                                                      ║
ECHO       ║──────────────────────────────────────────────────────║
ECHO       ║                                                      ║
ECHO       ║  [1] Download HD Videos in MP4                       ║
ECHO       ║                                                      ║
ECHO       ║  [2] Download Full HD Videos in MKV                  ║
ECHO       ║                                                      ║
ECHO       ║  [3] Download Audios (MP3)                           ║
ECHO       ║                                                      ║
ECHO       ║  [4] 720P in MP4 For Ahmer Afzal                     ║
ECHO       ║                                                      ║
ECHO       ║  [5] Update Youtube-DL                               ║
ECHO       ║                                                      ║
ECHO       ║  [6] EXIT                                            ║
ECHO       ║                                                      ║
ECHO       ╚══════════════════════════════════════════════════════╝
ECHO.
SET CHOICE=0
SET /P CHOICE="Please choose any one option: "
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
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --prefer-ffmpeg --add-metadata --format %NEWARG% --output "%DOWNLOADLOCATION%%%(uploader)s//%%(playlist)s//%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --merge-output-format "mkv" --ffmpeg-location %FFMPEGLOCATION%
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu

:MP4
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --prefer-ffmpeg --add-metadata --format %VIDMP4% --output "%DOWNLOADLOCATION%%%(uploader)s//%%(playlist)s//%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --merge-output-format "mp4" --ffmpeg-location %FFMPEGLOCATION%
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu

:MP3
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --add-metadata --all-subs --embed-thumbnail --embed-subs -x --audio-format "mp3" --audio-quality 0 --output "%DOWNLOADLOCATION%%%(uploader)s//%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --ffmpeg-location %FFMPEGLOCATION%
CLS
GOTO menu

:AHMER
%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --yes-playlist --prefer-ffmpeg --add-metadata --format %VIDMP4AHMER% --output "%DOWNLOADLOCATION%%%(uploader)s//%%(playlist)s//%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive %ARCHIVE% --merge-output-format "mp4" --ffmpeg-location %FFMPEGLOCATION%
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu

:UPDATE
ECHO Youtube-DL current version is %fileVersion%
%YOUTUBEDLLOCATION% --update
TIMEOUT /T 6 /NOBREAK > NUL
CLS
GOTO menu