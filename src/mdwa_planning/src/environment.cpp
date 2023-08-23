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
