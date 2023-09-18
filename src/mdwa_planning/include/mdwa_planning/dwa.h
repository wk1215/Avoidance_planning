// #ifndef DWA_H
// #define DWA_H
#ifndef TEST_DWA_H
#define TEST_DWA_H
#include "mdwa_planning/environment.h"
#include <vector>
#include <iostream>
using namespace std;
#define PI 3.1415926


struct Car
{
    float max_speed = 0.4;//1.5;//10
    float min_speed = 0.0;
    //small car:1.82*v,car:0.24*v
    float max_angular_speed = 200 ;// dec/s
    float min_angular_speed = -200;
    float max_accel = 30;//max=3.5
    float max_angular_speed_rate = 200 ;
    float v_resolution = 0.1;     // 速度采样分辨率
    float yaw_rate_resolution = 1.0;
    float dt = 0.1;                //运动学模型预测时间
    float predict_time = 1.0;
    float goal_cost_gain = 0.2;
    float speed_cost_gain = 1.0;
    float obstacle_cost_gain = 1.0;
    float radius =0.3;//max:2.2
};
struct CarState
{
    float x;
    float y;
    float yaw;
    float speed;
    float angular_speed;
    CarState(){};
    CarState(float x_, float y_, float yaw_, float speed_, float angular_speed_):
        x(x_), y(y_), yaw(yaw_), speed(speed_), angular_speed(angular_speed_)
    {}
};

class DWA
{
public:
    DWA();
    DWA(Environment* env, PointF start, PointF destination);
    void planning();
    vector<float> dwa_control(const CarState &carstate);
    vector<float> calc_dw(const CarState &carstate);
    vector<float> calc_best_speed(const CarState &carstate, const vector<float> &dw);
    void predict_trajectory(const CarState &carstate, const float &speed, const float &angular_speed, vector<CarState> &trajectory);
    CarState motion_model(const CarState &carstate, const float &speed, const float &angular_speed);
    float calc_goal_cost(const vector<CarState> &trajectory);
    float calc_obstacle_cost(const vector<CarState> &trajectory);
    Car car;
    vector<vector<CarState>> trajectory;
    PointF startPoint;
    PointF destinationPoint;
    CarState destinationState;
    Environment *environment;
    bool aaa = false;

};

#endif // DWA_H