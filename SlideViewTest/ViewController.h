//
//  ViewController.h
//  SlideViewTest
//
//  Created by Michael Dautermann on 10/7/14.
//  Copyright (c) 2014 Michael Dautermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@property (weak) IBOutlet UIImageView *imageView;

@property (readwrite) BOOL alternatePicture;

@end

