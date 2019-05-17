# dotfiles

"My mac setup"

## pre-requisites

 * only works on macos atm
 * repo must be cloned into ~/dotfiles
 * git must be installed
 * xcode (`xcode-select --install`) (cos brew uses it)

Then you can just run `./fullsetup` if you are brave which attempts to automate the pre-install/ running it then post-install steps...

## pre-install steps

 * brew (`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`)
 * install zsh first (otherwise your symlink will get overwritten) with `brew install zsh`
 * then oh-my-zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

## running it

Just run `./link-dotfiles` to symlink all the 'dotfiles' (configuration)

 * symlink the config files

## post-install steps

### vim

 * pull down vundle repo for running vim plugins (`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`)
 * install the plugins: run `vim +PluginInstall +qall`

### nvim

 * `brew install neovim`

### node

 * `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash`
 * `nvm install`

## TODO

 * for neovim:
   * sort out eslint exe error
   * ensure ctags imports works with gdw monorepo @imports?
   * does ctags work across files for goto def in project?
   * Ag and Gag - ignoring .files?
   * is Gag ignoring .gitignore files?
   * `Gag cheat` does not work when in root dir - does Gag not search files in current dir only child dirs?
   * set tab for autocomplete in insert mode
   * update cheatsheet with:
     * easymotion
     * autocompletion
     * linting - use of loclist
     * searching in files - use of loclist
 * terminal - use hyper?
   * italics support?
   * better font?
 * update cheat sheet with at least fzf and ag usage from command line as well as vim
