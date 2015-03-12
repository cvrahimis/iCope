//
//  LeftViewController.h
//  SwipeFunctionality
//
//  Created by Costas Simiharv on 12/31/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNRevealViewControllerProtocol.h"

@interface LeftViewController : UIViewController <RNRevealViewControllerProtocol> {
    long currentTime;
}
    
-(id) init;
@property (strong, nonatomic) IBOutlet UIImageView *background;

@end
