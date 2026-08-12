from rclpy.node import Node

"""
Node: Visualization

Inputs:
    /zed/left/image_rect_color
    /perception/yolo_bboxes
    /ground_truth/odom
    /imu/data

Output:
    /perception/debug_image
"""

class VisualizationNode(Node):
    pass

if __name__ == '__main__':
    pass