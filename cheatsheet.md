# Bash (zsh)

 * `cheat x` echo portion of cheatsheet around word x (`wholecheat` to 'less' whole file)
 * `execline x y` execute line x from file y
 * `debughex` output a random hex dump to impress
 * `replace *.js search replace` search and replace in files recursively (search is a regex)
 * `echo '{"foo": "bar"}' | postjson __test-support/customer` use curl to post json from stdin to local endpoint
 * `^r` incrementally search backwards through history with preview
 * `myipaddress` echo my ip address
 * Cleanup:
   * `blatdocker` remove all local containers and images - warning can take ages!
   * `killnode` kill -9 all node processes!
 * `latestfiles` or `oldestfiles` ls only showing 5 oldest or newest files
 * ITERM shell integration features:
   * `imgcat filename` preview image in terminal
   * `imgls` preview images in a directory listing
   * `<CMD><OPT>A` 'alert on next mark - i.e. bring up toast when command is finished
 * Graph Visualisations with GraphViz:
   * `brew install graphviz` install graphviz
   * `npm i nodemon -g` install nodemon for watching changes to dot file
   * `nodemon -w test.dot --exec "dot -Tpng test.dot -o outfile.png && open outfile.png"` set up nodemon to watch the dot file and open the dot generated output png on every change

# Aws cli

 * `aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[*].{Name:AutoScalingGroupARN,Cap:DesiredCapacity,Min:MinSize,Max:MaxSize}"` see the maxsize set on an autoscaling group (for the maxclustersize in ecs checking)
 * `aws lambda list-functions --max-items 5000 --query "Functions[*].{Name:FunctionName}" --output text | sort > ../gdw-info/lambdas.list` list all lambdas by name, sort them and pipe the results to a file
 * `aws lambda list-functions --max-items 5000 --query 'Functions[?starts_with(FunctionName, `nickmeldrum`)].{Name:FunctionName}' --output text | sort` list all lambdas by name, filtering on a portion of the name
 * `aws lambda update-function-code --function-name nickmeldrum-InvestmentModels --zip-file fileb://target/investment-models.zip` update an individual lambdas code with local package

# Postgres locally

 * `brew install postgres` install postgres
 * `pg_ctl -D /usr/local/var/postgres start` start server
 * `pg_ctl -D /usr/local/var/postgres stop` stop server
 * `psql -d customer -U localuser -p 5433 -h localhost` postgres client cli
 * `export PGPASSWORD=mysecretpassword` set password for above connection
 * `SELECT * FROM pg_catalog.pg_tables;` in psql - list all tables

# Git

 * Updating:
   * `updateBranchToRemoteMaster` = fetch, update master, merge master to current branch
   * `rebaseBranchOnLatestMaster` = fetch, update master, rebase branch commits on top of master
 * Committing:
   * `acg x` do a git add . then commit with message x
   * `git commit --amend` to add staged into existing commit (and change message)
   * `git commit --amend --no-edit` or `gamend` to add staged and NOT change message
 * Viewing commits:
   * `log n` nice one liner git log showing n last commits defaulting to 5
   * `logfile filename` like log above but on a specific file (all commits)
   * `loggraph [filename]` show commit history graphed against branches (all repo or limit to 1 file)
   * `git log -L n,m:filepath` show changes to this range of lines in a file
   * `git log oldbranch ^newbranch --no-merges` see commits on 1 branch but not on another
   * `git checkout `git rev-list -1 --before="Jan 17 2014" master` ` checkout master branch to the last commit on a certain date
 * Diffing:
   * `git diff master...` see diff between current branch and master
   * `git diff master...branch` see diff between branch and master
 * Setting up:
   * `create-github-repo x` creates a new github repo with name x and pushes to it
 * `new-node-kata-project x` clone a node kata test project and set it up with name x
 * Cleaning up:
   * `git clean -fd` (or `cleanuntracked`) remove untracked files (maintaining files in .gitignore eg. build files)
   * `git clean -xfd` (or `cleanall`) to remove all files
   * `git clean -Xfd` (or `cleanignored`) to remove only ignored files (eg. kill build files but keep created files)
   * `git remote prune origin` remove remote branches that don't exist on origin any more
   * `git branch -D branchname` delete local branch (ignoring unmerged changes)
   * `git push --delete origin branchname` delete remote branch
   * `git branch | grep -v "*" | xargs git branch -D` remove all local branches (hard delete!)
 * 3 way merging:
   * `[c` and `]c` 4 prev and next change
   * `/====` find next conflict
   * `:diffg RE` to use remote change
   * `:diffg LO` to use local change

# Vim

 * General commands:
 * `R` - replace mode (insert mode but overwriting)
   * `q:` open command list of previous commands, can modify them and rerun by hitting `<CR>`
   * `q/` same as above for search history (`<CTRL>C` to quit command list)
   * `<CTRL>I, <CTRL>O` move forwards, backwards through jumplist
   * `:args **/*.mjs` load all js files into the args list
   * `:argdo %s/'src/'lib/gi | update` do a search and replace in all files in the args list
   * `:argdo normal @a` execute the macro in register a on all files in the args list
 * the power of g:
   * `:g/regex/norm wdw`: for all lines that match the regex execute the normal commands: (example will delete the second word)
 * Renaming variables:
   * `gd` - goto definition, then
   * `[{` - jump to scope that wraps the definition
   * `v%` - visually select whole scope
   * `:s/var/newvar/g` - within selection do the replacement
   * NOTE: `gr` will do all above and land in the `:s` command waiting for you to type your new variable name
 * `ReaderMode` and `ReaderModeOff` - distraction free writing using `Goyo` and `Limelight`
   * `{` and `}` for next and previous paragraph
 * spell checking:
   * `:set spell` turn it on `:set nospell` turn it off
   * `]s` and `[s` move to next / previous misspelling
   * `z=` suggest an alternative
 * startify: `SSave` and `SSLoad` for sessions
 * `g>` or `g<` or `gs` - vim-swap arguments for reordering arguments
 * table mode: ` tm` toggle table mode - then markdown tables will auto-align on pipes. `||` will create horizontal line
 * diffing/merging:
   * `GetLeft` or `:diffget //2` get left changes
   * `GetRight` or `:diffget //3` get right changes
   * `GetRemote` or `:diffget RE` get remote changes
   * `GetLocal` or `:diffget LO` get local changes
   * `GetBase` or `:diffget BA` get base changes
   * `NextChange` or `]c` move to next change
   * `PreviousChange` or `[c` move to previous change
 * Terminal mode:
   * `terminal` to enter terminal mode
   * `i` to enter and `ESC` to leave
 * Fugitive:
   * `Gwrite` writes to disk + to index (like git add on working tree file or like checkout for history)
   * `Gdiff` show side by side diff between staged and working tree
   * `Gmove` does a git mv on file + renames buffer
   * `Gdelete` does a git rm on file + deletes buffer
   * `Gstatus` to see status and `-` against files to add/remove changes to index
   * `Gcommit` git commit (will bring up buffer to write message)
   * `GitPull` to pull changes
   * `GitPush` to push changes
 * Linting:
   * Neomake should lint on changes for eslint by default using local eslint install
   *  `<leader>j` to write,eslint fix,read current buffer
 * Expression register
   * `<C>r` in insert mode to e.g. do arithmetic: `<C>r=2+2` will insert `4`
   * `"=` in normal mode e.g. past in local timestamp: `"=strftime("%c")<CR>p"
   * when in command line to paste a register use `<C>r"` e.g. if the word foo is in the default register, replace foo with bar in whole document like: `%s/<C>r"/bar/g`
   * `Sum` will take a sum (ending in a space) and replace it in the buffer with the answer
 * Easy motion:
   * `<leader>s` move to char char in all visible buffers
   * `<leader>c` move to character in all visible buffers
   * `<leader>w` move to word in all visible buffers
   * `<leader>l` move to line in all visible buffers
   * `<leader><leader>sx` move to character x in view in current buffer
   * `<leader><leader>w` move to word from cursor or `b` behind cursor in current buffer
 * FZF - fuzzy file searcher
   * `<leader>p` or `CTRL-P` maps to GFiles - fuzzy filename searcher in whole of git repo
   * `Files PATH` search in all folders from cwd
   * `GFiles PATH` search in tracked folders from git root
   * `Commits` search through commits
   * `BCommits` search through commits for the current buffer
   * `History:` search through vim command history
   * `Lines` search through lines in loaded buffers
   * `BLines` search through lines in current buffers
 * Grep/ AG - text searcher
   * `<leader>g` alias to `Gag`
   * `GGrep text` search in all tracked files using git grep
   * `Ag text` search in current folder with preview
   * `Gag text` search in all tracked files using Ag with preview
   * want non fuzzy searching? prefix search with a `'`

