// #ifndef ENVIRONMENT_H
// #define ENVIRONMENT_H

#ifndef TEST_ENVIRONMENT_H
#define TEST_ENVIRONMENT_H
#include <vector> 

struct PointF
{
    PointF(){};
    PointF(double m_x,double m_y):x(m_x),y(m_y){};
    double x;
    double y;
};

struct dy_PointF
{
    dy_PointF(){};
    dy_PointF(double m_x,double m_y,double m_vx,double m_vy):
    x(m_x),y(m_y),vx(m_vx),vy(m_vy){};
    double x;
    double y;
    double  vx;
    double  vy;
};

class Environment
{
public:
    Environment();
    Environment(int i);
    std::vector<PointF> barrier;
    std::vector<dy_PointF>dy_obs;
    float obs_size = 0.1;

};
#endif // ENVIRONMENT_H
