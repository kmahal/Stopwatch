//
//  KMViewController.m
//  Stopwatch
//
//  Created by Kabir Mahal on 9/19/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "KMViewController.h"

@interface KMViewController ()
{
    NSDate *startDate;
    NSDate *holdStartDate;
    NSTimer *stopWatchTimer;
    NSTimeInterval secondsAlreadyRun;
    int count;
}

@end

@implementation KMViewController

@synthesize timeLabel;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the initial empty state
    timeLabel.text = @"00:00:00";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showTimer{
    
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSLog(@"time interval1: %f", timeInterval);

    timeInterval += secondsAlreadyRun;
    NSLog(@"time interval2: %f", timeInterval);
    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss.SS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    timeLabel.text = timeString;
    dateFormatter = nil;
    
    
    //  NSLog(@"date is %@", date);
    
}

- (IBAction)startTimer:(id)sender {
    
    count +=1;
    
    NSLog(@"start1");
    stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1/10
                                                      target:self
                                                    selector:@selector(showTimer) userInfo:nil repeats:YES];
    NSLog(@"start2");

    startDate = [[NSDate alloc]init]; 
    
    if (count == 1){
        holdStartDate = startDate;
    }
    
    NSLog(@"start date: %@", holdStartDate);
    NSLog(@"start3");
    [stopWatchTimer fire];
    NSLog(@"start4");
}

- (IBAction)pauseTimer:(id)sender {
        
    NSLog(@"pause1");
   // secondsAlreadyRun += [[NSDate date] timeIntervalSinceDate:startDate];
    [stopWatchTimer invalidate];
    stopWatchTimer = nil;
    NSLog(@"pause2");
    [self showTimer];
    secondsAlreadyRun += [[NSDate date] timeIntervalSinceDate:startDate];

    NSLog(@"pause3");

}

- (IBAction)stopTimer:(id)sender {
    
    secondsAlreadyRun = 0;
    timeLabel.text = @"00:00:00";
    NSLog(@"stop1");
    [stopWatchTimer invalidate];
    stopWatchTimer = nil;
}
@end
