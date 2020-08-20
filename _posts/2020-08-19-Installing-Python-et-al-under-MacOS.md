---

layout: post
title: "Doing Python development under Mac OS"
permalink: install-python-MacOS
tags:

 - development
 - python
 - tox
 - pyenv
 - bootstrap
---

tl;dr? [Jump right to the recipe](#just-the-recipe)

For reasons lost in the mists of time, I've been a Mac guy since 2013 - but I've been a command line (CLI) guy since 1990 (or earlier, hard to remember), and still am. A few years ago, I discovered [brew, aka homebrew](https://brew.sh) after finding out how out-of-date were so many of the standard UNIX/Linux tools included with Mac OS, e.g., bash.

Generalizing, the hardest part of working with the CLI on a Mac is having the same experience on all the platforms I use, which range from Windows 10 with WSL (some flavour of Ubuntu, cannot remember which), RHEL 7.6, Fedora 32, Mac OS 10.15, and Cygwin - and that problem persists across those other platforms, which is why [I created a GitHub project to keep my dot files in snc](https://github.com/PeterWhittaker/myDotFiles).

Well. Until the last few days.

Since last week I've been using the [most excellent Yamale](https://github.com/23andMe/Yamale) to validate YAML schema I've defined for my [SELinux Linear Assured Pipeline](https://github.com/PeterWhittaker/LinearAssuredPipeline). I've even made some contributions to it - or, at least, am in the process of so doing...

...and that's where things get weird.

Yamale depends upon Python and [pip](https://pypi.org/project/pip/), the Python package manager, and upon [tox](https://tox.readthedocs.io/en/latest/#), a test automation framework for Python  - but **standard Mac OS has neither `pip` nor `tox`**. OK, so `brew install pip` and `brew install tox`, right? Well, almost.

This is where things can get a little weird. Yamale's `tox.ini`, for example, depends upon two different versions of Python, `3.6` and `3.8`.

How does get multiple versions of Python? The short answer is [pyenv, a python-independent shell-script based system for managing multiple Python environments](https://github.com/pyenv/pyenv). But that's not the whole story.

This [page intends itself as the correct answer](https://opensource.com/article/20/4/pyenv) - install `pyenv` and go! - but it is lacking a step, as I discovered - and I discovered that page [from this page](https://opensource.com/article/19/5/python-3-default-mac), which tells us what we might do wrong, then what we should do to get things right - but a bootstrap problem remains....

The first page wants us to run `pip install pyenv` - but Mac OS lacks `pip`. The second page has a few brew-based recipes, but suggests that `brew` is the wrong way to go, overall, and that we really want `pyenv`. This [third page](https://opensource.com/article/19/6/python-virtual-environments-mac) tries to put things succinctly, but if you're running `tox`, there is **YAS** (Yet Another Step): By default, `tox` works only with your default Python environment, whether that is standard or something installed via `brew`.

To get `tox` to work with multiple Pythons out of the box, you need [tox-pyenv](https://pypi.org/project/tox-pyenv/) - but **that** page mentions a lot of irrelevant `Circle CI` stuff.

```
Before we go any further, I should note that whatever you do
with brew - or with gem, if you get there - do NOT override
system defaults - Mac OS and many utilities produced for the
Mac depend upon them. Let brew manage things and install them
cask-only. You then need to find them via appropriate manipulation
of PATH, CPPFLAGS, LDFLAGS, etc. Cf my dot file project for
one way of doing this.
```

At any rate, none of those pages provide the complete answer. You know that you need
- Python (and possibly multiple versions of Python)
- `pip` (not included with Mac OS)
- `tox`, which depends upon `pip`
- `pyenv`, which you can get a number of ways....
- `tox-pyenv`, which depends upon `pip`....

So what is one to do? Install `pyenv` and use it to install `pip` and `tox` and `tox-pyenv` several times over? That seems so....

UGH.

I repeat.

UGH.
====

I don't know that what follows is a universally-accepted approach, but it is the shortest and cleanest path to where I needed to go (as verified by running `make clean; make` in my `yamale` top-level folder and having all `tox` tests work out-of-the-box with both Python `3.6` and `3.8`, no modifications to `yamale` files required...).

So, [YMMV](http://onlineslangdictionary.com/meaning-definition-of/ymmv) and [FWIW](http://onlineslangdictionary.com/meaning-definition-of/fwiw), here is....

### Just The Recipe
```
# install brew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# use brew to install python3, which comes with pip3
$ brew install python3          # let brew install this cask-only
# figure out your path to pip3, installed with python3
$ <path to pip3> install tox
# install py-env using brew
$ brew install py-env
$ <path to pip3> install tox-pyenv
```

Once you've done that, figure out what versions of Python your particular `tox.ini` specifies; for `yamale`, these are `3.6` and `3.8` which I've mentioned a few times already.... Assuming these are what you need, the rest of your recipe is as follows:
```
$ brew install pyenv
$ pyenv install 3.6
# lists multiple versions, choose appropriate minor #, e.g.,
$ pyenv install 3.6.11
$ pyenv install 3.8
# lists multiple versions, choose appropriate minor #, e.g.,
$ pyenv install 3.8.5
# almost there, now we want to use what we just installed
$ cd <where Yamale lives>
# have pyenv set the versions of python tox should use
$ pyenv local 3.6.11 3.8.5
# that command creates a ./python-version file, which
# is already in ./gitignore! Now confirm those....
$ pyenv version
```
In my case, the latter command shows
```
3.6.11 (set by /Users/pww/pipelineWork/yamale/.python-version)
3.8.5 (set by /Users/pww/pipelineWork/yamale/.python-version)
```
pyenv which shows me what I expected:
```
$ pyenv which python3.6
/Users/pww/.pyenv/versions/3.6.11/bin/python3.6
$ pyenv which python3.8
/Users/pww/.pyenv/versions/3.8.5/bin/python3.8
```

Now. Run `make clean; make` and all should be well.

It was for me, at least.

Easy-peasy. Right?

Right.

