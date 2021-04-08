# Git Basics

In this section we will provide you a brief introduction to git as well as
some additional materials for self study

## How to create sample tree

```shell
$ mkdir git-basics
$ cd git-basics
$ git init
Initialized empty Git repository in /home/<username>/git-basics/.git/

$ echo "version 1" > test.txt
$ git add test.txt
$ git commit -m "first commit"
[master (root-commit) fdf4fc] first commit
 1 file changed, 1 insertion(+)
 create mode 100644 test.txt

$ echo "new file" > new.txt
$ echo "version 2" > test.txt
$ git add new.txt test.txt
$ git commit -m "second commit"
[master cac0ca] second commit
 Date: Thu Apr 8 11:50:56 2021 +0200
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 new.txt
$ git branch test

$ mkdir bak
$ echo "version 1" > bak/test.txt
$ git commit -m "third commit"
[master 1a410e] third commit
 1 file changed, 1 insertion(+)
 create mode 100644 bak/test.txt
```

![refs-tree](./images/refs-tree.png)

```shell
$ git cat-file -p master
tree 3c4e9cd789d88d8d89c1073707c3585e41b0e614
parent 324177edbf6d0ae3f12d657302f2627d6347c2c6
author Clemens Wältken <clemens.waltken@microsoft.com> 1617876347 +0200
committer Clemens Wältken <clemens.waltken@microsoft.com> 1617876347 +0200

third commit
```
