# Git , Github Cheat Sheet

## 📋 Table of Contents

1. [Create Repository / ساخت مخزن](#create-repository)
2. [Make a Change / ایجاد تغییر](#make-a-change)
3. [Diff / تفاوت‌ها](#diff)
4. [Merge & Rebase / ادغام و ریبیس](#merge--rebase)
5. [Configuration / تنظیمات](#configuration)
6. [Log / تاریخچه](#log)
7. [Working with Branches / کار با شاخه‌ها](#working-with-branches)
8. [GitHub](#github)
9. [Temporary Commits / کامیت‌های موقت](#temporary-commits)
10. [Files / فایل‌ها](#files)
11. [Example / مثال](#example)

## Create repository

### create a new repository

```bash
git init [project name]
```

### Clone a repository

```bash
git clone [git_url]
```

### Clone a repository into a specified directory

```bash
git clone git_url my_directory
```

## Make a change

### Show modified files in working directory, staged for your next commit

```bash
git status
```

### Stages the file, ready for commit 

```bash
git add [file]
```

### Stage all changed files, ready for commit

```bash
git add .
```

### Commit all staged files to versioned history

```bash
git commit -m "commit message"
```

### After changing the file, before git add

```bash
git restore [file]
```

### After add, before commit

```bash
git restore --staged --worktree file
```

### Revert to Specific commit

```bash
git reset --hard <commit-hash>
```

> like this git `reset --hard HEAD~1` (Revert to the previous commit (the latest commit is removed))

> `git reset --hard` = `git restore --staged --worktree file`

> If used after a commit, the commit is completely removed, and there is no way to revert the action.

## Diff

### Diff before add

**The content was initially 'A' and was committed. Now** 

after that we change file

```bash
git diff
```

### Diff before commit

after add 

```bash
git diff --staged
```
> `git diff` show nothing

### Diff after commit (Difference between the latest commit and the previous one)

afetr commit

```bash
git diff HEAD~1 HEAD
```
> `git diff --staged` show nothing

> `git diff hash1 hash3`

> `git diff HEAD~2 HEAD`

## merge--rebase

### Merge with the commit

```bash
git rebase [branch]
```
### Merge without the commit

```bash
git merge [branch]
```

## Configuration

### Set the name that will be attached to your commits and tags

```bash
git config --global user.name "name"
```

### Set an email address that will be attached to your commits and tags

```bash
git config --global user.email "email"
```

### Enable some colorization of Git output

```bash
git config --global color.ui auto
```

### Edit the global configuration file in a text editor

```bash
git config --global --edit
```
 
## log

### see log

```bash
git log
```
> full

```bash
git log --oneline
```

> without the delete commits with rebase , ...

```bash
git reflog
```

> with the delete commits with rebase , ...

```bash
git log branchB..branchA
```

> Show the commits on branchA that are not on branchB

```bash
git log --follow [file]
```

> log Specific file

## Working with Branches

### List all local branches

```bash
git branch
```

### List all branches, local and remote

```bash
git branch -av
```

### change branch

```bash
git checkout [branch]

git switch [branch]
```

### create branch and switch to this

```bash
git checkout -b [new-branch]

git switch -c [new-branch]
```

### delete branch

```bash
git branch -d my_branch
```

## github

### add git to github

```bash
git remote add origin [url]
```

### repo name

```bash
git remote
```

### delete repo

```bash
git remote rm [remote repo name]
```

### change branch name

```bash
git branch -m main
```

> change master to main

### send to github

```bash
git push
```

> for first `git push -u origin main` after that just `git push`

### receive from git

```bash
git pull
```

> `git pull origin master` everything in master branch it take

## Temporary Commits

before commit

### You are working on a branch but suddenly need to switch to another one; by running this command, you temporarily store your changes in a "box."

```bash
git stash
```

### back to before stash

```bash
git stash pop
```

### see the list

```bash
git stash list
```

## files

### ignore file

**.gitignore**

This file lists the files we don't want to push to GitHub.

> like:

>> *.log          #any file with .log Suffix

>> !main.log 	  #except this file

### delete files

```bash
git rm [file]
```

# EXAMPLE

```bash
mkdir main
cd main
git init 
ls -la

nano README.md
#This is my git

git remote add origin [url]
git branch -M main

git status
git add .
git commit -m "create README file and modified"
git push -u origin [url]
```

> *`for other time git push`* 
