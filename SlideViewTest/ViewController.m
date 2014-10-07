//
//  ViewController.m
//  SlideViewTest
//
//  Created by Michael Dautermann on 10/7/14.
//  Copyright (c) 2014 Michael Dautermann. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    recognizer.numberOfTouchesRequired = 1;
    recognizer.delegate = self;
    [self.imageView addGestureRecognizer:recognizer];
   
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionUp;
    recognizer.numberOfTouchesRequired = 1;
    recognizer.delegate = self;
    [self.imageView addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizer.numberOfTouchesRequired = 1;
    recognizer.delegate = self;
    [self.imageView addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionDown;
    recognizer.numberOfTouchesRequired = 1;
    recognizer.delegate = self;
    [self.imageView addGestureRecognizer:recognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIGestureDelegate methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIView class]])
    {
        return YES;
    }
    return NO;
}


- (void) swipeRecognizer:(UISwipeGestureRecognizer *)sender {
    
    NSString *transition;
    
    if ( sender.direction == UISwipeGestureRecognizerDirectionLeft ){
        
        transition = kCATransitionFromRight;
        
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        
        transition = kCATransitionFromLeft;
    }
    if ( sender.direction== UISwipeGestureRecognizerDirectionUp ){
        
        transition = kCATransitionFromTop;
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionDown ){
        
        transition = kCATransitionFromBottom ;
    }
    
    self.imageView.image = [UIImage imageNamed: (self.alternatePicture ? @"ing_direct_cafe_san_francisco_main_floor.jpeg" : @"360_cafe_san_francisco_5653_1000.jpg")];
    self.alternatePicture = !self.alternatePicture;
    CATransition *animation = [CATransition animation];
    [animation setDuration:1.0]; //Animate for a duration of 1.0 seconds
    [animation setType:kCATransitionPush]; //New image will push the old image off
    [animation setSubtype:transition]; //Current image will slide off to the left, new image slides in from the right
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[self.imageView layer] addAnimation:animation forKey:nil];
}

- (void) swipeRight:(UISwipeGestureRecognizer *)sender
{
    [self swipeRecognizer:sender];
}

- (void) swipeLeft:(UISwipeGestureRecognizer *)sender
{
    [self swipeRecognizer:sender];
}

- (void) swipeUp:(UISwipeGestureRecognizer *)sender
{
    [self swipeRecognizer:sender];
}

- (void) swipeDown:(UISwipeGestureRecognizer *)sender
{
    [self swipeRecognizer:sender];
}


@end
