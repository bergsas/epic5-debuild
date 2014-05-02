epic5-debuilder
===============

make an epic5 package for ubuntu. :)

links
-----
http://lekv.de/blog/tag/galaxy-tab/
http://packaging.ubuntu.com/html/patches-to-packages.html

files
-----
**everything.sh** will do the stuff for you and create a .dpkg
that will be placed in the current directory. :)

**patches/** are the patches from the package origin. I had to change
one of them a bit.

**lucid-box/**
  A **Vagrantfile** and a **script.sh** that makes a lucid package.
  The script.sh clones this git repo from github and does some
  ''magick''.
  
  I guess it can be done in a similar manner for precise.

fix it
------
I need to fix the gpg key stuff... Oh well.
