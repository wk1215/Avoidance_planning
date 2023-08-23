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

class Environment
{
public:
    Environment();
    std::vector<PointF> barrier;
    float obs_size = 0.2;

};
#endif // ENVIRONMENT_H
