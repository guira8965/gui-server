#!/bin/bash

echo "Disabling BD-Prochot..."

sudo modprobe msr
sudo wrmsr 0x1FC 0 -a

echo "BD-Prochot disabled."