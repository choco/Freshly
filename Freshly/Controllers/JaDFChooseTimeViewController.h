//
//  JaDFChooseTimeViewController.h
//  Freshly
//
//  Created by Enrico Ghirardi on 27/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "JaDFDisplayTimesViewController.h"
#import "JaDFreshlyCore.h"
#import "KSAdvancedPicker.h"

@interface JaDFChooseTimeViewController : UIViewController <KSAdvancedPickerDelegate> 
{
    int AMorPM;
    NSMutableArray *hourData;
    NSMutableArray *minutesData;
    KSAdvancedPicker *hourPicker;
    KSAdvancedPicker *minutesPicker;
    IBOutlet UIButton *homeBtn;
    IBOutlet UIButton *subNavBar;
    UIImageView *chooseTimeOverlay;
    IBOutlet UIButton *doneTxt;
    IBOutlet UIImageView *chooseTimeTxt;
    IBOutlet UIImageView *AMandPMHighlighther;
    IBOutlet UIImageView *AMandPMSelector;
    IBOutlet UIImageView *AMandPMTxt;
    IBOutlet UIButton *AMandPMbg;
    IBOutlet UIImageView *bottomBar;
}

- (IBAction)homeBtnSelected:(id)sender;
- (IBAction)doneBtnSelected:(id)sender;
- (IBAction)AMandPMbgSelected:(id)sender;

@end
