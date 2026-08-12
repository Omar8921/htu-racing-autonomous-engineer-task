# HTU Racing — Autonomous Recruitment Task

## Environment

* Ubuntu
* ROS 2 Jazzy
* Python 3

## Recruitment Data

Download the ROS bag from:

**https://drive.google.com/drive/folders/1Dh07Cv7jPLzBMK9UeLEoxpcmaaPBuZC-?usp=drive_link**

Extract it into:

```text
recruitment_data/
```

The bag contains:

```text
/zed/left/image_rect_color
/velodyne_points
/imu/data
/ground_truth/odom
/clock
```

## Run the Bag

From the project root:

```bash
cd recruitment_data

ros2 bag play recruitment_run \
  --qos-profile-overrides-path qos_override.yaml
```

Always use the provided `qos_override.yaml`.

## Troubleshooting

If ROS 2 processes fail to discover each other, install and use Cyclone DDS:

```bash
sudo apt install ros-jazzy-rmw-cyclonedds-cpp

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
```

If necessary, restart the ROS daemon:

```bash
ros2 daemon stop
ros2 daemon start
```

Make sure all terminals use the same middleware implementation.

## Notes

* Do not modify the provided ROS bag.
* The simulator is not required.
* Candidates are expected to independently learn the ROS 2 concepts and tools required to complete the task.
