#### git workflow

<div align="center">
  <img src="https://user-images.githubusercontent.com/93719632/231290188-a4245eb4-bbca-408e-bc10-43b62c5ffad3.png" width="600">
</div>
  
💖 [see](https://www.doabledanny.com/git-workflows)
<br><br>

#### forking

1. fork a branch
2. `git remote add upstream git@github.com:adrianHards/rails-guide.git` add the remote, call it "upstream"
3. `git fetch upstream`
4. `git checkout main` 
5. `git rebase upstream/main` modify your main branch such that any commits you've made that are not already present in upstream/main will be applied on top of it. This effectively rewrites the history of your branch, making it look as though your changes were made directly on top of the latest version of upstream/main.

#### git remote
1. create a repo on gitHub
2. `git init` in folder on local machine
3. `git remote -v` to check if there are any remotes (a remote is simply a record in a local repository that it's linked to another one)
4. `git remote rm origin` remove origin from your remotes if necessary
5. `git remote add origin <YOUR_REPOSITORY_ADDRESS_HERE>` modifying .git/config file in your local repository to link to your GitHub repo
6. `git push -u origin main` transfer the code from the local repository to the one on GitHub
* the `-u` switch means that these parameters should be saved as default, so next time you won't have to type "origin main", we can simply type 'git push'

#### git init
`git init` git creates a hidden directory called `.git` that it uses to track all changes to the files in the directory <br>
`rm -rf .git` to remove this file <br>

#### git add -p
`git add -p` to stage parts of a changed file; 
> `y` stage the chunk
> `n` ignore the chunk
> `s` split it into smaller chunks
> `e` manually edit the chunk
> `q` to exit.

#### git stash
Accidentally been working in your master branch?
* `git stash`
* `git checkout -b new-branch`
* `git stash pop` to bring over all of the changes you made in the master branch into the new branch 

#### git commit
##### [git revert or git reset](https://www.freecodecamp.org/news/git-revert-commit-how-to-undo-the-last-commit/)
`git reset --soft HEAD~1` if commit exists only on local; will re-write commit history! <br>
`git revert <commit to revert>` if commit exists remotely; use `git lg` to find commit you want to revert to <br>

#### git merge
if the terminal asks you to enter a message:
1. press `i` for insert
2. write your merge message
3. `esc` to escape
4. type `:wq` to write & quit
5. hit `enter`
<br><br>

If you have made a PR and there are conflicts, it is better to resolve them locally. 
1. `git pull origin main`
2. `git checkout pr-branch`
3. `git merge main` 
<br>

If there are changes on main you don't want to bring over, then do the following instead:
1. `git pull origin main`
2. `git checkout -b resolve-conflict`
3. `git merge pr-branch`
4. resolve conflicts, `git add` and `git commit --no-edit` (commit using the default commit message)
5. `git checkout pr-branch`
6. `git merge resolve-conflict`

<br>

#### git branch
`git checkout branch-name` to switch to a local branch <br>
`git checkout -b name-of-branch` create new branch and immediately check into it <br>
`git branch -m new-branch-name` change name of current branch <br>
`git branch` to see all local branches <br>
`git branch -r` to see all remote branches <br>
`git branch -a` to see both local and remote branches <br>
`git branch -d branch-name` to delete a local branch <br>

##### switch to a remote branch
1. `git pull`
2. `git checkout --track origin/branch-name`

##### setup remote connections
`git remote -v` <br>
`git remote add origin https://github.com/....git` <br>

#### git checkout
`git checkout --patch main` checkout specific hunks or lines from a file in the "main" branch from branch you're in

<br><br>
#### git reset
resetting your local main to remote <br>
1. create a branch and backup your work before `git checkout main`
2. `git fetch origin`
3. `git reset --hard origin/main` to reset the local main branch to the remote repository
4. `git clean -n` to see which files will be deleted  <br>
5. `git clean -xdf` `-x` removes ignored files, `-d` removes untracked folders, `-f` removes untracked files
<br><br>
#### git diff
`git diff branch1..branch2` see all differences between two branches <br>
`git difftool` to see differences in VSCode (assuming you have it set up in `code ~/.gitconfig`)
<br><br>
#### git status
<br><br>
#### git log
`git cherry -v main` to see logs of branch you're in
`git lg` to see single 
<br><br>

#### RSpec
`bundle exec rspec spec/models/filename_spec.rb` to run a specific file <br>
note, `bundle exec` will run specific versions of Ruby and gems that are specified in your application's Gemfile
<br><br>
