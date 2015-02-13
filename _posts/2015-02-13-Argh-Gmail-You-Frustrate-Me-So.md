---

layout: post
permalink: argh-gmail-frustration

title: Avoid frustration with new gmail accounts, keep these things in mind....
tags:
 - blog
 - GoogleWTF
 - gmail
 - GAE

---

<p class="lead">tl;dr:Trying to set up "send as" as a new email address in an existing gmail or GAE account? Remember that Google disables both IMAP and POP3 by default in new accounts. If you read and retain nothing else, read and retain that. It will save you considerable grief.</p>

I'm doing some work that requires a dedicated email address, one that contains neither my company name nor any personal identifier. The why's and wherefore's don't matter much, the important thing is simply that the client wants me to use such an address, the requirement is sufficiently reasonable and not worth arguing (bigger fish to fry and all that).

Since this is going to be used for work purposes I want to keep all email sent to and from this address with the rest of my work emails. You know, for convenience of organization and reference, satisfying my inner neat freak, etc.

I use Google's email services exclusively: My personal email address is at gmail.com, my company email is hosted by Google App Engine (GAE), and I use the gmail web interface and the Android gmail app exclusively; I don't use any other mail clients whatsoever.

So it was pretty much a no-brainer that the new email address would also be at gmail.com (yes, this was acceptable, and I know that seems a bit strange, given the other restrictions imposed by the client, but just accept and move on, as I did :->): Google makes it very easy to create a new gmail address and to have multiple gmail sessions in a single browser (at any given time I have multiple tabs open to my gmail.com and GAE addresses, and I keep personal and work emails strictly separate).

OK, Google, +1 for making it easy to set up the new address. So far so good.

I wanted to be able to send as this new address using my GAE business account, and, ideally, I wanted all email sent to this new email account to end up in my GAE business account.

Simple, clear requirement, right? You would think it would be easy to do, right?

Well, it is. As long as you remember that __GMAIL DISABLES IMAP BY DEFAULT!!!__ Sorry to shout (well, not really), but this caused for much frustration and lost time until I finally stumbled across this this morning.

(Before you retort that this is obvious: No, it's not. In fact, it makes only limited sense. It's yet another example of Google assuming a) that they are the world and b) that they understand every use case or at least c) that use cases they do not understand don't matter. Just think of how limited Inbox is, e.g. (completely unsupported with GAE, etc.).)

I've enabled "send as" before, I knew where it was in "settings". I found it, entered the required information, and caught what was reported as an authentication error. WTF? I won't bore you with the many and varied steps I tried, including logging out of all gmail/GAE accounts, restarting the browser, logging back in, etc., etc., all of which worked...

...and yet the "reported authentication error" persisted. I write "reported authentication error" because that's what Google claimed: words to the effect of "Cannot establish connection, check username and/or password".

"Check username and/or password". Not "connection refused, check host, check that IMAP is enabled, etc., etc."

Bang bang bang my head. Give up. Send email using new account, Bcc old account, leave problem for another time.

After supper, decide to resurrect imapsync, which I'd used to migrate a previous job's email from GoDaddy to GAE (worked like a charm).

Cannot connect. WTF?

(Note: As I write this I realize that I was blocked on the authentication error idea, and wasn't getting enough distance from the problem to seek other causes. I was anchored, but good.)

Bang bang bang my head. Give up. Go to bed.

Try again this morning.

Bang bang bang my head. AARGH!

Poke, poke, poke. Well, it appears I won't be able to set up sending as the new email from the work GAE.

Well, at least I'll configure retrieval of new email so that they end up in the GAE account. I've done this before...

...but I click on the IMAP tab instead of the Accounts and Forwarding tab (don't know why, don't ask, lucky accident, really)...

...and it's there that the penny drops: In the GAE, IMAP is enabled (I had a reason for this, never disabled it). Drop, drop, click, click.

Go to the new gmail account. Settings, IMAP. Enable IMAP.

Return to GAE account. Try setting up send as again. "Oh, I made a bingo!" (Sorry, watched _The Zero Theorem_, have Waltz on the brain.)

Finally. I can "send as". Yay.

Whimper....

Return to new gmail. Enable POP3. Return to GAE, enable fetching.

Everything works.

The bottom line?

GOOGLE, WTF? THEY'RE YOUR OWN ACCOUNTS AND YOU CANNOT REPORT A MORE USEFUL MESSAGE, LIKE, MAYBE, _CHECK THAT IMAP IS ENABLED_ OR _CONNECTION REFUSED, NOT AN AUTHENTICATION ERROR_ OR SOMETHING!?!??!

Nope, not sorry for the shouting. My second major "Google, WTF?" this week (see [a recent G+ post of mine](https://plus.google.com/+PeterWhittaker/posts/FhNCzuvVee1) if you're curious).

Another step closer to saying goodbye to Google. Most stuff just works, pretty well, but they do a completely shitty job with stuff people do rarely but need to have _just work_. Sigh.

If you are reading this paragraph, thanks. We must be siblings-in-frustration, we feel each other's pain.

Deeper sigh.
