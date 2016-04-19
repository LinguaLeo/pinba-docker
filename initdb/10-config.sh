#!/bin/bash -ex

CONF_FILE="/etc/mysql/conf.d/pinba-server.cnf"

cat <<EOF>$CONF_FILE
[mysqld]
pinba_stats_gathering_period=${PINBA_STATS_GATHERING_PERIOD:-10000}
pinba_stats_history=${PINBA_STATS_HISTORY:-60}
pinba_temp_pool_size=${PINBA_TEMP_POOL_SIZE:-10000}
pinba_request_pool_size=${PINBA_REQUEST_POOL_SIZE:-1000000}
EOF

if [ "x$PINBA_HISTOGRAM_MAX_TIME" != "x" ]; then
	echo "pinba_histogram_max_time=${PINBA_HISTOGRAM_MAX_TIME}" >> $CONF_FILE
fi
