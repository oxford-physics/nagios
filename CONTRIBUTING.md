Git Usage: Merging and Rebasing
===============================

Read this article for an in-depth discussion on
`git best practices http://lwn.net/Articles/328436/`.

Try to keep your history as simple as possible. Avoid merges on private code 
unless there is a particularly good reason to. Instead of merging in ``nagios/master``
to update your local branch use rebase. Merging in ``nagios/master`` risks
creating criss-cross merges which means you can actually lose code if you're
not careful. Git's merging algorithm is actually quite dumb, so it's best to
keep it simple. 

See nagios' network for a graphical view of rootpy's entire history::

https://github.com/HEP-Puppet/nagios/network

Let's all try our best to keep this graph as clean as possible.


Coding Guidelines
================

TODO


Writing Documentation
=====================

TODO

