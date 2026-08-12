The ROS2 bag can be found in this Google Drive link: https://drive.google.com/drive/folders/1Dh07Cv7jPLzBMK9UeLEoxpcmaaPBuZC-?usp=drive_link

To run the bag:

1) Go to the folder *recruitment_data* inside *ros_ws*
2) Run this command

```
ros2 bag play recruitment_run \
--qos-profile-overrides-path qos_override.yaml
```

