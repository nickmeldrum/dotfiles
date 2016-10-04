alias killvs="ps -W | awk '/devenv.exe/,NF=1' | xargs kill -9 -f"
alias vim='gvim'
alias vs="cygstart.exe 'C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe'"
alias vsScribe="cygstart.exe 'C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe' d:/prod/scribestar.sln"
