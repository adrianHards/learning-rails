#### Using VSCode to merge and see differences
`code ~/.gitconfig`
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


#### Git Workflow

[Workflow](https://www.doabledanny.com/git-workflows)
[Git hygiene](https://betterprogramming.pub/six-rules-for-good-git-hygiene-5006cf9e9e2)

#### Rebase

[git rebase main](https://riptutorial.com/git/example/1211/local-branch-rebasing)
[git rebase vs git merge](https://stackoverflow.com/questions/16666089/whats-the-difference-between-git-merge-and-git-rebase/16666418#16666418) <br>
[git rebase or git merge, kraken](https://www.gitkraken.com/learn/git/problems/git-rebase-vs-merge)
[git pull vs git pull --rebase](https://stackoverflow.com/questions/18930527/difference-between-git-pull-and-git-pull-rebase) <br>
[don't use git pull](https://longair.net/blog/2009/04/16/git-fetch-and-merge/) <br>
[best practice](https://sdq.kastel.kit.edu/wiki/Git_pull_--rebase_vs._--merge) <br>
[merge --squash vs merge --rebase](https://stackoverflow.com/questions/2427238/what-is-the-difference-between-merge-squash-and-rebase) <br>

#### Squash

[how to squash](https://www.git-tower.com/learn/git/faq/git-squash) <br>
