#include "mdwa_planning/environment.h"
#include <iostream>

Environment::Environment()
{
    //barrier初始化
    barrier.push_back(PointF(20, 30));
    barrier.push_back(PointF(20, 35));
    barrier.push_back(PointF(25, 35));
    barrier.push_back(PointF(25, 30));
    barrier.push_back(PointF(27, 30));
    barrier.push_back(PointF(25, 25));
    barrier.push_back(PointF(22, 23));
    barrier.push_back(PointF(22, 23));
    barrier.push_back(PointF(25, 23));
}

Environment::Environment(int i)
{
    //不同的地图场景
    //1号地图，室内小场景
    if(i==1)
    {
            barrier.push_back(PointF(2*0.6, 6*0.6));
            barrier.push_back(PointF(5*0.6, 3.5*0.6));
            barrier.push_back(PointF(6*0.6, 1*0.6));
            barrier.push_back(PointF(6*0.6, 4.5*0.6));
    }
}

