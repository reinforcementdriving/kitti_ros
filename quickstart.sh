#!/bin/bash

echo ""
echo "HOSTNAME"
echo "======="
echo `hostname`

source devel/setup.bash
echo "Change Mode for Keyboard Listening Device"
sudo chmod 777 /dev/input/event3

# start roscore if not running
if ! pidof -x "roscore" >/dev/null; then
    echo ""
    echo "ROSCORE STARTING"
    echo "======="
    setsid roscore &
fi

# start rviz if not running
if ! pidof -x "rviz" >/dev/null; then
    echo ""
    echo "RVIZ STARTING"
    echo "======="
    setsid rosrun rviz rviz -d `rospack find kitti_ros`/rviz/default.rviz &
fi
