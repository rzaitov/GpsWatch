//
//  InterfaceController.m
//  GpsWatch WatchKit Extension
//
//  Created by Rustam Zaitov on 13/01/15.
//  Copyright (c) 2015 Rustam Zaitov. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *longitudeValueLbl;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *latitudeValueLbl;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [self.longitudeValueLbl setText:@"0.0"];
    [self.latitudeValueLbl setText:@"0.0"];

    [self setTitle:@"GPS"];
    // Configure interface objects here.

    [self updateUI];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
}
              
- (void)updateUI {
    void(^callbackFromParentApp)(NSDictionary *, NSError *);
    __weak InterfaceController *weakSelf = self;
    callbackFromParentApp = ^(NSDictionary *replyInfo, NSError *error) {
        InterfaceController *innerSelf = weakSelf;
        NSNumber *longitude = (NSNumber *)replyInfo[@"lon"];
        NSNumber *latitude = (NSNumber *)replyInfo[@"lat"];
        
        [[innerSelf longitudeValueLbl] setText:[longitude description]];
        [[innerSelf latitudeValueLbl] setText:[latitude description]];
    };
    [WKInterfaceController openParentApplication:@{} reply:callbackFromParentApp];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [timer invalidate];
    timer = nil;
    
    [super didDeactivate];
}

@end



