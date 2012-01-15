//
//  ViewController.m
//  MoonLander
//
//  Created by Mahmood1 on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    playing = YES;
	// Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f/60.0f target:self selector:@selector(loop) userInfo:nil repeats:YES];
    
    horizontal = 0.0f;
    
    vertical = 0.6f;
    
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    
    accel.delegate = self;
    
    accel.updateInterval = 1.0f/60.0f;
}

- (void)viewDidUnload
{
    [lander release];
    lander = nil;
    [moonView release];
    moonView = nil;
    [gameLabel release];
    gameLabel = nil;
    [fuel release];
    fuel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self touchesMoved:touches withEvent:event];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    touching = YES;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    touching = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


-(void)loop{
    
    if (playing){
        
    lander.transform = CGAffineTransformMakeRotation(rotation); 

    
    if (touching){
        
        if (!fuel.progress <= 0.001f){
        
        vertical -= 0.02;
        
        fuel.progress -= 0.001;
        
        horizontal = rotation;
    }
    }
        
    lander.center = CGPointMake(lander.center.x + horizontal , lander.center.y + vertical);
    
    vertical += 0.009;
        
        if (horizontal <= 0 ){
            
            horizontal += 0.001;
            
        }
        
        else{
            
            horizontal -= 0.001;
            
        }
        NSLog(@"horizont: %f",horizontal);
    
    
    if (CGRectIntersectsRect(lander.frame, moonView.frame)){
        
        if (vertical >= 1.0f ||  rotation >= 0.05 ||  rotation <= -0.05){
            
            gameLabel.text = @"Game over !!!";
            
            gameLabel.hidden = NO;
            
        }
        
        else{
            
            gameLabel.text = @"Yay! You did it!!";
            
            gameLabel.hidden = NO;
            
        }
        
        playing = NO;
        
        NSLog(@"rotation at end: %f",rotation);
    }
    }
    
    if (vertical >= 0.9f){
        
        vertical = 0.9f;
        
    }
    
    if (vertical <= -0.9f){
        
        vertical = -0.9f;
        
    }
    
    NSLog(@"vertikal: %f",vertical);
}


-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    rotation = acceleration.x;
    
  //  NSLog(@"Yeah rotate me!");
    
    
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return NO;
}

- (void)dealloc {
    [lander release];
    [moonView release];
    [gameLabel release];
    [fuel release];
    [super dealloc];
}
@end
