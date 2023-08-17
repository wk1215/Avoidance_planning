#ifndef DWA_H
#define DWA_H

#include <vector>
#include <iostream>
using namespace std;

extern  double evalParam[4] ;

class State
{
public:
    State()
    {
        x = 0;
        y = 0;
        yaw = 0;
        v = 0;
        w = 0;
    }
    double x;
    double y;
    double yaw;
    double v;
    double w;
};
class GTreturn
{
    public:
    std::vector<State> traj;
    State state;
};

class UU
{
    public:
    UU()
    {
        vt=0;
        ot=0;
    }
    double vt;
    double ot;
};

class KModel
{
public:
    KModel()
    {
        MD_MAX_V = 1.2;//最大速度
        MD_MAX_W = 2.62;//最大角速度
        MD_ACC = 4.0;//加速度
        MD_VW = 0.8727;//角加速度
        MD_V_RESOLUTION = 0.1;//速度分辨率
        MD_W_RESOLUTION = 0.01745;//角速度分辨率
        radius =0.3;//车辆膨胀半径
        L=0.4;
        delta=40;
        MD_MU=0.6;
    }
    double MD_MAX_V;//最大速度
    double MD_MAX_W;//最大角速度
    double MD_ACC;//加速度
    double MD_VW;//角加速度
    double MD_V_RESOLUTION;//速度分辨率
    double MD_W_RESOLUTION;//角速度分辨率
    double radius;
    double  L;//车辆轴距
    double delta;//车辆前后轴最大转向角度
    double MD_MU;//路面附着系数
};

class VR
{
 
public:
    VR()
    {
        min_v = 0;
        max_v = 0;
        min_w = 0;
        max_w = 0;
    }
    double min_v;
    double max_v;
    double min_w;
    double max_w;

};

class OB
{
public:
    OB()
    {
        x = 0;
        y = 0;
    }
    double x;
    double y;
};


class EvalDB_cell
{
public:
    EvalDB_cell()
    {
        vt = 0;
        ot = 0;
        heading = 0;
        dist = 0;
        vel = 0;

    }
    double vt;
    double ot;
    double heading;
    double dist;
    double vel;
};

class SumDB
{
public:

    std::vector<EvalDB_cell> EvalDB;
    std::vector<State> trajDB;

};

class DWAreturn
{
public:
    std::vector<State> trajDB;
    UU u;

};


double toDegree(double radian);
double toRadian(double degree);
State f(State state, UU u);
VR CalcDynamicWindow(State state, KModel model);
double CalcHeadingEval(State state, double goal[2]);
double CalcDistEval(State state, std::vector<OB> &obs, double R);
double CalcBreakingDist(double vel, KModel model);
GTreturn GenerateTrajectory(State state, UU u, double evaldt, KModel model);
void NormalizeEval(std::vector<EvalDB_cell> &EvalDB);
SumDB Evaluation(State state, VR vr, double goal[2], std::vector<OB> &obs, double R, KModel model, double evalParam[4]);
DWAreturn DynamicWindowApproach(State state, KModel model, double goal[2], double evalParam[4], std::vector<OB> &obs, double R);
double max(double a, double b);
double min(double a, double b);
#endif // DWA_H