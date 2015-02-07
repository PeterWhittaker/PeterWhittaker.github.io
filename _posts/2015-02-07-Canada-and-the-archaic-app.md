---

layout: post
title: The Canadian Government's archaic and embarrassing security screening management application
permalink: Canada-archaic-security-screening-management-embarrassment

tags:
  - UX
  - embarrassment
  - security
  - blog

---

<p class="lead">tl;dr: The Canadian Government's online security screening application supports pretty much all browsers on all platforms for 99% of the process - but that last one percent is Windows only, IE only, and Adobe only. Many of us have neither Windows nor IE, let alone Adobe, and even on Windows many of us use neither IE nor Adobe. The solution is simple: Upgrade the server side of the app - which hasn't been touched in 15 years or more - so that it generates the PDF instead of offloading PDF generation to the client. Done. Immediate support for most platforms, most browsers. And no need for the slightly inaccurate 28 step process supplied by government support agents if you know enough to question failure and are patient enough to wait to get through to a human being. Deep sigh. Proud to be Canadian, proud of most of what we do, not so proud of this made-in-Canada application.</p>

Many governments require that employees and contractors be screened prior to being granted access to certain types of information. Canada is no exception, with two distinct but related regimes, one for private information (information about people, business, etc.), one for sensitive government information (cabinet secrets, military information, intelligence, information, etc.). To access the former, you need a _reliability status_ (the often heard "enhanced reliability" no longer exists); to access the latter, you need a _security clearance_ at an appropriate level.

So far so good.

In an effort to simplify and streamline the administrivia required to obtain either a reliability status or a security clearance, Canada had provided a web application that allows a request to be initiated by a company security officer, assigned to either the applicant or to a security officer for completion (that is, for providing the pages and pages of data required), assigned to a security officer for submission to the government, etc.

So far so good.

Up until this point, the process can be successfully navigated with pretty much any browser on pretty much any platform. I've worked through this process with Firefox on both Linux and OS X, colleagues and friend have used Chrome or Firefox on Windows, OS X, and Linux, Safari, and within the government it's all IE, all the time.

So far so good.

For reasons that will be neither discussed nor explained herein, the government requires a _wet signature_ on the forms: electronic signatures are insufficient, and _secure electronic signatures_, as defined in Canadian law (PIPEDA and its regulations; perhaps I'll write about this in a future post) are not supported at all.

OK. Probably not so bad, right? Probably so far so good? Print the form, sign, scan and submit via email, or fax, or send the paper in, right?

Almost. And not so good.

While all the data exists on the server side, the government's process offloads generation of a printable form to Adobe products tied into IE.

And you have to submit their form of the form, not just all of the data as available in the form visible in your browser as you work through the process. Only a paper copy formatted exactly like the paper form originally designed almost two decades ago will suffice. And the only way to get it is with IE and Adobe.

In other words, one can 99% of the way through the process with pretty much any browser on pretty much any platform, but can complete the process __only__ with Windows, __only__ with IE, and __only__ with Adobe.

When I last used Windows, I had IE, one has to, after all, but I didn't use it; it was there, but I didn't use it. And I didn't have Adobe at all: I find their PDF readers to be slow, unstable, and insecure, and I much preferred FoxIt and others of that ilk: Apps that could do one thing only - read PDF - and could do it really well.

I don't even have Windows anymore: My family and my company are all OS X (I was the last to convert, and then from Linux, having abandoned Windows long ago).

Punchline? To finish the process, I have to seek friends or colleagues with Windows and IE and Adobe, and beg the use of their machines and printers for a short while.

OK, you say, not so bad, probably pretty good.

Except that it doesn't work. At least not the first time you try it. To quote a friend,

> Is that the problem where you spend ages filling in forms, then click on PDF and all you get is the blank form? After a while you give up and get the security officer to print them for you?

That's right. Blank forms. Because nowhere do they bother to tell you that there is a 28-step (I'm serious) process that you have to follow before this will work.

I didn't know that any of the other times I'd tried this, I would visit friends and colleagues and, if I had an on-site contract, government offices, logging into a supposedly secure system and trying again and again until it worked somewhere.

This was the situation Thursday night: I tried, it failed. Friday morning, after being on hold for 40 or more minutes, I got the scoop: It was an issue with Adobe's security settings, and there was a process.

Offered without comment, here is the process - which I have to execute on a friend's machine, hoping that they are either ignorant or sufficiently trustworthy of my skillage to know that I won't harm their machine - and which I cannot execute at all on locked-down corporate or government machines:

1. Click the Start menu
2. Click "All Programs"
3. In "All Programs", Locate Adobe Reader and Click to Start
4. A blank Adobe Reader page will open
5. From the top Adobe menu bar, Click "Edit"
6. From the Edit menu, Click "Preferences…"
7. In response to the Preferences menu selection, you will be presented with a new window called Preferences
8. On the left side of the Preferences, there is a Categories list box
9. From the Categories list box, Click "Trust Manager"
10. From "Internet Access from PDF outside the web browser"
11. Click "Change Settings…"
12. A new window called Manage Internet Access will open
13. From the Manage Internet Access window, Click "let me specify a list of allowed and blocked websites"
14. In the Allow/Block web Sites field, Type https://sedsi-oliss.tpsgc-pwgsc.gc.ca
15. Click "allow"
16. Then Click "OK"
17. From the Preferences window, inside the Categories list box, Click "Security (Enhanced)".
18. From the Enhanced Security, Click "Add Host"
19. A new window will open called Add Privileged Host
20. In Add Privileged Host, Type: https://sedsi-oliss.tpsgc-pwgsc.gc.ca
21. Click "Secure connections only https" check box
22. Click "OK"
23. The user will return back to the Preferences window
24. From the Preferences window, inside the Categories List box, Click "Internet"
25. From within the "Web Browser Option" (top right) ensure that "Display PDF in Browser" has a check in the box
26. Click "OK" at the bottom of the Preferences window
27. Adobe Reader configuration is complete
28. Close the Adobe Reader

These instructions were followed by the caveat

> Now go back to OLISS with your user id and password and try to print a request that was completed.  When selecting the "print" button, if the security screening form comes up and it's still not populated with the individual's information, try to clear/delete the browser Cookies and Temporary Files and restart your computer.

Well, offered mostly without comment. Here are two (which I sent to the government support agent this morning):

1. With certain (more recent?) versions of Adobe, step 23 closes preferences entirely and the user must re-enter.
2. Once the process is complete, there is still a popup in Adobe that must be recognized and agreed-to; again, this could be an effect of a more recent version of Adobe.

Wonderful, eh? 2015 and the government's online security screening system requires this level of futzing about just to get things to work...

...to get to the point where I can print the paper, collect signatures, and get the signed documents back, whether by scan and email, by fax, or by snail mail. Anything works, as long as they have them.

They don't tell you about this 28 step process anywhere on this site...

...because they haven't touched it in years. Other than to change the stuff and fluff around the app.

This is how it should really work (this is was I sent them this morning as well):

>  The current system favours only Windows users, and excludes users of both OSX (a growing community: I regularly attend technical fora and meetups and it is more and common for private sector teams to be 100% Apple) and Linux (arguably growing, but who knows for sure). The retort "just use Windows under a VM" is empty and meaningless: Why would we, users of other platforms, spend money to license Windows just (and I must emphasize just) for this application?
>
>  Furthermore, even within Windows, the current system favours only users of IE and of Adobe: The last few times I had Windows machines, I didn't even have Adobe installed, opting instead for lighterweight, more performant, more secure, and more stable PDF readers such as FoxIt - and there are many others.
>
>  This is particularly vexing when you consider that many of use get 99% of the way through the OLISS processes online using neither Windows nor IE, e.g., using Firefox or Chrome under OSX, only to have to scramble to find an appropriately configured Windows machine for that last 1%. The level of frustration in the community is considerable. Large organizations will not complain, as they tend to use older, more archaic technology, but smaller, nimbler players are considerably impacted by the government's lethargy in this area.
>
>  There is, however, a simple solution: The technology for server-side dynamic PDF generation is cheap and easy to use; in fact, there are numerous viable open source alternatives.
>
>  Such technology could be integrated relatively easily and simply into the server-side of the OLISS process: OLISS would generate the PDF on request.
>
>  The end-result? All users of all modern browsers on all modern platforms would be supported 100% of the way through ALL OLISS online processes.
>
> Please urge this upon your superiors and technical support teams. This would be fantastic step forward, and relatively inexpensive and straightforward one for your IT group.

Please feel free to share this with government support agents, decision makers, etc. Frankly, I find it embarrassing that my government's systems are this archaic.

Oh, did I fail to mention that this system hasn't changed in, uh, 15 years or more? Sigh.
