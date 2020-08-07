---

layout: post
title: Well, I'm back
permalink: well-im-back
tags:
  - blog
  - colophon
  - GitHub
  - Process
  - humanity

---

# Five years is a long time. Why stop? Why start again? And why was restarting so (technically) painful?

<p class="lead">tl;dr It was 2014; I thought I should learn git and GitHub - didn't use it, just thought it would be cool. The blog was a practical exercise in both. I'm not sure why I kept it going (not that it went very long). Work changed. Life changed. Now I use git on work's self-hosted GitLab sometimes weekly, sometimes hourly: I needed to step up my git game. Looking up a very specific how-to dropped me into a four day rabbit hole....</p>

For most of the last 20 years, I've been a consultant. Work inputs were meetings, site inspections, emails, phone calls, interviews both formal and informal, and reams of policy and procedure documents. Deliverables were documents and presentations and emails. Mostly.

2014 began the same way, but looked to become more technical. I'd been curious about git for some time, but had neither work need nor leisure time (foreshadowing: life changes) to make any effort. With the 2014 work becoming more technical, that looked to change. I'd also *always meant* to start a blog, so, brace of birds, single rock, and all that. Yay, the blog was born. There was much rejoicing.

Actually, there were pretty much crickets. I didn't feel badly about that, many blogs are ignored. Many blogs also peter out over time, so I didn't feel too badly about that, either (well, sort of kind of? More *life change* foreshadowing, duh duh daaaaah).

Fast forward to earlier this year: A consulting gig has me coding. February and March find me in the basement typing away for 10 to 12 hours a day, 6 or 7 seven days a week. I was in heaven - the beginning of lockdown went largely - but not entirely - unnoticed for me. Yes, I have the most patient girlfriend in the world, she is sweet and adorable and understanding (queue *life change* foreshadowing minor key).

That coding involved git. Just basic stuff, trying to get my head around git pull, git add, git commit, and git push. Branches were a step too far, as was using SSH.

That was then (has it really only been five months?). That consulting gig morphed into full-time employment, the first time I have been an employee since 2001 (2013-2014 kind-of/sort-of had employment, but not really, that was a strange period... ...maybe one day I'll share an askari story (there's a pun there; I quite like it; grokking it requires knowing the story; maybe one day; I digress...)).

That [full time job](https://www.sphyrnasecurity.com) is a mix of marketing, marketing management (mostly product/roadmap), client liaison, prospect management, business development, and hands-on. Instead of writing this, I should probably be working on the compliance platform User Acceptance Plan for one customer; or SELinux linear channel controls for two customers; or the cloud-based compliance platform demonstrator; or a few other things... (I've got GitLab issues aplenty assigned to me...).

A few days ago, I thought it would be a good idea to upload my SSH public key to the company GitLab and use that instead of passwords. My git/GitHub/GitLab isn't yet second nature, so a lot of comparatively simple things require research and reminders - and I dislike breaking things through my own ignorance, so off to GitHub I went to remind myself how to upload SSH keys, etc.

In noodling through my account settings, I noticed that all of the security and analysis features were disabled and I said to myself, "Self, why are these off? Surely they are a good idea!". Self thought this was very reasonable, did a bit of poking about, satisfied itself that CHECKING ALL THE BOXES!!! was a good idea, and did so....

The emails began to arrive seconds later.

I don't have a lot of code in GitHub, mostly personal stuff, very few forks. Some of that code failed one Dependabot test or another....

This blog is hosted on GitHub. It hadn't been updated in six years. There were, uh, vulnerabilities and out-of-date code aplenty.

And the blog broke. Pagination broke. Application of CSS broke. A lot of things broke.

It was embarassing, really. I had to fix it. I just *had to!!!*

There were a few basic issues:

 * Out of date code, mostly Jekyll
 * GitHub pages had stopped supporting
   * relative links
   * the markdown engine I'd been using
   * URL specifications such as `{% raw %}{{ site.baseurl }}{% endraw %}`
 * The IP addresses for custom domains had changed

The last of those generated build warnings; the first few build failures. I'm not a Ruby guy, so it took a while to find everything and figure things out... ...but I couldn't even start figuring things out until I updated my Mac OS development environment... ...which I didn't realize I had to do for a while.

## A digression - how to manage `dot files` across multiple machines

On any given day, I might work on any or all of two Macs (my ancient Air, my work Mini); one or more Linux VMs on the Mini (my Fedora SELinux VM; CentOS or Fedora VMs for the compliance automation platform); one or more customer RedHat VMs for one of my contracts; and WSL, the Windows Subsystem for Linux.

### A digression within a digression - WSL is awesome

Until PowerShell, Windows shells sucked. PWSH changed that. It's powerful, well-designed, and can be a lot of fun to use. But if one is mostly using Linux and bash, it can be a pain to make the mental switch from bash to PWSH and back again.

So I installed CygWin on a few Windows machines and it was OK. Pretty good. Not great. Somewhere along the way, WSL popped onto my radar as I was intrigued. "Huh. Real Linux? On Windows? Directly? *Can't be!!!*"

A little poking about, a little research, installation of WSL, installation of Ubuntu under WSL, *WHAM!*, real bash. Heaven!

### We now return to our regularly scheduled inception, er, digression

When I switch machines, I like to have the same `.vimrc`, the same bash prompt, the same `ls` defaults, etc.

At first, I was mucking about with Google Drive and uploading and downloading `.rc` files, but that was a real pain. I took a while to realize that I could a) reduce/eliminate that pain and b) learn more git, if I created a GitHub project [for my dot files](https://github.com/PeterWhittaker/myDotFiles).

One of the challenges of getting there was merging various `.rc` files. On Air, my `.bashrc` had a bunch of entries relating to things like Ruby, ICU4C, etc. I had no idea what they were, no idea why there were, so I commented them out: I didn't want in my environment things I didn't understand and didn't know why they were there. Pretty reasonable, I think.

## We will now pause the first digression

There was a lot of Googling to rediscover how to manage a Jekyll-based site on the Mac OS command line. IM(NS)HO, the Jekyll documentation runs at two levels, too basic and too complex. Much forensic guess work was involved.

Long story short, I started running various gem and jekyll commands and nothing was working.

Most notably, I could neither figure out nor remember what this `bundle` thing was nor how to find it.

## Another digression - keeping a Mac OS development environment up-to-date

I'd installed brew and a few other things in 2014 as part of getting the blog going in the first place. Sometime after that, for reasons lost in the mists of time, I installed node. Later, doing advisory and content development for [ClickArmor](https://www.clickarmor.com), Node was a great engine for testing some JS code I was hacking about. After a few false starts, I wrote a script to simplify my life:
```
$ cat ~/bin/update
#!/bin/bash

brew update
brew upgrade
read -p "Ready to continue with npm and node (ctrl-c to skip)? " answer
npm-check -u -g
npm-check -u
node -v
npm -v
$
```
It's basically an encapsulation of just-in-time reseach I knew I was likely to forget: Run the brew update and upgrade commands, let me decide whether or not to update node, which can take a while, run the necessary npm-check and node commands....

So far, so good.

## We will now pause the second digression

In puzzling out restarting blog management, I realized I needed a few gems - and that my gems were out of date. My first thought was to update my script...
```
...
brew update
brew upgrade
gem update
read -p "Ready to continue with npm and node (ctrl-c to skip)? " answer
...
```
This didn't work. At least not well. I kept getting this error:
```
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /Library/Ruby/Gems/2.6.0 directory.
```
More Googling revealed little/nothing of value, so I naively tried:
```
...
brew update
brew upgrade
gem update || sudo gem update
read -p "Ready to continue with npm and node (ctrl-c to skip)? " answer
...
```
Yay! No more errors! Great, right?!?!

Yeah, no, not so much.

I didn't have any errors, but the site still wasn't building.

I was lost, so I did what I probably should have done to begin with: careful inspection of all update/upgrade messages, wherein I noticed various brew indications about things being installed *cask-only*.

Distant bells began to ring, echoes from the past. Right. Mac OS includes a few things that one can also get from brew, notably herein, `gem`, but neither `jekyll` nor `bundle`.

More puzzling. Finally, **EUREKA!**

I needed to

1. Install Ruby via brew
2. Update my bash environment so that brew versions of various things appeared first in various paths

In other words, I was using the Mac OS versions of `gem`, etc., which are older, and wasn't picking up `bundle`, et al, at all.

Step the first was easy enough. Step the second got me looking through my `.bashrc`....

## Merging digressions the first and second

I wanted to manage my bash environment conservatively, only adding to it things that made sense on the machine in question. I'd made a start at that some time ago:
```
...
function isMacOS {
    false
}

function isLinux {
    false
}
...

case $OSTYPE in
    darwin*)
        function isMacOS {
            true
        }
        ;;
    cygwin*)
        function isCygwin {
            true
        }
        ;;
    linux-gnu*)
        function isLinux {
            true
        }
        case $(uname -r) in
            *Microsoft)
                function isWSL {
                    true
                }
                ;;
            *)
                :
                ;;
        esac
        ;;
    *)
        echo; echo "What OS is this?"; echo
        ;;
esac

```
Nothing terribly complicated, a few utility functions to help manage conditional inclusion of environment variables, paths, etc., based on platform.

Among other things, the `isMacOS` function appeared in that commented-out block of settings related to ICU4C, et al, mentioned above.

**Lightbulb flash**

Right, that's what those were for. All of that code was first added to my Air `.bashrc` to make sure I was using the brew versions of various utilities, so that I could build and test the blog locally before pushing it to GitHub. Riiiight!

Progress.

Did I enable all that code? No. I was tempted to. But conservative in code application, remember? I realized I wanted it to be conditional, based at least on whether or not various components were present.

This is what replaced the commented-out code (the path-bit bookends are included for completeness):
```
if [ -z "${PATH}" ]; then
    # there should be a default path, but in some weird cases, perhaps not
    # set a reasonable default
    PATH=/usr/bin:/bin:/usr/sbin:/sbin
    export PATH
fi

# Take full advantage of BREW, if on Mac OS and if it installed
if isMacOS; then

    # linked brew formula
    checkFor PATH /usr/local/bin
    
    # ic4uc items
    checkFor PATH "/usr/local/opt/icu4c/bin"
    checkFor PATH "/usr/local/opt/icu4c/sbin"
    checkFor LDFLAGS /usr/local/opt/icu4c/lib"
    checkFor CPPFLAGS /usr/local/opt/icu4c/include"

    # ruby items
    checkFor PATH "/usr/local/opt/ruby/bin"
    checkFor LDFLAGS "/usr/local/opt/ruby/lib"
    checkFor CPPFLAGS "/usr/local/opt/ruby/include"

    # python items
    checkFor PATH "/usr/local/opt/python@3.8/bin"
    checkFor LDFLAGS "/usr/local/opt/python@3.8/lib"
    checkFor PKG_CONFIG_PATH "/usr/local/opt/python@3.8/lib/pkgconfig"

    # openssl items
    checkFor PATH "/usr/local/opt/openssl@1.1/bin"
    checkFor LDFLAGS "/usr/local/opt/openssl@1.1/lib"
    checkFor CPPFLAGS "/usr/local/opt/openssl@1.1/include"
    checkFor PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

fi

# always prepend my bin, if it exists and is not already there
checkFor PATH ~/bin

```
The interesting bits:

1. Set a reasonable default PATH, if PATH is unset
2. If running on Mac OS, update various paths iff (if and only if) certain packages are present
3. If it isn't already there, prepend `~/bin` to my PATH

This works really, really well.

But what's this `checkfor` thing? I'm really pleased with this:
```
checkFor () {
    path="$1"
    want="$2"
    extras=$3

    if [[ -z "$path" || -z "$want" || -n "$extras" ]]; then
        echo "$FUNCNAME requires PATH WANT; called with '$path' '$want' $3; doing nothing"
        return 1
    fi

    # if the desired folder doesn't exist, return - nothing to add
    [[ -d "$want" ]] || return

    # if the wanted folder is in the path, return - nothing to add
    isInPath "$path" "$want" && return

    # we only get here if we need to add to the path
    # now we need to know what type of path it is
    case $path in
        PATH)
            export PATH="${want}:${!path}"
            ;;
        PKG_CONFIG_PATH)
            export PKG_CONFIG_PATH="${want}:${!path}"
            ;;
        LDFLAGS)
            export LDFLAGS="-L${want} ${!path}"
            ;;
        CPPFLAGS)
            export CPPFLAGS="-I${want} ${!path}"
            ;;
    esac
}
```
Fairly simple logic:

1. Check for the right number of arguments (two):
    1. The type of "path" to update (PATH, LDFLAGS, etc.);
    2. The folder to add to that "path"
    3. If there are three or more arguments, chances are that
        * The name of the folder "want" contains spaces and
        * That name wasn't quoted when passed to checkFor
2. If the folder "want" doesn't exist, do nothing (e.g., on a Mac where I don't run brew)
3. If the folder is already in whatever "path" it is, do nothing
    * `isInPath` is explained below
4. If
    1. all arguments are correct,
    2. "want" exists, and
    3. "want" isn't already in "path"
    add it to the appropriate path, with appropriate separation and prefix, if any

`checkFor` relies on:
```
isInPath () {
    path="$1"
    want="$2"
    extras=$3

    # we need exactly two arguments; anything else is probably a quoting problem
    if [[ -z "$path" || -z "$want" || -n "$extras" ]]; then
        echo "$FUNCNAME requires PATH WANT; called with '$path' '$want' $3; doing nothing"
        return 1
    fi

    # if $path is empty, $want obviously isn't present
    [[ -z "${!path}" ]] && return 1

    # replace any ~ with $HOME, to be on the safe side
    [[ "$want" == *"~"* ]] && want="${want/#\~/$HOME}"

    if [[ "${!path}" != *"$want"* ]]; then
        # echo "NEED: no '$want' in '${!path}'" 
        return 1
    else
        # echo "GOOD: '$want' is in '${!path}'"
        return 0
    fi
}
```
Again, fairly simple logic:

1. Check arguments
2. Return false if "path" is empty - if it's empty, we need to create it, which we do by assigning to in `checkFor`
    * Note the use of `${!path}` to cause "$path" to be replaced with the contents of whatever variable it represents, e.g., if $path==PATH, ${!path}==$PATH
3. Replace any `~` in "want" with the contents of `$HOME`, to simplify matching
4. Return
    1. false if "path" doesn't contain "want"
    2. true if it does

`checkFor` updates "path" only if `isInPath` returns false.

With that in place, I could update `~/bin/update` (remember that?). Long story short, it is now:
```
#!/bin/bash

echo Updating brew....
brew update
echo Upgrading brew....
brew upgrade
echo Updating gems
gem update
read -p "Ready to continue with npm and node (ctrl-c to skip)? " answer
npm-check -u -g
npm-check -u
node -v
npm -v
```
Notice that `sudo` isn't there anymore: with various environment variables set correctly, all of the updates take place in *the right place*, regardless of whether that's system-wide or keg-only: Whatever commands I run pick up the correct environment and do this right thing. Notably,
```
$ which gem
/usr/local/opt/ruby/bin/gem
$ which bundle
/usr/local/opt/ruby/bin/bundle
```
But these depend a on few more things we need to cover....

## You have reached the end of the first and second digressions

Somewhere along the line, I realized or remembered that building the site on my Mac required these two commands:

```
bundle install
bundle exec jekyll serve
```
Long story short, `bundle install` reads `Gemfile`, installs whatever is needed, and creates `Gemfile.lock` with the current list of dependencies. But I was still getting build errors whenever I did `git push githubio`.

Again, long story short, I realized a few things:

1. When resurrecting a six-year-old site, it's better not to have a `Gemfile.lock`, as it might confuse `bundle`, and
2. I was going to forget this.

## Enter the Makefile

I love `make`. I really miss the O'Reilly `make` book I lent to someone who quit the *Big Nerd Ranch* and took it with them a little while later. Anyway. Typing

```
make
```
doesn't save a lot of keystrokes, but
```
$ cat Makefile
all:
	@bundle install
	@bundle exec jekyll serve

clean:
	@rm Gemfile.lock
```

reminds me that `make` actually means `bundle install; bundle exec jekyll serve`, which means *run `bundle install`* to update everything then *run `bundle exec jekyll serve`* to launch Jekyll as a server so that I can find out a) if local builds succeed and b) if I like the look of the local version of the blog.

It also reminds me that running `make clean` can help resolve odd errors by removing `Gemfile.lock` and letting `bundle install` rebuild all dependencies.

If all goes well, I can then `git push` to GitHub and the site will be updated for the world to see.

(It just occurred that I could add a push rule to the Makefile. Cool. Maybe later.)

## Resurrecting digressions the first and the second, temporarily

One note: `make` expects real tabs in its makefiles, and I use all spaces in vim. This led to an `.vimrc` update:

```

syntax on
set nocompatible
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set ignorecase
set autoindent
set ruler
set showcmd
set visualbell
set nostartofline
set mouse=nvh

highlight Comment ctermfg=DarkGrey guifg=DarkGrey cterm=underline

*autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0*
```

The last line is key: If editing any kind of `Makefile`, change back to
 * hard tabs with the correct tab stop, and
 * a shiftwidth of 8, and 
 * do not expand to tabs to spaces or
 * use soft tab stops

I was very happy to find this.

## The digressions are dead. Long live the main post.

OK, that's an awful lot. What's the real *tl;dr*?

## Getting ready to build a Jekyll site on Mac OS

This is the shortest possible recipe, as I understand it:

1. Install the XCode command line tools if necessary
2. Install Ruby using brew
3. Update `.bashrc` so that your environment gets the correct paths
4. Update your brew installation and all your gems
5. Remove Gemfile.lock
6. Run `bundle install`
7. Out of an abundance of caution, do step 4 again
8. Run `bundle install`
9. Run `bundle exec jekyll serve`

### A note on installing the XCode command line tools

To check if the XCode command line tools are installed, run:

```
$ xcode-select -p
```

This should return `/Library/Developer/CommandLineTools`; if it does, you are probably OK. Move onto installing Ruby via brew (but keep an eye out for odd failures in later commands).

If `xcode-select` doesn't exit, check your `$PATH` and, if necessary, install XCode from the Mac OS App Store. 

If it runs but doesn't return `/Library/Developer/CommandLineTools`, then run

```
$ xcode-select --install
```

When that completes, run `xcode-select -p` again.

If the command returns `/Library/Developer/CommandLineTools` you are probably OK. But. One can run into problems anyway. If the subsequent site building steps fail with odd errors, try the following
```
$ sudo rm -rf /Library/Developer/CommandLineTools
$ xcode-select --install
$ xcode-select -p
```
If this doesn't a) result in `/Library/Developer/CommandLineTools` and/or b) doesn't solve weird problems, I don't know what other steps to take.

### Command-line précis
```
$ xcode-select -p
$ sudo rm -rf /Library/Developer/CommandLineTools
$ xcode-select --install
$ xcode-select -p
$ brew update
$ brew upgrade
$ brew install ruby
$ # update your paths appropriately
$ which gem
/usr/local/opt/ruby/bin/gem
$ which bundle
/usr/local/opt/ruby/bin/bundle
$ gem update
$ rm Gemfile.lock
$ bundle install
$ brew update
$ brew upgrade
$ gem update
$ bundle install
$ bundle exec jekyll serve
$ git status
$ # git add as necessary
$ git commit -a
$ git push remote
```
# Finally! We can correct GitHub Pages build errors!
 
Yeah, that was my last few days. Every time I ran `git push remote`, I would get an email a few minutes later with build errors. Long story short, in the six years (!!!) since I created the blog, GitHub pages has

 * Updated Jekyll, etc., several times over
 * Dropped support for `redcarpet`, which I replaced with `kramdown`
 * Dropped support for relative permalinks
 * Moved to relative path names for included content, e.g., CSS
 * Changed the IP addresses used for custom domain names

Fixing the first two was easy, the Mac OS update procedure described above and a quick change to `_config.yml`, respectively. 

The next two required searching for all included files, e.g., CSS being pulled in via `_includes/head.html`, and, more confusingly, removing all references to `{% raw %}{{ site.url }}{% endraw %}`, `{% raw %}{{ site.baseurl }}{% endraw %}`, etc., in all files, then removing them - I literally just deleted them and GitHub Pages figured things out pretty well.

The command

```
$ find . -path ./_site -prune -o -type f -exec grep -i -H -e 'site.url' -e 'site.baseurl' {} \;
```

was very useful for this; the grep clause can be extended as necessary with additional '-e <pattern>' commands to find other offenders. The rest of the command is basic `find`:

 * `-path ./_site -prune` causes `find` to ignore the `_site` subfolder
 * `-type f -exec...` tells `find` to apply `grep` only to files, and not to folders
 * `grep -i -H -e...` tells `grep` to
   * Ignore case when searching (just in case),
   * Output the name of any matching file (since it is being passed one file at a time, the default is to not output the file name, which means `grep` prints matches but not where it found them, unless you specify `-H`, which forces it to output the file name)
   * Match multiple `-e` patterns against the same file
 * `-o` tells `find` to apply either the path-ignore logic or the grep-in-files logic

I figured the relative-path-thing out after carefully reading [a GitHub Community post](https://github.community/t/css-not-being-applied-in-pages/10466/10) that I'm not even sure how I found. Careful and determined and persistent Googling, I expect.

The last fix required updating my custom domain's DNS with the correct IP addresses for GitHub Pages; [this is pretty well described here](https://docs.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site).

Really, the bulk of the work was the elimination of relative links.

In fact, in validating that `find` command, I realized I am missing a few, notably in `atom.xml` and in the reference to *atom.xml* in `_includes/head.html`... I'll get those later, the site pretty much works as designed, now.

# Was it worth it?

Yes. While it was frustrating to figure all of this out,

 * I'm confident that my Mac development environments are correctly configured
 * I got a lot of practical git experience in a very short time, enough to start locking in things like
   * `git pull`
   * `git push remote`
   * `git stash` (I used this a lot when cycling through some potential fixes)

Most notably, I've started to lock in the procedure for publishing new posts, which is excellent practical git:

```
$ git checkout -b newpost
$ # some editing
$ make # remember my Makefile, above: `bundle install; bundle exec jekyll serve`
$ git commit -a -m "..."
$ git checkout master
$ git merge newpost
$ git branch -d newpost
```

It was lot more pleasant and a lot more harmless figuring this out on a site that doesn't matter (hey, almost six years without updates) than on company code in the company repo: If I messed that up, my colleague would have had to fix my mistakes, and he is as busy as me and doesn't have time to clean up my messes.

I feel a lot more confident that I will mostly use git correctly now. That's a big win. And writing this up solified a lot of points in my head, another win.

(Heck, I even figured out to write Jekyll posts about Jekyll, so that they include `{% raw %}{% raw %}{% endraw %}`, for example!)

Time to get back to work, I guess....

# OK, what about stopping six years ago? And all the foreshadowing?

Long story short, six years ago, if it wasn't work-related, I really didn't have time for it. It was, uh, unpopular, to devote leisure time to anything at the keyboard when there were *couply* things to do - even if they were of asymmetric interest, if you will.

We separated in 2017, with the divorce finalized in 2018. Still neither a lot of leisure time nor interest in picking this back up, too many other things to do. Like working my butt off to save for a down-payment on a place of my own and get out of the post-split rental.

Last year, my girlfriend and I moved into my new place, and much time was spent on things house-related and new relationship-related.

(FSM bless theatre and movies: My girlfriend and I became involved romantically while working pre-production on a film in mid-to-late 2017, and behind-the-scenes work on a few plays with [Ottawa's LGBTQ+ theatre company](https://tototoo.ca) (she's on the board, and we have a lot of friends and family (mostly logical, with a nod to Armistead Maupin), some lawful, some biological) in the LGBTQ+ community in Ottawa and elsewhere).)

## Is that it?

Nah. I have to

* Fix the `atom.xml` problem described above
* Make sure a few other things about the site are working as they should (once I figure out or remind myself what *should* is in this case
* Update all my issues ([cf my post on how I was using `ghi` and GitHub issues back then](/How-I-use-GitHub-Issues)
* Remove specific product versions from my `.bashrc`, making it more dynamic and robust
* Add a `push` rule to the site `Makefile`
* And probably a few other things, too.

OK, back to work for real.

