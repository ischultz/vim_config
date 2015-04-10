@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR="%HOME%\.vim"
cd "%BASE_DIR%"
git reset --hard
git pull origin
