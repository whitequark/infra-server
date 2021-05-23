#!/bin/sh
# kFreeBSD do not accept scripts as interpreters, using #!/bin/sh and sourcing.
if [ true != "$INIT_D_SCRIPT_SOURCED" ] ; then
    set "$0" "$@"; INIT_D_SCRIPT_SOURCED=true . /lib/init/init-d-script
fi
### BEGIN INIT INFO
# Provides:          dendrite
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: dendrite monolith server
### END INIT INFO

# Author: whitequark <whitequark@whitequark.org>

NAME="dendrite"
DESC="dendrite-monolith-server"
PIDFILE=/var/run/dendrite.pid
START_ARGS="--chdir {{root.data}} --make-pidfile --background"
DAEMON={{root.app}}/bin/dendrite-monolith-server
DAEMON_ARGS="-http-bind-address localhost:{{http_port}} -config config.yaml"

do_stop_cmd() {
  start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 \
      --remove-pidfile --pidfile ${PIDFILE} --exec ${DAEMON}
}
