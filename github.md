### Using VSCode to resolve conflicts and see differences

As of June 2022, VSCode gives us access to a [merge editor](https://code.visualstudio.com/updates/v1_69#_3-way-merge-editor). Alternatively, we can run something similar from our terminal. First `code ~/.gitconfig` add the following:

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

to see only the logs of the specific branch you're in <br>
`git cherry -v main`

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
