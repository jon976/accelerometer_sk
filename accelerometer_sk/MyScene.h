//
//  MyScene.h
//  accelerometer_sk
//

//  Copyright (c) 2013 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MyScene : SKScene {
    SKSpriteNode *monkey;
    CMMotionManager *motionManager;
}

@end
