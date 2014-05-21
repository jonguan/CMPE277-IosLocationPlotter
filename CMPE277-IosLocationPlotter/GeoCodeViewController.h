//
//  FirstViewController.h
//  CMPE277-IosLocationPlotter
//
//  Created by Jon Guan on 5/4/14.
//  Copyright (c) 2014 Scanadu, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface GeoCodeViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *zip;

- (IBAction)didClickPlot:(UIButton *)sender;

- (void)plotLocationWithLongitude:(NSString *)longitude latitude:(NSString *)lattitude;

@end
