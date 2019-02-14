# Bash

 * `set -io vi` use vi keybindings for bash cmdline
 * `cheat` echo this cheatsheet
 * `execline x y` execute line x from file y
 * `new-node-kata-project x` clone a node kata test project and set it up with name x
 * `debughex` output a random hex dump to impress
 * `replace *.js search replace` search and replace in files recursively (search is a regex)
 * `echo '{"foo": "bar"}' | postjson __test-support/customer` use curl to post json from stdin to local endpoint

# Git

 * `updateBranchToRemoteMaster` = fetch, update master, merge master to current branch
 * `acg x` do a git add . then commit with message x
 * `log n` nice one liner git log showing n last commits defaulting to 5
 * `create-github-repo x` creates a new github repo with name x and pushes to it
 * `git log -L n,m:filepath` show changes to this range of lines in a file
 * `git log oldbranch ^newbranch --no-merges` see commits on 1 branch but not on another
 * `git --no-pager log --graph -30 --pretty=format:"%h %ad %an %s" -- filepath` see history with branch relationships of commits to a specific file
 * `git checkout `git rev-list -1 --before="Jan 17 2014" master` ` checkout master branch to the last commit on a certain date
 * `git remote prune origin` remove remote branches that don't exist on origin any more
 * `git branch | grep -v "*" | xargs git branch -D` remove all local branches (hard delete!)
 * `git diff master...` see diff between current branch and master
 * `git diff master...branch` see diff between branch and master
 * `git branch -D branchname` delete local branch (ignoring unmerged changes)
 * `git push --delete origin branchname` delete remote branch
 * `git clean -fd` remove untracked files (maintaining files in .gitignore eg. build files) `-xfd` to remove all files `-Xfd` to remove only ignored files (eg. kill build files but keep created files)
 * 3 way merging:
   * `[c` and `]c` 4 prev and next change
   * `/====` find next conflict
   * `:diffg RE` to use remote change
   * `:diffg LO` to use local change

# Vim

 * `:args **/*.mjs` load all js files into the args list
 * `:argdo %s/'src/'lib/gi | update` do a search and replace in all files in the args list
 * `:argdo normal @a` execute the macro in register a on all files in the args list

# Aws cli

 * `aws-adfs login --adfs-host auth.fil.co` log in to aws cli on
 * `aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[*].{Name:AutoScalingGroupARN,Cap:DesiredCapacity,Min:MinSize,Max:MaxSize}"` see the maxsize set on an autoscaling group (for the maxclustersize in ecs checking)
 * `aws lambda update-function-code --function-name nickmeldrum-InvestmentModels --zip-file fileb://target/investment-models.zip` update an individual lambdas code with local package

# Postgres locally

 * `brew install postgres` install postgres
 * `pg_ctl -D /usr/local/var/postgres start` start server
 * `pg_ctl -D /usr/local/var/postgres stop` stop server
 * `psql -d customer -U localuser -p 5433 -h localhost` postgres client cli
 * `export PGPASSWORD=mysecretpassword` set password for above connection
 * `SELECT * FROM pg_catalog.pg_tables;` in psql - list all tables
