//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(_ robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        print("randomlyRotateRightOrLeft: \(randomNumber)")
        // You may want to paste your Part 1 implementation of randomlyRotateRightOrLeft(robot: ComplexRobotObject) here
        if(randomNumber==1){
            robot.rotateRight()
        }
        else{
            robot.rotateLeft()
        }

    
    }
    //当机器人旋转时，它该不该检查以确保不会旋转到墙  调用此方法是前面都不是墙
    func turnTowardClearPath(_ robot: ComplexRobotObject,_ wallInfo:WallInfo) {
        // Step 3.1
        // TODO: Tell the robot which way to turn toward the clear path. There are four cases where the robot should rotate to the right (the first two have been done for you--uncomment the code below). Write the remaining two cases where the robot should rotate to the right. For all other cases, the robot should rotate to the left.
        //                if robot.direction == .left && wallInfo.down {
        //                    robot.rotateRight()
        //                } else if robot.direction == .up && wallInfo.left {
        //                    robot.rotateRight()
        //                }
        // print (robot.direction,"wallInfo.up ",wallInfo.up );
        if robot.direction == .left && wallInfo.down {
            robot.rotateRight()
           
        } else if robot.direction == .up && wallInfo.left {
            robot.rotateRight()
            
        }else if robot.direction == .down && wallInfo.right {
            print ("left:",wallInfo.left,"")
            robot.rotateRight()
            
        }else if robot.direction == .right && wallInfo.up {
            robot.rotateRight()
            
        }else {//
            robot.rotateLeft()
        }
        
    }
    
    func continueStraightOrRotate(_ robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        print("continueStraightOrRotate: \(randomNumber)")
     
        // You may want to paste your Part 1 implementation of continueStraightOrRotate(robot: ComplexRobotObject) here.
        if(randomNumber==1){
            randomlyRotateRightOrLeft(robot)
        }else{
            robot.move()
        }
        // Step 3.2
        // TODO: Instead of calling randomlyRotateRightOrLeft() call turnTowardClearPath() when the robot has randomly chosen to rotate.
        
        }

}
