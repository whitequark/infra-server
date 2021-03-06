#!/bin/sh
# kFreeBSD do not accept scripts as interpreters, using #!/bin/sh and sourcing.
if [ true != "$INIT_D_SCRIPT_SOURCED" ] ; then
    set "$0" "$@"; INIT_D_SCRIPT_SOURCED=true . /lib/init/init-d-script
fi
### BEGIN INIT INFO
# Provides:          notifico-bots
# Required-Start:    $remote_fs postgresql
# Required-Stop:     $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: notifico bots
### END INIT INFO

# Author: whitequark <whitequark@whitequark.org>

START_ARGS="--make-pidfile --background --chuid notifico -d {{webroot}}"

DESC="notifico-bots"
DAEMON={{webroot}}/notifico-env/bin/python
DAEMON_ARGS="-m notifico bots"
PIDFILE=/var/tmp/notifico-bots.pid

do_stop_cmd() {
  start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 \
      --remove-pidfile --pidfile ${PIDFILE} --exec ${DAEMON}
}
