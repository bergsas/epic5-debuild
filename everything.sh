#!/bin/bash

#
# This stuff seems to work for epic5 anyway. :)
#
set -x
deb_target="$PWD"
epic5=epic5
tmp=tmp

uscan=uscan
uupdate=uupdate
apt_get=apt-get
quilt=quilt
dch=dch
debuild=debuild

cp=cp
mkdir=mkdir
ls=ls
tail=tail

QUILT_PATCHES=debian/patches
QUILT_NO_DIFF_INDEX=1
QUILT_NO_DIFF_TIMESTAMPS=1
QUILT_REFRESH_ARGS="-p ab"



[ ! -d "$tmp" ] && $mkdir "$tmp" 
cd "$tmp"

# Get source for epic5
$apt_get source "$epic5"

pkgdir="`$ls -dt "$epic5"-*/ | $tail -n1`"
cd "$pkgdir"

echo $pkgdir

$uscan

# Simply return last updated file named *orig*. .)


next_orig="`$ls -tr ../*.orig.* | $tail -n1`"
next_ver="${next_orig%.orig.*}"
next_ver="${next_ver##*_}"

echo $next_orig
echo $next_ver

$uupdate -v "$next_ver" "$next_orig"

cd ../"$epic5"-"$next_ver"

#mv debian/patches/series debian/patches/series.old # :)

cp "$deb_target/patches"/* debian/patches/ 

while $quilt push -f
do
  $quilt refresh
done

$dch "New upstream release"

$debuild

cd ..

$cp *.deb "$deb_target"

# It's no good, really. But oh well. :)
