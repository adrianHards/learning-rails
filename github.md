- [Best Practices](#best-practices)
- [Typical Workflow](#typical-workflow)
- [Pull Requests](#pull-requests)
- [Merge Conflicts](#merge-conflicts)
- [I Need To](#i-need-to)
  - [Create A Branch](#create-a-branch)
  - [Go Back To Main](#go-back-to-main)
  - [Clean Up Merged Branches](#clean-up-merged-branches)
  - [Git Status, yellow x]
  - [Add]
  - [Commit]
  - [Unstage]
  - [Pull Master]
  - [Push Branch]
  - [Merge Master]
  - [Fetch remote]
  - [Remote]

---

### Best Practices

<p align="center"><a href="#top">⬆</a></p>

---

### Typical Workflow

```
# update your local main
git pull origin main

# make a new branch named after the feature you're about to work on
git checkout -b new-branch

# commit early and often! It's easier to rollback to an earlier commit
git add .
git commit -m 

# git reset or revert?

# check git status
git status

# [new-branch] git pull origin main

# git checkout main

# [main] git pull origin main

# git checkout new-branch

# git merge main
```

<p align="center"><a href="#top">⬆</a></p>

---

### Pull Requests

<p align="center"><a href="#top">⬆</a></p>

---


### Merge Conflicts

Source control

<p align="center"><a href="#top">⬆</a></p>

---

### I Need To
Some of following will assume you have modified your `.gitconfig` file (found in your root `cd ~` `ls -a`) to include the [following](https://github.com/ssaunier/dotfiles/blob/master/gitconfig) <br><br>

#### Create A Branch
`git branch name-of-branch` or <br>
`git checkout -b name-of-branch` to create and checkout the branch <br><br>

#### Go Back To Main
`git checkout main` <br><br>

#### Clean Up Merged Branches
`git sweep`

<p align="center"><a href="#top">⬆</a></p>
