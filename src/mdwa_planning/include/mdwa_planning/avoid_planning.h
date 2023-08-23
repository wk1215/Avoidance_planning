#ifndef AVOID_PLANNING_H
#define AVOID_PLANNING_H

#include"mdwa_planning/environment.h"
#include"mdwa_planning/threat_points.h"
#include"mdwa_planning/dwa.h"

class LocalPathPlanner
{
    public:
       LocalPathPlanner();
       Environment env;
       PointF start;         //起点
       PointF destination;   // 终点
};


#endif