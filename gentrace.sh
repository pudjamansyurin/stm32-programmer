#!/bin/bash
source .env

$PROG -c port=SWD mode=hotplug -swv freq=$SYS_FREQ_MHZ  portnumber=0 $SWV_LOG_FILE || exit 1