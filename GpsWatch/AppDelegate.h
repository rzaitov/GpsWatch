//
//  AppDelegate.h
//  GpsWatch
//
//  Created by Rustam Zaitov on 13/01/15.
//  Copyright (c) 2015 Rustam Zaitov. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

