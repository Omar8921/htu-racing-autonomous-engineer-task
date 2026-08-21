from rclpy.node import Node

"""
Node: LiDAR Perception

Input:
    /velodyne_points

Outputs:
    /perception/roi_points
    /perception/non_ground_points
    /perception/clustered_points

Coordinate Frames:
    Source:
        The frame provided by the incoming PointCloud2 message
        (msg.header.frame_id).

    Target:
        base_footprint

The LiDAR points should be transformed from the sensor frame into
base_footprint before processing so that the coordinates are aligned
with the vehicle.

If this is unfamiliar, briefly read about ROS 2 TF2 and coordinate
frame transformations.
"""


class LidarNode(Node):
    pass


if __name__ == '__main__':
    pass