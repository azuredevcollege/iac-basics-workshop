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
gpgsig -----BEGIN PGP SIGNATURE-----

 iQIzBAABCgAdFiEECZZlQTbRTKphEQxPO1NwAqjBl7MFAmBu1XsACgkQO1NwAqjB
 l7P6wxAAlwEXptmBm6cnf0nY4nv/qkqqf1In5jJCQjDw67U+Fv2kfdQlKYS7Jz20
 xdAU1sBEpbGgiKE2SaO71QyAgGH2O2dTJYGw/MIOXq+VGDCgC9hdpefJTAX6OAE6
 2KPsKfCaRw8DqzNPjpUgS2kxxFECag6/cYy/6nV9VfFLdoMP2jTftigoKhjS5tCa
 Ot/nmmgR9Oc6G2g3Xg1OHSwYsrSW3hv+uxJKXPVFT8IEtDm8YApJGouWhukkFeb1
 ehD/weH/QoWxJOz7tHZG4nWjEmpk5wPkXq+vP/Sxco8sGetYs6lJ24wgqNW7jwA2
 QfxtsHptD7RQgMP6emk5hH6S5agt1pWB8dt8CMfoVMfX+Bx5gPZPrEzkvXXffId6
 T//h0zhSeneFOco3Yoj4XA/aFZ/xaaPRrN2nW+ErwKZuCjv0SpU2Y1Dm86dWQo2O
 k1tUJ4R53OTfz+HUr9OBSNXCyENw+agVg6HJq0xmD6zbauI1s9au00bhIVvx+9SG
 edzDuEHwI8K5VGamAq4T0PPs/r+jW46duSFUQXj92EyE3TsycZ1bVvAl/rOCLjbb
 9lsDv9fZWvYl1PmYonYlUpkOn4E/DZyq/ZDaGnK/280jBmKY0OjwaSVSgRmXDSAZ
 HvGtQTgT8zLJ1EPZ9Bs4Tx6rAJpFm+xSS2AfMuyZWWc+GSBoCVQ=
 =uwzb
 -----END PGP SIGNATURE-----

third commit
```
