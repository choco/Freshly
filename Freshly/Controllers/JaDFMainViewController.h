//
//  MainViewController.h
//  Freshly
//
//  Created by Enrico Ghirardi on 23/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "JaDFDisplayTimesViewController.h"
#import "JaDFChooseTimeViewController.h"
#import "JaDFInfoViewController.h"
#import "JaDFreshlyCore.h"

@interface JaDFMainViewController : UIViewController <UINavigationControllerDelegate>
{
    UIButton *sleepNowBtn;
    UIButton *chooseTimeBtn;
    UIImageView *startViewUp;
    UIImageView *startViewDown;
    IBOutlet UIButton *settingsBtn;
    IBOutlet UIButton *infoBtn;
    IBOutlet UIImageView *sleepNowTxt;
    IBOutlet UIImageView *chooseTimeTxt;
    IBOutlet UIImageView *arrow1;
    IBOutlet UIImageView *arrow2;
    IBOutlet UIImageView *sleepNowLogo;
    IBOutlet UIImageView *chooseTimeLogo;
}

@property (nonatomic, strong) IBOutlet UIButton *sleepNowBtn;
@property (nonatomic, strong) IBOutlet UIButton *chooseTimeBtn;

- (IBAction)sleepNowSelected:(id)sender;
- (IBAction)chooseTimeSelected:(id)sender;
- (IBAction)settingsBtnSelected:(id)sender;
- (IBAction)infoBtnSelected:(id)sender;

- (void)startupAnimationDone;


@end
