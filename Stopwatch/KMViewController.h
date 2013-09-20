//
//  KMViewController.h
//  Stopwatch
//
//  Created by Kabir Mahal on 9/19/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


- (IBAction)startTimer:(id)sender;
- (IBAction)pauseTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;

-(void)showTimer;


@end
