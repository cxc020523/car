#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <move_base_msgs/MoveBaseAction.h>

int main(int argc, char **argv) {
    ros::init(argc, argv, "goal_publisher");
    ros::NodeHandle nh;

    // 创建一个发布者来发布move_base/goal消息
    ros::Publisher goal_pub = nh.advertise<move_base_msgs::MoveBaseActionGoal>("/move_base/goal", 1);

    // 输入目标点的x和y坐标
    double goal_x, goal_y;
    std::cout << "Enter goal x coordinate: ";
    std::cin >> goal_x;
    std::cout << "Enter goal y coordinate: ";
    std::cin >> goal_y;

    // 创建一个MoveBaseActionGoal消息
    move_base_msgs::MoveBaseActionGoal goal_msg;
    goal_msg.goal.target_pose.header.frame_id = "map";
    goal_msg.goal.target_pose.pose.position.x = goal_x;
    goal_msg.goal.target_pose.pose.position.y = goal_y;
    goal_msg.goal.target_pose.pose.orientation.w = 1.0;

    // 发布目标点消息
    goal_pub.publish(goal_msg);

    ROS_INFO("Published goal point: x=%f, y=%f", goal_x, goal_y);

    ros::spin();

    return 0;
}
