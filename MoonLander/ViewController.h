//
//  ViewController.h
//  MoonLander
//
//  Created by Mahmood1 on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate>{
    
    IBOutlet UIImageView *lander;
    
    IBOutlet UIView *moonView;
    
    IBOutlet UIProgressView *fuel;
    
    float horizontal;
    
    float vertical;
    
    float rotation;
    
    BOOL touching;
    
    BOOL playing;
    
    IBOutlet UILabel *gameLabel;
}

@end
