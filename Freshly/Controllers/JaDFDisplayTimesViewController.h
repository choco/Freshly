//
//  JaDFDisplayTimesViewController.h
//  Freshly
//
//  Created by Enrico Ghirardi on 23/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "JaDFreshlyCore.h"

@interface JaDFDisplayTimesViewController : UIViewController
{
    UIButton *subNavBar;
    IBOutlet UIImageView *bottomBar;
    IBOutlet UIButton *homeButton;
    //UIImageView *timesTable;
    UIImageView *timesTableLeft;
    UIImageView *timesTableRight;
    UIImageView *subNavBarText;
    UIImageView *helpText;
    int tableColor;
    
    UILabel *firstTime;
    UILabel *secondTime;
    UILabel *thirdTime;
    UILabel *fourthTime;
    UILabel *fifthTime;
    
    UILabel *firstTimeAMorPM;
    UILabel *secondTimeAMorPM;
    UILabel *thirdTimeAMorPM;
    UILabel *fourthTimeAMorPM;
    UILabel *fifthTimeAMorPM;  
    
    UIButton *overlayButton;
    UIImageView *arrowOverlay1;
    UIImageView *arrowOverlay2;
    UIImageView *tooltipTxt1;
    UIImageView *tooltipTxt2;
}

@property (strong, nonatomic) UIButton *subNavBar;
@property (strong, nonatomic) UIImageView *timesTable;
@property (strong, nonatomic) UIImageView *helpText;
@property (strong, nonatomic) NSArray *times;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil colorAndTextCombination:(int)combination;
- (IBAction)homeBtnSelected:(id)sender;

@end
