//
//  MyGeoLocationViewController.m
//  Weather Today
//
//  Created by Taiyaba Sultana on 2/9/17.
//  Copyright © 2017 Abdul Kareem. All rights reserved.
//

#import "MyGeoLocationViewController.h"

@interface MyGeoLocationViewController ()

@end

@implementation MyGeoLocationViewController {
    CLLocationManager * pointerToCLLocationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getGeographicCordinates {
    
    //Instantiate CLLocationManager, set its delegate to self, set accuracy for the location and call appropriate method to update location.
    pointerToCLLocationManager = [[CLLocationManager alloc] init];
    pointerToCLLocationManager.delegate = self;
    pointerToCLLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    [pointerToCLLocationManager startUpdatingLocation];
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertController * pointerToUIAlertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Failed to get your location" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * pointerToCancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [pointerToUIAlertController addAction:pointerToCancelAction];
    [self presentViewController:pointerToUIAlertController animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"\n\n\n*************\n\n\ndidUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        //        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        //        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        NSLog(@"Longitude value is %@ and Latitude value is %@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude], [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
