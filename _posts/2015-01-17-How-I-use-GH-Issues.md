---

layout: post
title: How I use GitHub Issues, labels, and milestones, to manage this site
permalink: How-I-use-GitHub-Issues
tags:
  - blog
  - colophon
  - GitHub
  - Process

---

A major reason for having this blog here and not elsewhere was to learn git and GitHub (cf the [Colophon](/Colophon)). Part of that is using GitHub Issues to manage things. Over the last ten or so years, I've become a huge fan of issue-based development management, or, perhaps more accurately, ticket-based change management (which subsumes both changes to code, i.e., development, and changes to operational systems): Having tickets means being able to track what is being done, by whom, when, and by what date; a little more process adds support for change approval mechanisms, rollback, escalation, etc.

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
