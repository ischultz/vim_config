@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR="%HOME%\.vim"
@set BASE_VIMRC_PATH="%BASE_DIR%\.vimrc.base"
IF NOT EXIST "%BASE_DIR%" (
   call mkdir "%BASE_DIR%"
   call git clone https://github.com/ischultz/vim_config "%BASE_DIR%"
)

IF NOT EXIST "%BASE_DIR%\bundle" (
   call mkdir "%BASE_DIR%\bundle"
)

IF NOT EXIST "%BASE_DIR%\bundle\Vundle.vim" (
   call git clone https://github.com/gmarik/Vundle.vim.git "%BASE_DIR%/bundle/Vundle.vim"
)

IF EXIST "%HOME%\_vimrc" (
   @set VIMRC_PATH="%HOME%\_vimrc"
) ELSE (
   @set VIMRC_PATH="%HOME%\.vimrc"
)

@echo off
findstr /m ".vimrc.base" "%VIMRC_PATH%"
IF ERRORLEVEL 1 (
   copy "%VIMRC_PATH%" "%VIMRC_PATH%.orig"
   echo so $HOME\.vim\.vimrc.base> "%VIMRC_PATH%"
   type "%VIMRC_PATH%.orig">>"%VIMRC_PATH%"
   del "%VIMRC_PATH%.orig"
)

call vim +PluginInstall! +PluginClean +qall
