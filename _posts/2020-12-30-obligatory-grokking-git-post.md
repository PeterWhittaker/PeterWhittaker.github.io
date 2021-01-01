---
layout: post
permalink: obligatory-grokking-git-post
title: Obligatory "What I wish I knew about git" post
tags:
 - blog
 - git
 - development
 - insight
---

**tl;dr:** *If you think of* `git branch` *as a verb meaning* `diverge from this path, split my tree` *and think of the branch name as a label that tracks the most recent commit on this new path, a lot of stuff about git becomes clearer. You might already understand what* `detached HEAD` *means*.

 |Koan1: If I am on a branch but not at a branch, I am detached.|
 |Koan2: I can always get where I need to go, if I am committed.|

**"Aha!"**

Epiphanies. Eureka moments. Call them what you will, they change our world: We perceive and understand things differently. Some come after difficult, tortured paths, others from seemingly nowhere. Some dawn slowly, some disorientingly suddenly. I especially love the slow dawns, when I can feel the red pill soaking in, feel the change of perspective, feel the new world.

The challenge comes when you want to explain the new perspective to those who aren't there yet -- especially when you took the difficult, tortured path: it can be tempting to recite your journey, in the hope that others will be able to follow your footsteps.

It's not doomed to failure, just verbose, not to mention potentially inaccessible or irrelevant to those starting from different places: the paths of others need diverge only slightly from our own for the intersection of shared experiences to be very small indeed.

Besides, the one thing that you cannot explain is the experience of the red pill itself: Unless and until someone else takes it, they won't get what that part of the trip was like. (I didn't intend the pun, but I'm happy with it :->)

So rather than explain how I came to git, or how I used git badly (as I now perceive it), or reference websites and tutorials and blogs and practices, all in an attempt to share pre-flash headspace, allow me one -- or maybe two or three -- noble lies.

**Lie #1**: *You don't work* ON *a branch, you work* AT *a branch*.

Once you understand what I mean by that, you may think, as I do now, that ON Vs AT is mostly irrelevant, that ON is perhaps slightly more conceptually accurate from a code management perspective, but that AT is more useful when thinking about references in general, about what various commands do and how, and about how to solve various problems.

*Aside: As soon as you understand Lie #1, you will be able to infer what a* detached`head`*is and you will know that you do not need to use branches or the stash to work with them. Both (the nature of detachment, the commit-only solution) will literally just come to you.*

**Lie #2**: The only difference between a branch and a tag is persistence, or perhaps more accurately, mobility: Branches are *mobile*, tags are *sessile*. Git itself moves branches for you, and git itself keeps tags in place, unless you force it to move them.

This one is definitely more of a lie, but once you realize why you can pretty much use a tag anywhere you can a branch, and vice versa, you'll understand how accurate it is. At least from a perspective very much related to **Lie #1**.

**Lie #3**: We could just as well call `master` *fred* or *default* or *bootStrap* or *justGetStarted* and it would mean exactly the same thing.

*bootStrap* and *justGetStarted* are actually pretty good names, when you consider the *first* problem that the branch concept solves. More on this below.

Usually at this point -- or far earlier -- most articles have brought up `directed graphs` and other matters mathematical, which I avoid herein not because I do not understand them but **because they aren't strictly necessary** to starting up the ladder or taking the first step on or  *insertFavouriteMetaphorHere*  and all I really hope to do is get you started.

Think of source code management at one its most fundamental levels: A way to checkpoint your work, easily and cleanly, so that you revert to your last known good state when something goes wrong. Start with just that.

The `git commit` action creates that checkpoint. You've probably seen in logs and man pages and blogs, etc., that each commit has a unique ID -- and you've probably seen that these IDs are lengthy apparently random strings (they actually are pretty close to random, that's one of their cryptographic properties, but that is well beyond the scope of this post).

Your next commit creates another checkpoint, with its own long random ID. That first commit is essentially an ancestor of the second one, since the second one built on your work in the first one. Just a bit of foreshadowing.

If you had to keep track of where you were, of the relationship between these commits, git would lose a lot of its value -- so it keeps track for you -- and it does this in two distinct ways.

The first is with the`HEAD`concept.`HEAD`is simply where you are working right now. If you only ever go forward, commit after commit after commit,`HEAD`will always refer to your last commit. You will never have to "solve" the "problem" of working on a `detached HEAD.` In fact, you will never have to know about `HEAD` or `HEADs...` but after reading this, hopefully it will just make sense to you.

The second way git helps you keep track of where you are is with the branch concept. Chances are you are familiar with it, but just in case....

Let's say you have been working for a while, commit after commit, and are happy with your work: it works as you hoped, it is stable, it is secure, etc. Your next step is a problem you aren't sure how to solve, but you have a few ideas and want to experiment with them -- git helps you with branches.

In essence, a branch gives you a "place away", a sandbox, where you can experiment based on your good work without breaking it.

You create a branch for each approach -- `git branch approach01` or `git checkout -b approach01` or `git switch...` -- start coding, make some commits, compare, contrast, decide on the approach that works best. Merging that best approach and carrying on is the next step.

But before we take that step, let's come back to`HEAD`and to how git helps you keep track of where you are.

Now that you have multiple branches, you have multiple `HEADs:` There is a`HEAD`on each branch, and each branch's`HEAD`is the most recent commit on that branch. Think of a tree, coming up from the ground, tall and strong, and at some point splitting, growing two or more branches from the trunk. Each branch ends in its own `HEAD.` It's easy to refer to the tree or to the trunk, it's the bulk of stuff that happened before you made your first branch. The branches start where things split from the trunk.

Which is the main part of the tree now? Well. That's actually a deeply philosophical question, but for most of us the answer is `master:` git knows you are likely to branch off at some point, so it simply makes sure that your work, even if perfectly linear, commit after commit without branching, has a branch name, and that name is master.

Whether `master` is a master in any semantic sense is entirely up to you. This is just the name that git gives the shoot that grows as you commit. Like I wrote above, it could just as easily be called *bootStrap* or *justGetStarted* or *myStuff* or *shoot*: Unless you need to come back to it, you never need to know what it was called and you only need to come back to it if you create a branch. There are git workflows based on the idea of making master "special", making it mean something (we've just started doing this in my main job: master is our *generally available public release* branch, with other branches being for feature development, penetration testing, etc.).

This is **Lie #3**: Master is only as special as you make it, and, if you never branch, you never need it. Git just made sure it was there because chances are that you would need it, at some point. We'll come back to **Lie #3**, because **Lie #1** also applies. 

Getting back to our tree: if you look at the tree, and consider your solid, secure, satisfying work to be the trunk, right up to where you started branching for experimental purposes, where does master end and the branches begin?

Time to consider `branch` not as a *noun*, but as a *verb*. Some git commands are pretty verb-like, e.g., `git add`, `git commit`, `git push`, `git pull`, while others are pretty noun-like, e.g., `git status`, `git log`. Until very recently, I always thought of `git branch` as a noun-like command, as in *make a branch*, but in a lot of ways, it is far better to think of it as a verb: branch to this new place. Diverge. Blaze new path.

You started with a shoot that grew straight and tall then got to a point where you needed to experiment, so you created a branch, to "work off to the side". Then you created another one, because you weren't sure about that path. Repeat ad infinitum, or at least ad bonum or ad satium, i.e., until you have a good enough branch.

Right now, you've got `master`, which refers to the shoot, and master's `HEAD,` which is the last commit on master, and several branches, each diverging from `master,` and each of their `HEADs,` which are the leaves, if you will, on each branch.

Right?

Well, yeah, OK, that's how a lot of people view these branch things.

For the sake of this article, for the sake of pedagogy, please try this: Think of master as a human friendly, human-consumable label for the last commit you made before branching. In other words, on master,`HEAD`and `master` refer to the same commit.

Now do the same for each branch: Consider the branch name, e.g., `approach01,` not to apply to the entire branch, but to refer to the last, most recent commit on that branch. In other words, on any branch, including master,`HEAD`and the *branch name* refer to exactly the same thing, the most recent commit.

Every time you commit, git moves`HEAD`to point to the new commit. And every time you commit, git moves *branch name* to point to that same commit.

Why is this so important? When you checkout a branch, even master, git doesn't place you just anywhere on that branch: It places you at the end of that branch, where *end* means the last commit made on that branch.

This is **Lie #1**: When you are working on a branch, you are working at a very specific place -- the end of the branch. And the end keeps moving: each time you make a commit, the branch grows, and git updates location references for you so that you are always at the end, which is almost always where you want to be.

|A branch is a moving reference, a label that refers to the most recent commit of a related set of commits.|

We might as well deal with **Lie #2** right here. Tags are clearly labels. That is their whole function: To label a commit as having some semantic meaning, some importance to you or your team. The only idea of a tag is to mark a commit that you should always be able to come back to, easily.

|A tag is persistent, static, sessile reference, a label that never moves, a marker for an important spot.|

Of course, you don't really need tags. You could capture the same information in a commit message, then read through the log, looking for it, get the commit ID, and git checkout that CommitID and there you'd be! But who has time for that?

Git tag saves you that work, by allowing you to mark specific commits as special and to list those special commits with `git tag -l.`

To complete the lie, consider tags as labels that move you back in time, to previous somehow important commits, and branches as labels that move you forward in time, to the most recent commit. Git will never move a tag on you, because it has no way of knowing why you made that label: it just isn't smart enough, it assumes the label meant something to you, and will only move it if you explicitly force it to. But git moves the end-of-branch label with every commit, because most of the time most of us want to be right there, at the end of the branch, at our most recent work.

**Lie #2** is important because you can pretty much use a tag anywhere you can use a branch name, in `diff,` in `checkout,` in `switch,` in `merge,` in `rebase,` etc., etc., and vice versa. Branch and tag refer to specific commits in a tree of commits. A directed graph that starts with the first commit, the seed, and shoots upward until those first branches, and then along each one.

If you like the tree analogy, we are about to blow it up. If you dislike it, this next bit is for you.

So what's a `detached HEAD?` Consider that pretty much anywhere you can use a tag you can use a branch name and vice versa, and pretty much anywhere you can use either you can use a commit ID.

`git checkout commitThatIsNeitherTaggedNorTheEndOfTheBranch` will take you to a `detached HEAD:` You reach a `detached HEAD`when your current working commit is not otherwise labeled, that is, it has not been tagged and is not the last commit in/on a branch. It doesn't matter how many descendants it has, it just isn't the last commit on ANY branch and it isn't tagged.

If you change something there and make commit it, you will have "created a branch", in that you will have diverged your tree, but you won't really have created a branch, because you never labelled it as such. You've *diverged* in the tree, in the directed graph, without *branching*, as the idea is most often expressed.

In other words, a detached`HEAD`is git telling you that you didn't follow the expected rules. But there aren't really any rules, just conventions, and, if you understand how these commits and labels (these references) work, you can always get there from here or here from there. So call this **Lie #4**: a `detached HEAD`is git telling you to follow the rules. That don't exist. Paradox if true. But false, so logically consistent. Right? Right.

When you decide to go back in time or when you end up back in time and decide that you where you are is where you need to be, you make a change. Now you need to integrate that change into your later work. How?

The traditional advice is as follows:

1. Commit.
2. Make a branch at that commit.
3. Jump to where you want that work (usually by checking out another branch and thereby moving to its end)
4. Merge the branch from step 2 into your current location.
5. Sometime later, delete the branch from #2, since you do not need it anymore.

But you don't need to make a branch, which means you don't need to clean it up, so steps 2 and 5 are irrelevant. You just need to:

A. Commit -- and note the commit ID  
B. Jump to where you want that work  
C. Merge that commit ID into your current location.

Done.

Huh. What does our tree look like now? The tree analogy just died because we reached into its trunk (the detached HEAD, that commit from the distant past) and we pulled it forward in time and married it to the end of one of the branches -- or to the top of the trunk, if we merged it into master, and hadn't yet merged anything else into master.

Well, mostly died. Because we may have used `rebase.` If we used `rebase,` we just morphed the tree into a bigger tree. Insert favourite SciFi/SpaceOpera metaphor here.

Think about starting our shoot and branching off into `approach01` and `approach02,` so that we have two distinct branches heading to the sky from the trunk we are calling master, then realizing that we need both of these approaches, that they solve different problems. We need to combine them somehow. Most commonly, we would use merge, but we could also use rebase. What's the diff?

If we

    git checkout approach01
    git merge approach02

we join our two branches so that we have a trunk and two limbs that split off (that diverge from master) only to rejoin, to converge, somewhere above the trunk. If we then

    git checkout master
    git merge approach1

suddenly `master` is at the top of the tree. The fact that we took two distinct paths to get to this new master, path `approach01` and path `approach02,` is preserved forever, reflected in our commit history. In fact, because `master` gets pulled along to the `approach1` commit, you can picture the three paths as a trunk that separates into three branches with empty space between them only to have the three branches converge and start growing as a single branch again.

But what if instead we had done

    git checkout approach01
    git rebase approach02

and

    git checkout master
    git merge approach2

???

`git rebase` basically says *do not preserve the distinctiveness of these paths, make it seem as if there was but one path, which we mean to walk all along*: The result of doing these rebase operations is that despite the fact that we branched -- diverged -- and wandered around design space for a time, so that our tree started to get twisty and possibly gnarled, it is now a single shoot, straight and true, from ground to sky (or whatever altitude master happens to be).

So, yeah, the tree analogy is weak. But all analogies are.

|git commits are arranged as a directed graph, one that starts from the first commit and continues linearly, unless and until one branches, at which point the graph diverges. Unless and until one branches, each later commit has as its ancestors all earlier commits (each commit has one and only one ancestor commit, except the first one, which has none).|

|Ancestry diverges when a branch occurs -- but each commit still has only one ancestor commit, unless and until there is a merge.|

|`git merge` joins commits on two separate branches into a new commit, one with multiple ancestral paths: That commit has two or more ancestor commits, and, most of the time, those commits will have one or more common ancestors (not always, we won't go there, but git does allow merging of completely unrelated trees).|

|`git rebase` joins commits on two separate branches into a new commit with but a single ancestral path, returning us to linearity, so each commit has but one ancestor commit, all the way back to the beginning of the branch (which might be the beginning of the tree).|

I still work on branches, but to understand what git is doing for me and how we can help each other, I find that thinking of working at a branch, not on a branch, is helpful. At a branch, I am at the labelled end of series of a related commits.

|If I am on a branch but not at a branch, I am detached.|

(Another git koan.)

#### What about remotes, then?

All of these same concepts apply when working with remote branches, whether those are on your own on server or they are those of others, members of your team or others with whom you are collaborating. Remotes are simply pointers to other commit trees, other directed graphs, out in the world somewhere.

What happens when you do a pull?

Like the man page says, `git pull` is basically `git fetch` followed by `git merge `FETCH_HEAD:` Your`HEAD`is your recent commit on your branch, `FETCH_HEAD` is the most recent commit on the copy of the branch you just fetched, and `git pull` merges that commit and its ancestors onto your `HEAD,` creating a new commit and moving`HEAD`and the branch name to that commit.

Of course, as soon as you have remotes, you have the possibility of merge conflicts, since changes can be made to the same code in different places. Fortunately, git has tools for resolving merge conflicts: git developers recognize merge conflict resolution as a key "value add" for git, one of the main ways git makes distributed development so much easier, and they spend a lot of time and effort making remote access and fetching and merging work really well. Subjects for another session, perhaps.

Since `git pull` is basically `git fetch` and `git merge FETCH_HEAD,` what if you did `git fetch` and `git rebase FETCH_HEAD` instead?

You know how I said there weren't any rules, just conventions? Yeah. Conventions can be very important. If it's your sandbox, you may do as you please, set the rules for others, if you want them to play with you. If your rule is rebase not merge, well, it's your sandbox.

Most sandboxes don't work that way, though: Merge and rebase preserve all commits, which means that both preserve a history, it's just rebase doesn't preserve how the history happened, only the events, in sort of the right order but not really. Merge does.

For most projects, the actually history of the history is important because understanding how we got here from there can often help us better understand the nature of the work, the nature of the problems we are trying to solve, the nature of solution space. Rebase hides or obscures potentially important exploration.

You are free to rebase. Especially your own code, in your sandbox. But don't be surprised if others are inclined to a dim view of those who would rebase the work of others and discard potentially important history, or at least obscure it.

**With all that in mind, is a remote a branch, is the same way that a branch is a branch?**

|No. While they can be listed with `git branch -[ar],` and while you can use `git branch someName` to make a local branch that tracks a remote called `someName` *just appear*, they are not branches.|
|Branches are places you can go. At least from the perspective of this article.|

You may work with remotes, but you can never get to them. You fetch or pull from them, you push to them, but you can never be there. You can never be on them or at them.

This is very different from tags, branches, and even commitIDs, which represent places in commit space you can actually get to. Think of `git checkout` and `git switch` as a bit like the `mv` command, which takes you from where you are in the filesystem to a new place in the filesystem: checkout and switch take you to named places in the same way that mv does.

Being the master of the bad analogy (have you read my tree work?), git remotes are not like remote filesystems that can be mounted via NFS or SMB and navigated directly as if they were local. They are more like archives, tar or cpio files, that you download, then extract over your local files, but the extraction program is extra clever, and cleanly integrates your local content with the archive content, pausing to let you resolve conflicts it cannot figure out.

At least that's the analogy for `git pull.` `git push` is sort of like the reverse, but not really....

The cool thing is that a `git bundle` is an archive and can be treated exactly like a remote, pulling from it and pushing to it, for those times when you need to share or move code but cannot do it directly in a connected fashion. Another thought for another time.

So, no: A remote is not a branch, even if `git branch` will list available/known remotes. My take is that the git developers know that remotes aren't branches but that they value usability and friendliness and sensible conventions over slavish devotion to intellectual and/or design purity. The more I use git, the more I respect their work.

But if you start thinking of branches as places, not paths, and stop thinking of remotes as branches, a lot becomes clear. Er. Clearer. Yeah, that's one.

One big step (at least for me) on the road to git clarity....

### References and acknowledgements

This article and the perspective behind it owe a great deal to the following. I especially need to reread the second one a few more times....

* The thoroughly enjoyable [Think Like (a) Git](http://think-like-a-git.net)
    * The [resources section](http://think-like-a-git.net/resources.html) is especially good. Some of my favourites are [Scott Chacon's *Git Internals*](https://github.com/pluralsight/git-internals-pdf) and [Ryan Tomayko's *The Thing About Git*](https://tomayko.com/blog/2008/the-thing-about-git) - I particularly like Ryan's take on`git add --patch`and how`git add`is, in general, a command for manipulating the`index,`aka`staging,`aka, the`cache.`
* A thoroughly underrated [stackoverflow answer](https://stackoverflow.com/a/61575566)

