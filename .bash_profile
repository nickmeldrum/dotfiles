##################################################
##########  CHEATSHEET  ##########################
##################################################

alias wholecheat="less ~/dotfiles/cheatsheet.md"
alias cheat="cat ~/dotfiles/cheatsheet.md | grep -B 2 -A 5 $2"
cat ~/dotfiles/cheatsheet.md

##################################################
##########  VIM  #################################
##################################################

alias vim="nvim"
alias vi="nvim"
alias oldvim="\vim"

##################################################
##########  NETWORKING  ##########################
##################################################

alias myipaddress='ifconfig | grep "inet " | grep -v "127.0.0.1" | awk "{print \$2}"'

##################################################
##########  FILES AND FOLDERS  ###################
##################################################

function replace() {
  find . -type f -name "$1" | xargs sed -i '' -e s/$2/$3/g
}

function execline() {
    sed -n $1p $2 | source /dev/stdin
}

alias latestfiles="ls -1t | head -5"
alias oldestfiles="ls -1t | tail -5"

##################################################
##########  FUN  #################################
##################################################

alias debughex="cat /dev/urandom | hexdump -C | grep 'ca fe'"

##################################################
##########  CLEANUP STUFF  #######################
##################################################

function blatdocker() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
}

alias killnode="ps | awk '/node.exe/,NF=1' | xargs kill -9 -f"

##################################################
##########  GIT STUFF  ###########################
##################################################

alias g="git"

function acg() {
    git add .
    git commit -v -m "$1"
}

alias gamend="g commit --amend --no-edit"

alias cleanignored="git clean -Xfd" # i.e. delete anything in the .gitignore
alias cleanuntracked="git clean -fd" # i.e. delete anything showing in git status as "untracked" but keep anything in .gitignore
alias cleanall="git clean -xfd" # like you just did a git clone - delete .gitignored files + untracked files

alias loggraph="git --no-pager log --graph -40 --pretty=format:'%h %ad %an %s' --"
alias logfile="git --no-pager log --pretty=format:'%C(yellow)%h %Cred%ad %C(yellow)%an%Cgreen%d %Creset%s' --date=short --"

function log() {
    if [ "$#" -ne 1 ]; then
        length=5
    else
        length=$1
    fi

    git --no-pager log -$length --pretty=format:'%C(yellow)%h %Cred%ad %C(yellow)%an%Cgreen%d %Creset%s' --date=short
}

function updateBranchToRemoteMaster() {
  CUR_BRANCH="$(git branch | grep \* | cut -c 3- -)"
  git checkout master
  git fetch
  git merge
  git checkout $CUR_BRANCH
  git merge
  git merge master
}

function rebaseBranchOnLatestMaster() {
  CUR_BRANCH="$(git branch | grep \* | cut -c 3- -)"
  git checkout master
  git fetch
  git merge
  git checkout $CUR_BRANCH
  git rebase master
}

function create-github-repo() {
    if [ "$#" -ne 1 ]; then
        echo "please pass in a repo name"
        return
    fi

    TOKEN="$(security find-generic-password -a nickmeldrum -s github-token -w)"
    curl "https://api.github.com/user/repos?access_token=${TOKEN}" -d "{\"name\":\"${1}\"}" -v
    git remote rm origin
    git remote add origin "https://github.com/nickmeldrum/${1}.git"
    git push -u origin --all
    git push -u origin --tags
}

function new-node-kata-project() {
    if [ "$#" -ne 1 ]; then
        echo "please pass in a new project name"
        return
    fi

    cd ~/src
    git clone --depth=1 https://github.com/nickmeldrum/simple-node-kata-seed.git $1
    cd "$1"

    rm -rf .git
    git init

    npm install

    npm i json
    ./node_modules/json/lib/json.js -I -f package.json -e "this.name=\"${1}\""
    ./node_modules/json/lib/json.js -I -f package.json -e "this.description=\"${1} kata exercise\""
    rm -f README.md
    echo -e "# ${1}\n\nkata coding exercise\n" > README.md
    git add .
    git commit -v -m "initial commit"

    npm test
    echo "app in file 'lib/index.js', tests in file 'test/test.js'"
    echo "run the watcher with command 'npm run watch'"
}
