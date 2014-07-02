//
//  ViewController.m
//  MoviePlayer
//
//  Created by Mark Dumes on 11/7/13.
//  Copyright (c) 2013 Mark Dumes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *hello;
}

@end

@implementation ViewController
@synthesize moviePlayer;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playbutton:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
pathForResource:@"Apple_Think_Different" ofType:@"mp4"]];
    moviePlayer =  [[MPMoviePlayerController alloc]initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(moviePlayBackDidFinish:)
    name:MPMoviePlayerPlaybackDidFinishNotification
    object:moviePlayer];
    
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}
- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}
@end
