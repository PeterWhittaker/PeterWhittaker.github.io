---

layout: post
title: Python Best Practice re methods Vs external functions
permalink: python-best-practice-Q01
tags:
  - development
  - Python
  - best practices

---

Q for my Pythonista friends....

I've several utility functions for processing complex data in a file, each function being pithy: read from the file, validate the data, display it if in debug mode, process it, etc. Each function exists in its own module. None have output, they either return valid data or raise appropriate exceptions.

Just this morning I created a Class to represent the structure found in the file and moved the calls to the utility functions from `__main__` to the class constructor, and rewrote `__main__`, shortening it quite a bit.

Everything works. The executable imports the Class, the Class module imports the utility functions, all is well. All of my tests pass. Yay me.

I like "all is well" and I am generally a "if it ain't broke don't fix it" kind of person, but I am stalled on wondering whether I should make those utility functions class methods: They are used exclusively for processing this very specific data, and don't and won't have a life of their own. Do I leave them as-is (everything works) or do I bring them into the class module? (I did this as a test, all works just as well. But I want to decide on a direction before making the initial commit to this branch.)

My argument for doing nothing is a mix of "it ain't broke" and aesthetics: The class module is short and pretty; bringing them in increases module line count by over 200.

My argument for bringing them is less clear: It will reduce clutter in the folder that holds everything, and they don't have a separate life, so having them be "private" methods within the class seems sensible, and I think it will make import and module packaging simpler, but I don't know, hmm, fret....

I know I am over thinking this, but....

What's the best practice guidance?

