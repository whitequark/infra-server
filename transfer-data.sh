#!/bin/sh

FROM=fehu.whitequark.org
INTO=uruz.whitequark.org
MYSQLPWD=

for i in \
  lab.whitequark.org \
  groupxiv.whitequark.org/public_html/data \
  llvm.moe
do
  ssh $INTO rsync -aP $FROM:/var/www/$i/ /var/www/$i
done

ssh $INTO rsync -aP $FROM:stuff/Documentation/ /var/www/doc.whitequark.org

ssh root@$INTO "pkill -f 3306:localhost:3306 ; ssh whitequark@$FROM -N -L 3306:localhost:3306 &"
ssh root@$INTO "cat >irclog.load" <<END
LOAD DATABASE
FROM mysql://irc:$MYSQLPWD@localhost/irclogs
INTO postgresql:///irclogs
WITH data only, batch concurrency = 1, batch rows = 1000, batch size = 20kB
SET work_mem to '16MB', maintenance_work_mem to '32MB';
END
ssh root@$INTO "pgloader irclog.load"
