//
//  SecondViewController.h
//  CMPE277-IosLocationPlotter
//
//  Created by Jon Guan on 5/4/14.
//  Copyright (c) 2014 Scanadu, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeoCodeViewController.h"

@interface LocationManagerViewController : GeoCodeViewController 


@property (strong, nonatomic) CLLocationManager *locationManager;

@end
