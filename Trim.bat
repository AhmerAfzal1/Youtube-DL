@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
CLS
:: Author Ahmer Afzal

TITLE "Triming Videos Using FFMPEG | Ahmer Afzal"

SET File1="Janasheen.mp4"
SET NewFile1=1
SET StartFile1="01:25:30.000"
SET EndFile1="02:03:17.000"

SET FFMpegLocation="Files//ffmpeg.exe"
SET VideosForConvertLocation=".//Videos For Cutting"
SET ConvertedLocation=".//Completed"

IF NOT EXIST %VideosForConvertLocation% MKDIR %VideosForConvertLocation%
IF NOT EXIST %ConvertedLocation% MKDIR %ConvertedLocation%

%FFMpegLocation% -hide_banner -i %VideosForConvertLocation%\\%File1% -ss %StartFile1% -to %EndFile1% -acodec copy -vcodec copy -v quiet -stats -map_metadata 0 -map 0 %ConvertedLocation%\\%NewFile1%%File1%

:: Convert file to another extension
:: -crf 18 to 28 lower is best
:: ffmpeg -hide_banner -i filename.flv -c:v libx264 -crf 19 -strict experimental filename.mp4