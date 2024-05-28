#!/bin/bash

ps aux |grep cryosparc|awk '{print $2}'|xargs kill -9
rm -f /tmp/cryosparc*.sock
rm -f /tmp/mongodb*.sock
