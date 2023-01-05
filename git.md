#### git workflow
💖 [see](https://www.doabledanny.com/git-workflows)
<br><br>

#### git merge
if the terminal asks you to enter a message:
1. press `i` for insert
2. write your merge message
3. `esc` to escape
4. type `:wq` to write & quit
5. hit `enter`
<br><br>

#### git branch
`git checkout -b name-of-branch` create new branch and immediately check into it <br>
`git branch -m new-branch-name` change name of current branch
<br><br>
#### git reset
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
