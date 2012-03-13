//
//  AppDelegate.h
//  ARSpaceship
//
//  Created by Zhang Zhe on 3/13/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : UIResponder <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	__weak CCDirectorIOS* director_;							// weak ref
    UIView* overlay_;
}

@property (nonatomic, strong) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (strong, nonatomic) UIView* overlay;

@end
