//
//  HelloWorldLayer.m
//  ARSpaceship
//
//  Created by Zhang Zhe on 3/13/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize motionManager, yawLabel, posIn360Label;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init])) {
        yawLabel = [CCLabelTTF labelWithString:@"Yaw: " fontName:@"Marker Felt" fontSize:12];
        posIn360Label = [CCLabelTTF labelWithString:@"360Pos: " fontName:@"Marker Felt" fontSize:12];
        yawLabel.position =  ccp(50, 240);
        posIn360Label.position =  ccp(50, 300);
        [self addChild: yawLabel];
        [self addChild:posIn360Label];

		motionManager = [[CMMotionManager alloc] init];
        motionManager.deviceMotionUpdateInterval = 1.0f / 60.0f;
        if(motionManager.isDeviceMotionAvailable)
            [motionManager startDeviceMotionUpdates];
        
        [self scheduleUpdate];
	}
	return self;
}

-(void)update:(ccTime)deltaTime
{
    CMDeviceMotion* currentDeviceMotion = motionManager.deviceMotion;
    CMAttitude* currentAttitude = currentDeviceMotion.attitude;
    float yaw = roundf((float)CC_RADIANS_TO_DEGREES(currentAttitude.yaw));
    
    [yawLabel setString:[NSString stringWithFormat:@"Yaw: %.0f", yaw]];
    
    int positionIn360 = yaw;
    if(positionIn360 < 0)
        positionIn360 += 360;
    
    [posIn360Label setString:[NSString stringWithFormat:@"360Pos: %d", positionIn360]];
}

@end
