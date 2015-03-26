//
//  MusicViewController.m
//  Pumped
//
//  Created by Costas Simiharv on 12/8/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import "MusicViewController.h"
#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@implementation MusicViewController

@synthesize playButton;
@synthesize rewind;
@synthesize fastforward;
@synthesize volume;
@synthesize songTitle;
@synthesize artist;
@synthesize album;
@synthesize albumCover;
@synthesize showMediaPicker;
@synthesize currentPosition;
@synthesize background;
@synthesize songInfo;
@synthesize duration;
@synthesize musicPlayer;
@synthesize startTime;
@synthesize endTime;

-(id)init{
    if(self = [super init])
    {
        currentTime = [self Time];
        [self initBackground];
        
        startTime = [NSDate date];
        
        playButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, frameWidth * .4, frameWidth * .4)];
        playButton.center = CGPointMake(frameWidth / 2, frameHeight * .9);
        [playButton setImage: [UIImage imageNamed: @"play.png"] forState: UIControlStateNormal];
        [playButton addTarget: self action:@selector(playPause:) forControlEvents: UIControlEventTouchDown];
        [self.view addSubview: playButton];
        
        fastforward = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, frameWidth * .4, frameWidth * .4)];
        fastforward.center = CGPointMake(frameWidth * .8, frameHeight * .9);
        [fastforward setImage: [UIImage imageNamed: @"fastforward.png"] forState: UIControlStateNormal];
        [fastforward addTarget: self action:@selector(nextSong:) forControlEvents: UIControlEventTouchDown];
        [self.view addSubview: fastforward];
        
        rewind = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, frameWidth * .4, frameWidth * .4)];
        rewind.center = CGPointMake(frameWidth * .2, frameHeight * .9);
        [rewind setImage: [UIImage imageNamed: @"rewind.png"] forState: UIControlStateNormal];
        [rewind addTarget: self action:@selector(previousSong:) forControlEvents: UIControlEventTouchDown];
        [self.view addSubview: rewind];
        
        volume = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .7, 30)];
        volume.center = CGPointMake(frameWidth / 2, frameHeight * .8);
        volume.backgroundColor = [UIColor clearColor];
        volume.minimumValue = 0.0f;
        volume.maximumValue = 1.0f;
        volume.continuous = YES;
        volume.value = 0.5f;
        [volume addTarget:self action:@selector(volumeChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview: volume];
        
        /*currentPosition = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .7, 30)];//initWithProgressViewStyle: UIProgressViewStyleDefault];
         currentPosition.center = CGPointMake(frameWidth / 2, frameHeight * .75);
         [self.view addSubview: currentPosition];
         */
        
        songInfo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight * .2)];
        songInfo.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:.2];
        songInfo.center = CGPointMake(frameWidth * .5, frameHeight * .65);
        //songInfo.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:songInfo];
        
        songTitle = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, frameWidth, frameHeight * .5)];
        songTitle.center = CGPointMake(self.songInfo.bounds.size.width * .5, self.songInfo.bounds.size.height * .2);
        songTitle.text = @"Title: ";
        songTitle.textAlignment = NSTextAlignmentCenter;
        songTitle.font = [UIFont fontWithName: @"Helvetica" size: 20];
        songTitle.textColor = [UIColor whiteColor];
        [songInfo addSubview: songTitle];
        
        artist = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, frameWidth, frameHeight * .2)];
        artist.center = CGPointMake(self.songInfo.bounds.size.width * .5, self.songInfo.bounds.size.height * .4);
        artist.text = @"Artist: ";
        artist.textAlignment = NSTextAlignmentCenter;
        artist.font = [UIFont fontWithName: @"Helvetica" size: 20];
        artist.textColor = [UIColor whiteColor];
        [songInfo addSubview: artist];
        
        album = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, frameWidth, frameHeight * .6)];
        album.center = CGPointMake(self.songInfo.bounds.size.width * .5, self.songInfo.bounds.size.height * .6);
        album.text = @"Album: ";
        album.textAlignment = NSTextAlignmentCenter
        ;
        album.font = [UIFont fontWithName: @"Helvetica" size: 20];
        album.textColor = [UIColor whiteColor];
        [songInfo addSubview: album];
        
        showMediaPicker = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        showMediaPicker.frame = CGRectMake(0, 0, frameWidth*.6, frameHeight * .05);
        showMediaPicker.center = CGPointMake(frameWidth * .5, frameHeight * .5);
        showMediaPicker.opaque = YES;
        showMediaPicker.layer.cornerRadius = 12;
        showMediaPicker.clipsToBounds = YES;
        showMediaPicker.backgroundColor = [UIColor blueColor];
        showMediaPicker.tintColor = [UIColor whiteColor];
        [showMediaPicker setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [showMediaPicker.titleLabel setFont:[UIFont systemFontOfSize: 22]];
        [showMediaPicker setTitle:@"Show Media Picker" forState:UIControlStateNormal];
        [showMediaPicker addTarget:self action:@selector(showMediaPicker:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: showMediaPicker];
        
        albumCover = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .6, frameHeight * .3)];
        albumCover.center = CGPointMake(frameWidth /2, frameHeight * .3);
        //albumCover.image = [UIImage imageNamed:@"bluredDumbBells.png"];
        //albumCover.backgroundColor = [UIColor whiteColor];
        [self.view addSubview: albumCover];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                 initWithTitle:@"Done"
                                                 style:UIBarButtonItemStyleDone
                                                 target:self
                                                 action:@selector(done)];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    
    [volume setValue:[musicPlayer volume]];
    
    if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        
        [playButton setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        
    } else {
        
        [playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    }
    [self registerMediaPlayerNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"Music";
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        [musicPlayer stop];
    }
}

-(void) done{
    if([musicPlayer playbackState] == MPMusicPlaybackStatePlaying)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Do you want to keep playing music?"  delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alert show];
    }
    
    endTime = [NSDate date];
    NSTimeInterval timeDifference = [endTime timeIntervalSinceDate:startTime];
    NSInteger seconds = timeDifference;
    NSInteger hours = seconds / 3600;
    seconds = seconds - (hours * 3600);
    NSInteger minuets = seconds / 60;
    seconds = seconds - (minuets * 60);
    
    
    RatingViewController *rvc = [[RatingViewController alloc]init];
    rvc.duration = [[[[[[NSString stringWithFormat:@"%li", (long)hours] stringByAppendingString:@" hours "] stringByAppendingString:[NSString stringWithFormat:@"%li", (long)minuets]] stringByAppendingString:@" minuets " ] stringByAppendingString:[NSString stringWithFormat:@"%li", (long)seconds]] stringByAppendingString:@" seconds"];
    rvc.time = startTime;
    rvc.activity = @"Music";
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rvc];
    
    //now present this navigation controller modally
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}


/*- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 {
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }*/

- (void) registerMediaPlayerNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver: self
                           selector: @selector (handle_NowPlayingItemChanged:)
                               name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                             object: musicPlayer];
    
    [notificationCenter addObserver: self
                           selector: @selector (handle_PlaybackStateChanged:)
                               name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
                             object: musicPlayer];
    
    [notificationCenter addObserver: self
                           selector: @selector (handle_VolumeChanged:)
                               name: MPMusicPlayerControllerVolumeDidChangeNotification
                             object: musicPlayer];
    
    [musicPlayer beginGeneratingPlaybackNotifications];
}


- (void) handle_NowPlayingItemChanged: (id) notification //displays song info title atrtist album
{
   	MPMediaItem *currentItem = [musicPlayer nowPlayingItem];
    UIImage *artworkImage = [UIImage imageNamed:@"musicNote.png"];
    MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
    
    if (artwork) {
        artworkImage = [artwork imageWithSize: CGSizeMake (200, 200)];
    }
    
    [albumCover setImage:artworkImage];
    
    NSString *titleString = [currentItem valueForProperty:MPMediaItemPropertyTitle];
    if (titleString)
    {
        songTitle.text = [NSString stringWithFormat:@"Title: %@",titleString];
    }
    else
    {
        songTitle.text = @"Title: Unknown title";
    }
    
    NSString *artistString = [currentItem valueForProperty:MPMediaItemPropertyArtist];
    if (artistString)
    {
        artist.text = [NSString stringWithFormat:@"Artist: %@",artistString];
    }
    else
    {
        artist.text = @"Artist: Unknown artist";
    }
    
    NSString *albumString = [currentItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    if (albumString)
    {
        album.text = [NSString stringWithFormat:@"Album: %@",albumString];
    }
    else
    {
        album.text = @"Album: Unknown album";
    }
    
}


- (void) handle_PlaybackStateChanged: (id) notification //Change the play button icon if paused stopped or played
{
    MPMusicPlaybackState playbackState = [musicPlayer playbackState];
    
    if (playbackState == MPMusicPlaybackStatePaused)
    {
        [playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    }
    else if (playbackState == MPMusicPlaybackStatePlaying)
    {
        [playButton setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    }
    else if (playbackState == MPMusicPlaybackStateStopped)
    {
        [playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [musicPlayer stop];
    }
    
}

- (void) handle_VolumeChanged: (id) notification //change the slider if volume changes
{
    [volume setValue:[musicPlayer volume]];
}

#pragma mark - Media Picker

- (IBAction)showMediaPicker:(id)sender //show music library
{
    MPMediaPickerController *mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeAny];
    
    mediaPicker.delegate = self;
    mediaPicker.allowsPickingMultipleItems = YES;
    mediaPicker.prompt = @"Select songs to play";
    
    [self presentViewController:mediaPicker animated:YES completion:nil];
    mediaPicker = nil;
}

//Make a playlist of songs selected and come back to app
- (void) mediaPicker: (MPMediaPickerController *) mediaPicker didPickMediaItems: (MPMediaItemCollection *) mediaItemCollection
{
    if (mediaItemCollection)
    {
        [musicPlayer setQueueWithItemCollection: mediaItemCollection];
        [musicPlayer play];
    }
    [self dismissViewControllerAnimated: YES completion:nil];
}


- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker
{
    [self dismissViewControllerAnimated: YES completion:nil];
}

#pragma mark - Controls
- (IBAction)volumeChanged:(id)sender
{
    [musicPlayer setVolume:[volume value]];
}

- (IBAction)previousSong:(id)sender
{
    [musicPlayer skipToPreviousItem];
}

- (IBAction)playPause:(id)sender
{
    if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [musicPlayer pause];
        //MPMediaItem *mediaItem;
    }
    else
    {
        [musicPlayer play];
    }
}

- (IBAction)nextSong:(id)sender
{
    [musicPlayer skipToNextItem];
}

-(long) Time {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    long timeOfDayInHours = [timeOfDayInHoursString integerValue];
    return timeOfDayInHours;
}

-(void) initBackground {
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
    if (currentTime < 12) background.image = [UIImage imageNamed:@"Morning"];
    else if (currentTime > 12 && currentTime < 18) background.image = [UIImage imageNamed:@"Afternoon"];
    else background.image = [UIImage imageNamed:@"Evening"];
    [self.view addSubview: background];
}

@end
