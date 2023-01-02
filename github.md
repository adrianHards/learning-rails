- [Best Practices](#best-practices)
- [Typical Workflow](#typical-workflow)
- [Pull Requests](#pull-requests)
- [Merge Conflicts](#merge-conflicts)
- [I Need To](#i-need-to)
- Git Commit Conventions
  - [Create A Branch](#create-a-branch)
  - [Go Back To Main](#go-back-to-main)
  - [Clean Up Merged Branches](#clean-up-merged-branches)
  - [Git Status, yellow x]
  - Git rebase
  - Git squash
  - [Add]
  - [Commit]
  - [Unstage]
  - [Pull Master]
  - [Push Branch]
  - [Merge Master]
  - [Fetch remote]
  - [Remote]

# git reset or revert?

---

### Best Practices

<p align="center"><a href="#top">⬆</a></p>

---

### Typical Workflow

1. update your local main <br>
`git pull origin main`

2. make a new branch named after the feature you're working on <br>
`git checkout -b new-branch`

3. commit early and often! It's easier to rollback to an earlier commit <br>
`git add .` <br>
`git commit -m`

4. check git status <br>
`git status`

5. we can either `git push origin new-branch` or from the new-branch directory, `git pull origin main` <br>

6. our new-branch may have conflicts with main which we must now resolve. 


# git push origin new-branch

# go to github and make a new PR

# review each other's code; leave comments

# git checkout main

# [main] git pull origin main

# git checkout new-branch

# git merge main


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

The following isn’t complete, but a good starting point on how to work together:
* update your local main
git pull origin main
make a new branch named after the feature you’re about to work on
git checkout -b new-branch
commit early and often! It’s easier to rollback to an earlier commit
git add .
git commit -m
check git status
git status
update your branch with latest main. Alternatively checkout your main branch, update it there, go back to your new branch and merge with your local main
git pull origin main
resolve conflicts with main using Source Control in VSCode
once resolved, make a new PR
git push origin new-branch
go to GitHub and make a new PR. Talk to each other about what you did. Have someone else read through your code and approve your PR. Merge your own PR once approved
go back to main and merge latest changes
update Heroku after a PR has been merged!
