//
//  MyScene.m
//  accelerometer_sk
//
//  Created by Jon Oransky on 9/29/13.
//  Copyright (c) 2013 self. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

#define kPlayerSpeed 250

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        monkey = [SKSpriteNode spriteNodeWithImageNamed:@"monkey_arms_up.png"];
        monkey.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addChild:monkey];
        motionManager = [[CMMotionManager alloc] init];
        if ([motionManager isAccelerometerAvailable] == YES) {
            [motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
                                                withHandler:^(CMAccelerometerData *data, NSError *error)
             {
                 float destX, destY;
                 float currentX = monkey.position.x;
                 float currentY = monkey.position.y;
                 BOOL shouldMove = NO;
                 
                 if(data.acceleration.y < -0.25) {  // tilting the device to the right
                     destX = currentX + (data.acceleration.y * kPlayerSpeed);
                     destY = currentY;
                     shouldMove = YES;
                 } else if (data.acceleration.y > 0.25) {  // tilting the device to the left
                     destX = currentX + (data.acceleration.y * kPlayerSpeed);
                     destY = currentY;
                     shouldMove = YES;
                 }
                 if(shouldMove) {
                         SKAction *action = [SKAction moveTo:CGPointMake(destX, destY) duration:1];
                         [monkey runAction:action];
                 }
             }];
        }

    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
