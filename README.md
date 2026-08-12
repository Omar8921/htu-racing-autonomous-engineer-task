# HTU Racing — Autonomous Recruitment Task

## Environment

* Ubuntu
* ROS 2 Jazzy
* Python 3

## Recruitment Data

Download the ROS bag from:

https://drive.google.com/drive/folders/1Dh07Cv7jPLzBMK9UeLEoxpcmaaPBuZC-?usp=drive_link

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

## Visualization Tools

A visualization setup is provided inside:

```text
tools/
├── visualize.sh
└── recruitment.rviz
```

Run it from the project root using:

```bash
./tools/visualize.sh <lidar_frame>
```

Replace `<lidar_frame>` with the coordinate frame used by the supplied LiDAR data.

If the script is not executable:

```bash
chmod +x tools/visualize.sh
```

The script launches:

* **RViz2** for LiDAR visualization.
* **rqt_image_view** for camera/debug-image visualization.

The RViz configuration expects the following topics:

```text
/velodyne_points
/perception/non_ground_points
/perception/roi_points
/perception/clustered_points
```

In `rqt_image_view`, select:

```text
/perception/debug_image
```

## Troubleshooting

If ROS 2 processes fail to discover each other, install and use Cyclone DDS:

```bash
sudo apt install ros-jazzy-rmw-cyclonedds-cpp

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
```

Make sure all terminals use the same middleware implementation.

If necessary:

```bash
ros2 daemon stop
ros2 daemon start
```

If `rqt_image_view` is unavailable:

```bash
sudo apt install ros-jazzy-rqt-image-view
```

## Notes

* Do not modify the provided ROS bag.
* Always use the provided QoS configuration when replaying the bag.
* The simulator is not required.
* Candidates are expected to independently learn the ROS 2 concepts and tools required to complete the task.
