#### git workflow
💖 [see](https://www.doabledanny.com/git-workflows)
<br><br>

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
`git difftool` to see differences in VSCode (assuming you have it set up in `code ~/.gitconfig`)
<br><br>
#### git status
<br><br>
#### git log
`git cherry -v main` to see logs of branch you're in
`git lg` to see single 
<br><br>

#### RSpec
`bundle exec rspec spec/models/filename_spec.rb` to run a specific file
<br><br>
