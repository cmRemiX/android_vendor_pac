#!/bin/bash
# NUCLEARMISTAKE 2015
#    STEP YOUR BASH UP, SON
[ ! $ANDROID_BUILD_TOP ] && echo "ANDROID_BUILD_TOP not defined. source build/envsetup.sh before running $0" && exit 1
mkdir -p $ANDROID_BUILD_TOP/CHANGELOGS/
if [ $FORCE_BUILD_DATE ]; then
  Y=${FORCE_BUILD_DATE:4:2}
  M=${FORCE_BUILD_DATE:0:2}
  D=${FORCE_BUILD_DATE:2:2}
  export d=$Y$M$D
  logd=$M$D$Y
else
  export d=`date +"%y%m%d"`
  logd=`date +"%m%d%y"`
fi
export CHANGELOGOUT=$ANDROID_BUILD_TOP/CHANGELOGS/cmremix_$logd
echo "" > $CHANGELOGOUT
ln -sf $CHANGELOGOUT $ANDROID_BUILD_TOP/CHANGES.LOG
getbranch()
{
  git --git-dir $REPOPATH/.repo/manifests.git config --local branch.default.merge | sed 's/refs\/heads\///g'
}
export version=`getbranch`
export newversion=HEAD
if [ $1 ]; then export lastversion=$1; fi
if [ $2 ]; then export newversion=$2; fi
repo forall -c 'bash <<'\''EOF'\''
  remote=$REPO_REMOTE

  if [ ! $lastversion ]; then
    prev=`git tag | sort -uh | grep -x "[0-9][0-9]*" | grep -v "$d"  | tail -n 1`
    if [ $prev ] && [ `echo $prev | wc -w` -eq 1 ]; then
      lastversion="$prev"
    elif [ `git tag | sort -uh | grep cmremix_ | wc -l` -gt 0 ]; then
      lastversion="`git tag | sort -uh | grep cmremix_ | tail -n 1`"
    else
      lastversion=m/$version
    fi
  fi
  echo "CHANGELOG for ${REPO_REMOTE}:${REPO_PROJECT} SINCE $lastversion... TAGGING $d"
  if [ $lastversion ]; then
      git log $lastversion..$newversion --no-merges --format="%h : %s <%an> %ar" > /tmp/currentlog
  else
      git log --no-merges --format="%h : %s <%an> %ar" > /tmp/currentlog
  fi

  lines=`cat /tmp/currentlog | wc -l`
  if [ $lines -gt 0 ]; then
    project=${REPO_REMOTE}:${REPO_PROJECT}
    echo "**** $project ****" | tee -a $CHANGELOGOUT
    head -n 50 /tmp/currentlog | tee -a $CHANGELOGOUT
    if [ $lines -gt 50 ]; then
        echo "* ... `expr $lines - 50` lines truncated ... *"
    fi
    echo " " | tee -a $CHANGELOGOUT
  fi

  git tag -d $d >& /dev/null
  git tag $d
EOF
'
cp $ANDROID_BUILD_TOP/CHANGELOGS/cmremix_$logd $OUT/system/etc/Changelog.txt
cp $ANDROID_BUILD_TOP/CHANGELOGS/cmremix_$logd $OUT/Changelog.txt
