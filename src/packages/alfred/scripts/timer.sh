#!/bin/bash

set -e

duration=$1
message=$2

terminal-notifier -title "Reminder from $duration ago" -mesage "$message"