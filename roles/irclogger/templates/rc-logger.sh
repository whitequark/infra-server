#!/bin/sh
# kFreeBSD do not accept scripts as interpreters, using #!/bin/sh and sourcing.
if [ true != "$INIT_D_SCRIPT_SOURCED" ] ; then
    set "$0" "$@"; INIT_D_SCRIPT_SOURCED=true . /lib/init/init-d-script
fi
### BEGIN INIT INFO
# Provides:          irclog-{{network}}-logger
# Required-Start:    $remote_fs postgresql
# Required-Stop:     $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: {{domain}} logger
### END INIT INFO

# Author: whitequark <whitequark@whitequark.org>

ROOT=/var/www/{{domain}}
START_ARGS="--chuid irclog_{{network}} -d ${ROOT}"

DESC="{{domain}} logger"
DAEMON=/usr/bin/bundle
DAEMON_ARGS="exec ${ROOT}/logger.rb"
PIDFILE=${ROOT}/tmp/logger.pid

do_stop_cmd() {
  start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 \
      --pidfile ${PIDFILE} --exec /usr/bin/ruby
}
