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

git checkout -b newpost
git commit -a -m "..."
git checkout master
git merge newpost
git branch -d newpost

https://github.community/t/css-not-being-applied-in-pages/10466/10

<p class="lead">tl;dr: Five years is a long time. Why stop? Why start again? And why was restarting so painful?<p>

Five years is a long time. Why stop? Why start again? And why was restarting so (technically) painful?

The past two questions are related, so let


G


 - [Why silent so long](#why-silent-so-long)

 ## Why silent so long









<p class="lead">tl;dr:Trying to set up "send as" as a new email address in an existing gmail or GAE account? Remember that Google disables both IMAP and POP3 by default in new accounts. If you read and retain nothing else, read and retain that. It will save you considerable grief.</p>

```
Update summary, 2015-02-14: Working as described, with one additional milestone, Unsure. More towards the end.
```

A major reason for having this blog here and not elsewhere was to learn git and GitHub (cf the [Colophon](/colophon)). Part of that is using GitHub Issues to manage things. Over the last ten or so years, I've become a huge fan of issue-based development management, or, perhaps more accurately, ticket-based change management (which subsumes both changes to code, i.e., development, and changes to operational systems): Having tickets means being able to track what is being done, by whom, when, and by what date; a little more process adds support for change approval mechanisms, rollback, escalation, etc.

It's more complicated than that, of course, but that's the basic idea. Pretty much from the beginning of my work on this site, I started tracking site features and development using [the issues associated with the site's repository](https://github.com/PeterWhittaker/PeterWhittaker.github.io/issues/) - but being a command line kinda person, first I found _an amazing, clean, simple, and effective, command line tool for opening, updating, closing, and otherwise managing GitHub Issues_, **[ghi](https://github.com/stephencelis/ghi)**. The install was pretty much a breeze:

```
brew install ghi
ghi config --auth $YourGitHubID
```

The only hiccup was that I had to run the `ghi config` command a few times to get the authorization to *take*: An interaction between keychain and the GitHub API, I suppose, never did figure it out, just tried it a couple of times until it worked... ...and since it was working, well....

So my basic workflow is

```
/* Have an idea */
ghi open
/* describe the idea in one line */
/* force myself to add a body, just in case I cannot later interpret that one line */
vi $theAppropriateFile
git add !$
git commit -a -m "A useful description of what I did; closes #$IdeaIssueNumber"
```

Sometimes `/* Have an idea */` is inspired by other sites (e.g., [issue 47](https://github.com/PeterWhittaker/PeterWhittaker.github.io/issues/47) and [issue 23](https://github.com/PeterWhittaker/PeterWhittaker.github.io/issues/23)), other times it's from running `ghi list`, which shows me all current issues (assuming I am in the site's top-level source folder).

According to `ghi list|wc -l`, I have 28 open issues right now. That's not a lot, which means I don't really need to put in much effort to manage them, but it's also a nice, manageable, workable number if I want to start experimenting with labels  and milestones...

...which was what inspired this particular post: After poking through a few articles on how to use GitHub Issues (your *google fu* is as good as mine), both from GitHub itself and from GitHub users describing their processes, I realized that one of the great strengths of GitHub's minimalist, nay, Spartan, approach to issues is that it forces absolutely no process on anyone.

The flipside of this, of course, is that should one wish to go beyond having a flat list of issues, somehow using labels and milestones to manage them, one has to have a process in mind, a business problem to solve.

The notional idea that I had prior to googling was managing dependencies. After reading, it wasn't at all obvious how to do this: GitHub Issues has neither hierarchy nor dependencies, just labels and milestones.

After some mental hemming and hawing, I decided on the following:

* Use labels to denote "clusters", that is, related issues, and
* Use milestones to denote sequence.

I've created the following milestones:

0. Anytime
1. Next
2. NextA
3. NextB
4. NextC
5. Roadmap

**Anytime** basically means quick little things I can or should do whenever the fancy strikes me. **Next** is for things important enough and of the *right scope* to be priorities (*right scope* means both that I understand the scope and that they will fit in to the windows made available by the union of {my day job, my home life, my hobbies}). **Roadmap** basically means *later*: Things I think I should do but I've neither scoped nor considered carefully enough to know whether I really should do them.

That leaves **Next[ABC]**. Basically, **A** comes before **B** comes before **C**. That's it. Or almost.

*Next[ABC]* are meaningless without clusters, which are denoted by labels, which will appear, change, and disappear, as work is done. I don't have any good examples yet (I'm writing this post to consolidate the idea in my mind before I sift through the issues to apply it) but the basic idea is this:

1. I have a cool idea, but it depends upon something I haven't done yet.
3. Create an issue for the cool thing (call it issue 2)
2. Create an issue for the thing I haven't done yet (call it issue 3)
4. Create a label that captures the essence of why I am going to do those two things. In this case, it might be "CoolThing". Give that label a colour not currently in use.
5. Apply the label to the two issues.
6. Associate issue 3 (the one that has to come first) with milestone "NextA".
7. Associate issue 2 (the cool thing) with milestone "NextB".

Then, when "Anytime" is either empty or boring and "Next" is empty, look for things in Next[ABC] to move to Next. There is only one rule: **Never move anything from NextB or NextC to Next if there something with the same label in NextA**.

(In my mind, that rule is simpler than having to always shift items from NextC to NextB to NextA as items are popped from NextA and NextB.)

Why Next[ABC] and not Next[A-F], e.g.? Well, anything more than three levels of dependency likely means I don't understand the scope and magnitude and complexity of what I am doing. Having said that, it is quite possible that NextA for label *Fred* might be a simple thing, NextB for Fred a little more complex, and NextC a lot more. That might mean than when I close the issue for Fred in NextA, I might then break the NextB issue into two, and put one of them in NextA.

Or at least that's what I'm thinking right now. I don't want to overdesign nor do I want to overproscribe (though it does feel overdescribed by now, eh?).

Enough for now. I'm going to start categorizing things. I'll report back on this after I've played with it for a bit.

```
Update, 2015-02-14

I've been meaning to add this update for a while now: I proceeded as described above and found it worked pretty darned well. I get a nice view of how issues relate using ghi to list issues, labels, etc., at the command line, while the view in GitHub Issues is workable, at least for a small number of milestones.

Important point: If you want to work this way, figure out what your milestones are first, then figure out the order in which you want to display them, then create them in that order: GitHub (or maybe it is just ghi) will assign each one a number, and, by default, present them in numerical order, even if the number is not displayed (it is in ghi, it is not in GitHub Issues, at least not as far as I can see).

One change from the original post: As I began working with milestones as buckets for when things should happen, I realized I needed another bucket, Unsure, which is for things that aren't in the roadmap (and hence shouldn't be brought forward) but which should not yet be dismissed. Think of it as a "check again later" sort of holding pen. Fortunately, given that I thought of this bucket last (cf important point, above), it is fortunate that it should indeed appear last. Serendipity FTW.
```
 1632  xcode-select -p
 1633  sudo rm -rf /Library/Developer/CommandLineTools
 1634  xcode-select --install
 1635  xcode-select -p
 1636  which bundle
 1637  brew info gem
 1638  ls /usr/local/opt
 1639  brew install ruby
 1640  ls /usr/local/opt
 1641  history
 1642   history|tail > history
$ which gem
/usr/local/opt/ruby/bin/gem

pww@sphyrnas-Mac-mini:~/Desktop/Documents/Sites/PeterWhittaker.github.io/_posts
$ which bundle
/usr/local/opt/ruby/bin/bundle
$ update
$ bundle install
$ update # to be on the safe side



```
#!/bin/bash

# brew install node
# npm install [-g] npm-check
# npm install [-g] eslint

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


```
...
function isMacOS {
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

if [ -z "${PATH}" ]; then
    # there should be a default path, but in some weird cases, perhaps not
    # set a reasonable default
    PATH=/usr/bin:/bin:/usr/sbin:/sbin
    export PATH
fi

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

...
```
