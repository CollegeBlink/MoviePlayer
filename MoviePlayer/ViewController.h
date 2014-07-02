//
//  ViewController.h
//  MoviePlayer
//
//  Created by Mark Dumes on 11/7/13.
//  Copyright (c) 2013 Mark Dumes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController
{
    MPMoviePlayerController *moviePlayer;
}
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
- (IBAction)playbutton:(id)sender;

@end
