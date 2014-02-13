//
//  JaDFInfoViewController.h
//  Freshly
//
//  Created by Enrico Ghirardi on 16/12/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

#import "iRate.h"

@interface JaDFInfoViewController : UIViewController<MFMailComposeViewControllerDelegate>
{
    IBOutlet UIButton *homeBtn;
    IBOutlet UIButton *contactUsBtn;
    IBOutlet UIButton *followTwitterBtn;
    IBOutlet UIButton *websiteBtn;
    IBOutlet UIButton *rateAppBtn;
    IBOutlet UIImageView *mainInfoTxt;
    IBOutlet UIImageView *heart;
    NSString *message;
}

- (IBAction)homeBtnSelected:(id)sender;
- (IBAction)contactUsBtnSelected:(id)sender;
- (IBAction)followTwitterBtnSelected:(id)sender;
- (IBAction)websiteBtnSelected:(id)sender;
- (IBAction)rateAppBtnSelected:(id)sender;

-(void)showPicker;
-(void)displayComposerSheet;
-(void)launchMailAppOnDevice;

@end
