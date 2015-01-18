//
//  MovieViewController.m
//  MoviePlay
//
//  Created by Lubomir Ivanov on 10/5/13.
//  Copyright (c) 2013 L.Ivanov. All rights reserved.
//

#import "MovieViewController.h"

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height


@interface MovieViewController ()

@end

@implementation MovieViewController

- (id) initWithDelegate: (id) del andVidName:(NSString*) vidName
{
  if (self = [super init])
  {
    self.view.backgroundColor = [UIColor blackColor];
    
    myVidPlayer = nil;
    
    delegate = del;
    
    [self displayVideo: vidName];
    
  }
  return self;
}


- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)vController animated:(BOOL)animated
{
	[vController viewWillAppear:animated];
}


- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
	[self.navigationController setNavigationBarHidden: YES];
	
}


-(void) displayVideo:(NSString*) vid
{
  NSString *videoFilePath = [[NSBundle mainBundle] pathForResource: [vid stringByDeletingPathExtension] ofType: @"mp4"];
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: videoFilePath];
  NSLog(@"path: %@", videoFilePath);
  myVidPlayer = [[MPMoviePlayerController alloc] initWithContentURL: fileURL];
  myVidPlayer.view.frame = CGRectMake(5.0, 5.0, frameWidth - 10, frameHeight - 10);
  myVidPlayer.initialPlaybackTime = 0;
  myVidPlayer.scalingMode = MPMovieScalingModeAspectFit;
  [self.view addSubview: myVidPlayer.view];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(vidDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification  object: myVidPlayer];
	
	[myVidPlayer play];
}


-(void) resetMovieView
{
	if (myVidPlayer != nil)
	{
	  [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:myVidPlayer];
    
	  myVidPlayer.initialPlaybackTime = -1;
    [myVidPlayer.view removeFromSuperview];
    
	  [myVidPlayer stop];
	  myVidPlayer = nil;
	}
    [self.navigationController popViewControllerAnimated: YES];
}

- (void) vidDidFinish:(NSNotification*)notification
{
    [self resetMovieView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
