#!/usr/bin/env bash

export ZK_SERVERS=$(zsd --zks="${ZSD}" "${ZSD_ROOT}" "${ZSD_ZK_NAME}")

sed -i "s|zkServer=localhost:2181,localhost:2181|zkServer=$(echo ${ZK_SERVERS} | tr ' ' ',')|g" /config.cfg

java -jar -Xmx512M /zkui.jar