#!/bin/sh

FROM=fehu.whitequark.org
INTO=uruz.whitequark.org

for i in \
  lab.whitequark.org \
  groupxiv.whitequark.org/public_html/data \
  llvm.moe
do
  ssh $INTO rsync -aP $FROM:/var/www/$i/ /var/www/$i
done
