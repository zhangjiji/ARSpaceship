//
//  HelloWorldLayer.h
//  ARSpaceship
//
//  Created by Zhang Zhe on 3/13/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#include <CoreMotion/CoreMotion.h>
#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@property (strong, nonatomic) CMMotionManager* motionManager;
@property (strong, nonatomic) CCLabelTTF* yawLabel;
@property (strong, nonatomic) CCLabelTTF* posIn360Label;

@end
