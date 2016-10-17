//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {
    var isThreeWayChooseRotate=false;//flag 用于标记三项路径是否已经选择方向
    var mazeController: MazeController!
    
    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
        
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        let myWallInfo=checkWalls(myRobot)
        
        
        // Uncomment the line of code below
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        
        
        if isThreeWayJunction && robotIsBlocked {
            //当机器人旋转时，它该不该检查以确保不会旋转到墙
            randomlyRotateRightOrLeft(myRobot)//选个方向
            isThreeWayChooseRotate=true
            
        }else if(isThreeWayJunction && !robotIsBlocked){ //您需要为第二个语句编写 if 语句，即当机器人到达三岔路口且前方没有墙时  //选个方向 左或右 前进
            
            if(isThreeWayChooseRotate){
                myRobot.move()
                isThreeWayChooseRotate=false
            }else{
                turnTowardClearPath(myRobot, myWallInfo)
                isThreeWayChooseRotate=true
            }
            
           
           // continueStraightOrRotate(myRobot)
        }else if (isTwoWayPath && robotIsBlocked){
            //。如果机器人遇到双向路径，并且前方没有墙壁，则应该继续前行。如果前方有墙壁，则应随机转向
            turnTowardClearPath(myRobot, myWallInfo)
            //randomlyRotateRightOrLeft(myRobot)
        }else if(isTwoWayPath && !robotIsBlocked){
            //continueStraightOrRotate(myRobot)
             myRobot.move()
        }else if(isDeadEnd){
            if(robotIsBlocked){//机器人来到死路。如果面向墙，它会转向右侧。如果不是面向墙，则会前行。
                myRobot.rotateRight()
            }else{
                myRobot.move()
            }
        }

    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
}
