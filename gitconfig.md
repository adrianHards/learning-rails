#### Le Wagon config
[See](https://github.com/lewagon/dotfiles/blob/master/gitconfig) for custom terminal commands, such as `git lg` and `git sweep`
<br><br>

#### Using VSCode to resolve conflicts and see differences
VSCode gives us access to a [merge editor](https://code.visualstudio.com/updates/v1_69#_3-way-merge-editor). Alternatively, we can run something similar from our terminal. First `code ~/.gitconfig` add the following:

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

now, whenever you run `git mergetool` or `git difftool` from your terminal, you can resolve conflicts or see differences between files in VSCode, respectively.
