//
//  MachinesViewController.m
//  Pumped
//
//  Created by Costas Simiharv on 12/6/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import "MachinesViewController.h"
//#import "Exercises.h"
//#import "User.h"

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height


@implementation MachinesViewController

@synthesize background;
@synthesize scrollView;
@synthesize managedObjectContext;
@synthesize image;
@synthesize imgName;
@synthesize caption;
@synthesize header;
@synthesize containerViews;
@synthesize playButtons;
@synthesize musicBTN;
@synthesize summaryBTN;

- (id) initWithArray:(NSArray*) equipt
{
    if (self = [super init])
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        equiptment = equipt;
        
        /*self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(musicView)];
        self.navigationItem.rightBarButtonItem.title = @"Music";
        */
        background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
        background.image = [UIImage imageNamed:@"GymWeights.png"];
        [self.view addSubview: background];
        
        /*header = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, frameWidth, frameHeight * .2)];
        header.center = CGPointMake(frameWidth * .5, frameHeight * .15);
        header.text = @"Instruction Videos\n to Workout";
        header.lineBreakMode = NSLineBreakByWordWrapping;
        header.textAlignment = NSTextAlignmentCenter;
        header.numberOfLines = 2;
        header.font = [UIFont fontWithName: @"Helvetica-Bold" size: 30];
        header.textColor = [UIColor colorWithRed: .0 green: .300 blue: .0 alpha: 1.0];
        [self.view addSubview: header];
        */
        
        musicBTN = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        musicBTN.frame = CGRectMake(0, 0, frameWidth * .4, frameHeight * .05);
        musicBTN.center = CGPointMake(frameWidth * .5, frameHeight * .85);
        musicBTN.layer.cornerRadius = 12;
        musicBTN.clipsToBounds = YES;
        musicBTN.opaque = YES;
        musicBTN.backgroundColor = [UIColor colorWithRed: .0 green: .900 blue: .0 alpha: 1.0];
        [musicBTN setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [musicBTN.titleLabel setFont:[UIFont systemFontOfSize: 22]];
        [musicBTN setTitle:@"Music" forState:UIControlStateNormal];
        [musicBTN addTarget:self action:@selector(musicView) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: musicBTN];
        
        summaryBTN = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        summaryBTN.frame = CGRectMake(0, 0, frameWidth * .8, frameHeight * .05);
        summaryBTN.center = CGPointMake(frameWidth * .5, frameHeight * .93);
        summaryBTN.layer.cornerRadius = 12;
        summaryBTN.clipsToBounds = YES;
        summaryBTN.opaque = YES;
        summaryBTN.backgroundColor = [UIColor colorWithRed: .0 green: .900 blue: .0 alpha: 1.0];
        [summaryBTN setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [summaryBTN.titleLabel setFont:[UIFont systemFontOfSize: 22]];
        [summaryBTN setTitle:@"Workout Log" forState:UIControlStateNormal];
        [summaryBTN addTarget:self action:@selector(workoutHists) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: summaryBTN];
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .8, frameHeight * .65)];
        scrollView.center = CGPointMake(frameWidth * .5, frameHeight * .45);
        scrollView.backgroundColor = [UIColor colorWithRed: .0 green: .900 blue: .0 alpha: 1.0];
        //scrollView.pagingEnabled = true
        scrollView.scrollEnabled = true;
        scrollView.userInteractionEnabled = true;
        scrollView.showsVerticalScrollIndicator = true;
        
        [self.view addSubview: scrollView];
        
        
        CGFloat scrollHeight = self.scrollView.bounds.size.height;
        CGFloat scrollWidth = self.scrollView.bounds.size.width;
        
        containerViews = [[NSMutableArray alloc] init];
        CGFloat heightOfContent = scrollHeight / 2;
        CGFloat initialOffset = heightOfContent;
        int count = 0;
        /*for (NSManagedObject *info in equiptment)
        {
            UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, scrollHeight, scrollWidth, scrollHeight)];
            containerView.center = CGPointMake(scrollWidth / 2, heightOfContent);
            containerView.backgroundColor = [UIColor colorWithRed: .0 green: .900 blue: .0 alpha: 1.0];
            
            image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, scrollHeight * .95)];
            NSArray *picture = [[info valueForKey:@"pictures"] componentsSeparatedByString:@"|"];
            for(int i = 0; i < [picture count]; i++){
                NSLog(@"%@",picture[i]);
            }
            //if ([picture count] == 1)
            //{
                image.image = [UIImage imageNamed: picture[0]];
                [containerView addSubview:image];
            //}
            if(![@"" isEqualToString:[info valueForKey:@"exerciseVid"]])
            {
                UIButton *playButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, scrollWidth*.15, scrollWidth*.15)];
                playButton.center = CGPointMake(image.bounds.size.width/2.0, image.bounds.size.height/2.0);
                [playButton setImage: [UIImage imageNamed: @"play.png"] forState: UIControlStateNormal];
                playButton.tag = count;
                [containerView addSubview: playButton];
                [playButton addTarget: self action:@selector(showVideo:) forControlEvents: UIControlEventTouchDown];
            }
            
            caption = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, scrollWidth, scrollHeight * .05)];
            caption.center = CGPointMake(scrollWidth / 2, scrollHeight * .97);
            caption.text = [info valueForKey:@"exerciseName"];
            caption.textAlignment = NSTextAlignmentCenter;
            caption.font = [UIFont fontWithName: @"Helvetica-Bold" size: 20];
            caption.textColor = [UIColor whiteColor];
            [containerView addSubview: caption];
            
            [containerViews addObject:containerView];
            [scrollView addSubview:containerView];
            
            heightOfContent = heightOfContent + scrollHeight;
            count++;
        }
        scrollView.contentSize = CGSizeMake(frameWidth * .7, heightOfContent - initialOffset);
         */
        
    }
    return self;
}

-(void) musicView{
    MusicViewController *musicVC = [[MusicViewController alloc] init];
    [self.navigationController pushViewController:musicVC animated:YES];
}

-(void) workoutHists{
    //WorkoutSumViewController *wVC = [[WorkoutSumViewController alloc] initWithNSManagedObjectContext: managedObjectContext];
    WorkoutSumViewController *wVC = [[WorkoutSumViewController alloc] init];
    wVC.managedObjectContext = [self managedObjectContext];
    [self.navigationController pushViewController:wVC animated:YES];
}


- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"Workout";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(IBAction)showVideo:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%ld", (long)[sender tag]);
    //NSManagedObject *info = [equiptment objectAtIndex:[sender tag]];
    //mv = [[MovieViewController alloc] initWithDelegate: self andVidName: [info valueForKey:@"exerciseVid"]];
    //[self.navigationController pushViewController: mv animated: YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
