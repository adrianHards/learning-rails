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
<br><br>

### References

#### Git Workflow
- 💜 [Typical Workflow](https://www.doabledanny.com/git-workflows) <br>
- [good habits when working in a team](https://betterprogramming.pub/six-rules-for-good-git-hygiene-5006cf9e9e2)

#### Rebase

- [Illustration: Git Rebase vs Merge](https://www.gitkraken.com/learn/git/problems/git-rebase-vs-merge) <br>
- 💜 <img style="width:25px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Stack_Overflow_icon.svg/1024px-Stack_Overflow_icon.svg.png?20190716190036">[What's the difference between 'git merge' and 'git rebase'?](https://stackoverflow.com/questions/16666089/whats-the-difference-between-git-merge-and-git-rebase/16666418#16666418) <br>
- <img style="width:25px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Stack_Overflow_icon.svg/1024px-Stack_Overflow_icon.svg.png?20190716190036">[What's the difference between git pull and git pull --rebase](https://stackoverflow.com/questions/18930527/difference-between-git-pull-and-git-pull-rebase) <br>
- [Stop using git pull, use git fetch and git merge instead](https://longair.net/blog/2009/04/16/git-fetch-and-merge/) <br>
- [git pull --rebase vs --merge](https://sdq.kastel.kit.edu/wiki/Git_pull_--rebase_vs._--merge) <br>

#### Squash

- 💜 <img style="width:25px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Stack_Overflow_icon.svg/1024px-Stack_Overflow_icon.svg.png?20190716190036">[What is the difference between merge --squash and rebase?](https://stackoverflow.com/questions/2427238/what-is-the-difference-between-merge-squash-and-rebase)
- [How to squash your commits](https://www.git-tower.com/learn/git/faq/git-squash) <br>
