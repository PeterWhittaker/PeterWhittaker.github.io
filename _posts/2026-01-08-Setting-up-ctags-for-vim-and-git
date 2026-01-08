---
layout: post
permalink: getting-ctags-working-with-vim-and-git
title: About time: Setting up ctags for vim and git
tags:
 - blog
 - git
 - development
 - vim
 - ctags
 - Rust
---

Professionally, I work pretty close to a bleeding edge (not *the* bleeding edge, but it's still hairy here):
Most of my job involves cross-domain work of one kind or another, and we prize reliability
and performance in equal measure - one dropped packet in 10 billion is too many, and
single-digit Gbps on 25Gbps interfaces is too slow, even with a complete protocol break
and physically guaranteed one-way transmission. Getting all those ducks lined up can be both
exhilarating and exhausting.

Personally, though, I am both a creature of habit and slow to change. Most of the rest of the team
uses VSCode, and here I am happily trundling along with `vim`. Why? Because it is ubiquitous and I
know it more than well enough to get my job done. Given how much I have to master for the job itself,
I am reluctant to change my tools, since they work. But I am jealous of my colleagues' ability to
jump around their source files, from the use of a function, method, or structure to its definition

So I have kept a tab group about `vim` and `ctags` hanging around for *years*.

Well, New Year, and all that, and yesterday I decided it was time. I dusted off those tabs, tried to make sense of them,
and ran into a wall.

 * `exuberant` or `universal`? (*tl;dr*: `universal`)
 * Which does my main development box have, and which version? (*best guess*: `universal` 6.0.0)
 * No Rust support, eh? (*tl;dr*: false, the documentation is *waaaaay* out of date)
 * How do I get `vim` to find tags file, given there are several places they could be? (*no spoilers*, it turns out to be super easy)

Basically, I ran into the perfect intersection of several hacker problems:

 * Many maintainers and contributors do really, really well at writing code, *but write documentation for people who already know what they know*. 
 * Many users accept on authority what they have found elsewhere, and share it, sometimes verbatim, without really understanding the choices and motivation behind the original, and often very old, posts/documents/etm.
 * Some maintainers don't understand why anyone would need anything spelled out, after all, *it's all right there in the README!*
 * The documentation in the main branch of some repos can be way behind what is actually on web sites, making `RTFM` - and building `TFM` in the first place, `pip uninstall sphinx && sudo dnf remove python3-pip` - essentially pointless.

In other words, there was plenty of information that assumed you already knew what you were doing,
very little for the person trying to find their feet, and none of *that* accurate.

Let's skip to the chase:

 * `exuberant-ctags`
   * hasn't been updated in over a decade, and
   * doesn't support `Rust` directly, but only via extensive `regex` patterns, which can be very, very slow (and good luck finding curated and up-to-date patterns)
 * `universal-ctags` is up-to-date and supports Rust and many other languages
   * the documentation included in the repo is, uh, poor, and, if you want to `RTFM`, you will need `pip` and `sphinx`, but they don't add much value
 * both `exuberant-ctags` and `universal-ctags` have many options, with defaults settables in a `ctags` file that can live in `~/.ctags` or `.config/ctags` or `.ctags.d/*`, depending on which you are using and what you prefer, but...
   * I found that the default behaviour of `universal-ctags`, without any such file, was sufficient for my main use-cases.
 * `rusty-tags` *may* be useful, but it depends on your use-case:
   * if you have `universal-ctags` and only need tags on *your* code, that is, your project itself, *you probably don't need `rusty-tags`*
   * if you have `exuberant-ctags`, `rusty-tags` provides the regexs to tag Rust source, but this *can* be slow
   * `rusty-tags` shines when you want tagging into your project's dependencies, and into the Rust source itself
     * the maintainer chose to generate one tag file per project and per dependency, which can generate a lot of tag files, which, personally, I find cluttering and messy, but it does reduce the likelihood of naming conflicts
 * adding `set tags=.git/tags;,tags;` to my `~/.vimrc` was enough to satisfy my two primary use cases:
   * the `;` tells `vim` to start in current directory and recurse upwards until it finds a matching file, e.g., `.git/tags` at the top of your repo
   * I used `git` hooks, à la tpope, to generate and maintain tags
   * the `tags;` pattern will match tags I generate *ad hoc* outside of `git`
 * tpope's well-known `git` hooks for tagging seem a little out of date: there was no `post-switch` hook, e.g.

I decided to
 * build and install `universal-ctags` from source,
 * skip its documentation,
 * adapt tpope's git hooks, with some updates,
 * keep my `~/.vimrc` simple,
 * skip `rusty-tags` for now, as it doesn't add value for me, at least not yet.

### Building `universal-ctags`
```
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make && sudo make install
```
This installed `/usr/local/bin/ctags`, and `/usr/local/bin` was already in my $PATH

### My `~/.vimrc`

As noted above, getting `vim` to find tag files was, for me, as simple as
```
echo 'set tags=.git/tags;,tags;' >> ~/.vimrc
```

### Adopting tpope's git hooks
For this, I wrote a `gitHooks` script:
```
#!/usr/bin/env bash

if ! command -v ctags 2>&1 /dev/null; then
    >&2 echo "No ctags, exiting; consider installing"
    exit 1
else
    >&2 echo "Proceeding with ctags setup"
fi

# idempotent
# shellcheck disable=SC2088 # we want the exact string
git config --global init.templatedir '~/.git_template'
git config --global alias.tags '!git hook run ctags'
git config --global alias.ic '!git init && git tags'

HOOKDIR=~/.git_template/hooks
mkdir -p "$HOOKDIR"
CTAGS="$HOOKDIR/ctags"
POST="$HOOKDIR/post-"

cat << 'EOF' > "$CTAGS"
#!/usr/bin/env bash
set -e
if ! command -v ctags &> /dev/null; then
    >&2 echo "No ctags, exiting; consider installing"
    exit 0 # exit clean so that git commands reflect proper status (maybe)
fi
dir="`git rev-parse --git-dir`"
trap 'rm -f "$dir/tags.$$"' EXIT INT TERM
git ls-files|ctags --tag-relative -L - -f$dir/tags.$$
mv $dir/tags.$$ $dir/tags
EOF
chmod +x "$CTAGS"

declare -a hookLinks=()
hookLinks+=(applypatch)
hookLinks+=(checkout)
hookLinks+=(commit)
hookLinks+=(merge)
hookLinks+=(rewrite)
hookLinks+=(switch)

for hookLink in "${hookLinks[@]}"; do
    hookFile="$POST${hookLink}"
    {
        echo '#!/usr/bin/env bash'
        if [[ $hookLink == rewrite ]]; then
            # special case
            # shellcheck disable=SC2016
            echo '[[ $1 == rebase ]] && exec .git/hooks/post-merge'
        else
            # general case
            echo '.git/hooks/ctags &> /dev/null &'
        fi
    } > "${hookFile}"
    chmod +x "${hookFile}"
done
```
With `gitHooks` in my `~/bin` directory, setting up and maintaining tags in a `git` repository was simple:
```
gitHooks # sets up the hooks and aliases I wanted
cd aGitRepo
git ic   # runs git init, which picks up the templates defined by `gitHooks` and git tags, which generates tags in .git
cd ../anotherRepo
git ic   # ditto
```

That was enough to satisfy my major use-case, using tags when working in `git` repositories with `vim`.
