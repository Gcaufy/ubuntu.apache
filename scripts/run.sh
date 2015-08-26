#!/bin/bash
apache2ctl -k start
tail -f /var/log/apache2/error.log 
