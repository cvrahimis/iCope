//
//  MovieViewController.h
//  MoviePlay
//
//  Created by Lubomir Ivanov on 10/5/13.
//  Copyright (c) 2013 L.Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MPMediaPlayback.h>
#import "ViewControllerDelegate.h"

@interface MovieViewController : UIViewController 
{
  MPMoviePlayerController *myVidPlayer;
  __weak NSObject<ViewControllerDelegate> *delegate;
}

- (id) initWithDelegate:(id)pDel andVidName:(NSString*) vidName;

@end
