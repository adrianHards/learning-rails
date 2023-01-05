#### git workflow
[see](https://www.doabledanny.com/git-workflows)

#### git branch
`git branch -m new-branch-name` change name of current branch
<br><br>
#### git reset
1. `git fetch origin`
2. `git reset --hard origin/main` to reset the local main branch to the remote repository
3. `git clean -n` to see which files will be deleted  <br>
4. `git clean -xdf` `-x` removes ignored files, `-d` removes untracked folders, `-f` removes untracked files
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
