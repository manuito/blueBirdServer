#!/bin/bash

ftp_imp_pid=`/bin/ps -ef | grep do_import_from_bebop | grep -v "grep" | awk '{print $2}'`
sudo kill -9 $ftp_imp_pid
