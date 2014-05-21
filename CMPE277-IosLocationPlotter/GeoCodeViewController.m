//
//  FirstViewController.m
//  CMPE277-IosLocationPlotter
//
//  Created by Jon Guan on 5/4/14.
//  Copyright (c) 2014 Scanadu, Inc. All rights reserved.
//

#import "GeoCodeViewController.h"

@interface GeoCodeViewController ()

@end

@implementation GeoCodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  


    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapRecognizer];
    
}

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickPlot:(UIButton *)sender
{
    NSString *addrString = [NSString stringWithFormat:@"%@, %@, %@", self.address.text, self.city.text, self.zip.text];
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:addrString completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"geocode failed with error:%@", error.localizedDescription);
            return;
        }
        if (placemarks.count == 0) {
            NSLog(@"no locations found");
            return;
        }
        
        CLPlacemark *placemark = placemarks[0];

        [self plotLocationWithLongitude:@(placemark.location.coordinate.longitude).stringValue latitude:@(placemark.location.coordinate.latitude).stringValue];
        
    }];
}

- (void)plotLocationWithLongitude:(NSString *)longitude latitude:(NSString *)lattitude
{
    NSString *ll = [NSString stringWithFormat:@"%@,%@", lattitude, longitude];
    ll = [ll stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [NSString stringWithFormat:@"http://maps.apple.com/?q=%@", ll];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
