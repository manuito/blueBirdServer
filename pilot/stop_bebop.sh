#!/bin/bash

py_pid=`/bin/ps -ef | grep python | grep -v "grep" | awk '{print $2}'`
sudo kill -9 $py_pid
