//
//  MyGeoLocationViewController.h
//  Weather Today
//
//  Created by Taiyaba Sultana on 2/9/17.
//  Copyright © 2017 Abdul Kareem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MyGeoLocationViewController : UIViewController <CLLocationManagerDelegate>

- (void)getGeographicCordinates;

@end
