//
//  MusicViewController.h
//  Pumped
//
//  Created by Costas Simiharv on 12/8/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "RatingViewController.h"

@interface MusicViewController : UIViewController<MPMediaPickerControllerDelegate> {
    UIButton *playButton;
    UIButton *rewind;
    UIButton *fastforward;
    UISlider *volume;
    UILabel *songTitle;
    UILabel *artist;
    UILabel *album;
    UIImageView *albumCover;
    UIButton *showMediaPicker;
    //UIProgressView *currentPosition;
    UISlider *currentPosition;
    UIImageView *background;
    MPMusicPlayerController *musicPlayer;
    UIView *songInfo;
    NSNumber *duration;
    NSInteger *currentTime;
}

@property(nonatomic, strong) UIButton *playButton;
@property(nonatomic, strong) UIButton *rewind;
@property(nonatomic, strong) UIButton *fastforward;
@property(nonatomic, strong) UISlider *volume;
@property(nonatomic, strong) UILabel *songTitle;
@property(nonatomic, strong) UILabel *artist;
@property(nonatomic, strong) UILabel *album;
@property(nonatomic, strong) UIImageView *albumCover;
@property(nonatomic, strong) UIButton *showMediaPicker;
//@property(nonatomic, strong) UIProgressView *currentPosition;
@property(nonatomic,strong) UISlider *currentPosition;
@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) MPMusicPlayerController *musicPlayer;
@property (nonatomic, strong) UIView *songInfo;
@property (nonatomic, strong) NSNumber *duration;

- (IBAction)showMediaPicker:(id)sender;
- (IBAction)volumeChanged:(id)sender;
- (IBAction)previousSong:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)nextSong:(id)sender;
- (void) registerMediaPlayerNotifications;
@end
