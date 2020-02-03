@ECHO OFF

:: Author Ahmer Afzal

SET DOWNLOADLOCATION=".//Download//"
SET YOUTUBEDLLOCATION="Files//youtube-dl.exe"
SET FFMPEGLOCATION="Files//"
SET BATCHFILE="Batch-Downloads.txt"
SET MERGEOUTPUTFORMAT="mkv"

%YOUTUBEDLLOCATION% --no-check-certificate --ignore-errors --ignore-config --continue --no-part --add-metadata --all-subs --embed-subs --format "(bestvideo[vcodec^=av01][height>=3072][fps>30]/bestvideo[vcodec=vp9.2][height>=3072][fps>30]/bestvideo[vcodec=vp9][height>=3072][fps>30]/bestvideo[vcodec^=av01][height>=3072]/bestvideo[vcodec=vp9.2][height>=3072]/bestvideo[vcodec=vp9][height>=3072]/bestvideo[height>=3072]/bestvideo[vcodec^=av01][height>=2160][fps>30]/bestvideo[vcodec=vp9.2][height>=2160][fps>30]/bestvideo[vcodec=vp9][height>=2160][fps>30]/bestvideo[vcodec^=av01][height>=2160]/bestvideo[vcodec=vp9.2][height>=2160]/bestvideo[vcodec=vp9][height>=2160]/bestvideo[height>=2160]/bestvideo[vcodec^=av01][height>=1440][fps>30]/bestvideo[vcodec=vp9.2][height>=1440][fps>30]/bestvideo[vcodec=vp9][height>=1440][fps>30]/bestvideo[vcodec^=av01][height>=1440]/bestvideo[vcodec=vp9.2][height>=1440]/bestvideo[vcodec=vp9][height>=1440]/bestvideo[height>=1440]/bestvideo[vcodec^=av01][height>=1080][fps>30]/bestvideo[vcodec=vp9.2][height>=1080][fps>30]/bestvideo[vcodec=vp9][height>=1080][fps>30]/bestvideo[vcodec^=av01][height>=1080]/bestvideo[vcodec=vp9.2][height>=1080]/bestvideo[vcodec=vp9][height>=1080]/bestvideo[height>=1080]/bestvideo[vcodec^=av01][height>=720][fps>30]/bestvideo[vcodec=vp9.2][height>=720][fps>30]/bestvideo[vcodec=vp9][height>=720][fps>30]/bestvideo[vcodec^=av01][height>=720]/bestvideo[vcodec=vp9.2][height>=720]/bestvideo[vcodec=vp9][height>=720]/bestvideo[height>=720]/bestvideo)+(bestaudio[acodec=opus]/bestaudio[acodec=vorbis]/bestaudio[acodec=aac]/bestaudio[acodec=m4a]/bestaudio)/best" --output "%DOWNLOADLOCATION%%%(title)s.%%(ext)s" --batch-file %BATCHFILE% --download-archive "Downloaded.log" --ffmpeg-location %FFMPEGLOCATION% --merge-output-format %MERGEOUTPUTFORMAT%

ECHO.
 
@PAUSE