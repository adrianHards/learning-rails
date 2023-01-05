##### remove local untracked files
`git clean -n` to see which files will be deleted  <br>
`git clean -f` to delete files  <br>

### Using VSCode to resolve conflicts and see differences

As of June 2022, VSCode gives us access to a [merge editor](https://code.visualstudio.com/updates/v1_69#_3-way-merge-editor). <br>
Alternatively, we can run something similar from our terminal. First `code ~/.gitconfig` add the following:

```c#
[merge]
  tool = code
[mergetool "code"]
  cmd = code --wait --merge $REMOTE $LOCAL $BASE $MERGED
[mergetool]
  keepBackup = false

[diff]
  tool = code
[difftool "code"]
  cmd = code --wait --diff $LOCAL $REMOTE
```

now, whenever you run `mergetool` or `difftool` from your terminal, you can resolve conflicts or see differences between files in VSCode, respectively.
<br>

#### Other useful commands:

- to see only the logs of the specific branch you're in <br>
  `git cherry -v main`
- `git pull --rebase origin main`

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
