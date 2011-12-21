//
//  JaDFDisplayTimesViewController.m
//  Freshly
//
//  Created by Enrico Ghirardi on 23/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "JaDFDisplayTimesViewController.h"

#define kCornerRadius 15.f
#define kAnimationDuration 0.5f

@implementation JaDFDisplayTimesViewController

@synthesize subNavBar, timesTable, helpText, times;
/*
- (void)viewWillDisappearAnimation
{
    [UIView animateWithDuration:1.0 animations:^{
        [subNavBar setFrame:CGRectMake(0.0, 44.0+364, 320.0, 62.0)];
        [timesTableLeft setFrame:CGRectMake(33.0, 155.0+364, 255.0/2.0, 238.0)];
        [timesTableRight setFrame:CGRectMake(33.0+(255.0/2.0), 155.0+364, 255.0/2.0, 238.0)];
        [helpText setFrame:CGRectMake(0.0, 114.0+364, 320.0, 35.0)];
        [subNavBarText setFrame:CGRectMake(0.0, 68.0+364, 320.0, 23.0)];
        [firstTime setFrame:CGRectMake(6, 168+364, 240, 100)];
        [firstTimeAMorPM setFrame:CGRectMake(245.0, 212+364, 80, 50)];
        [secondTime setFrame:CGRectMake(16, 276+364, 120, 60)];
        [secondTimeAMorPM setFrame:CGRectMake(137.0, 289+364, 80, 50)];
        [thirdTime setFrame:CGRectMake(16+127, 276+364, 120, 60)];
        [thirdTimeAMorPM setFrame:CGRectMake(137.0+127, 289+364, 80, 50)];
        [fourthTime setFrame:CGRectMake(16, 275+60+364, 120, 60)];
        [fourthTimeAMorPM setFrame:CGRectMake(137.0, 288+60+364, 80, 50)];
        [fifthTime setFrame:CGRectMake(16+127, 275+60+364, 120, 60)];
        [fifthTimeAMorPM setFrame:CGRectMake(137.0+127, 288+60+364, 80, 50)];
        homeButton.alpha = 0;}
                     completion:^(BOOL finished){
                     }];
}*/

- (void)animateOverlay
{
    [UIView animateWithDuration:0.5f animations:^{
        arrowOverlay1.alpha = 1;
        arrowOverlay2.alpha = 1;
        overlayButton.alpha = 1;
        tooltipTxt1.alpha = 1;
        tooltipTxt2.alpha = 1;
    }];
}

- (void)dismissOverlay:(id)sender
{
    [UIView animateWithDuration:0.5f animations:^{
        arrowOverlay1.alpha = 0;
        arrowOverlay2.alpha = 0;
        overlayButton.alpha = 0;
        tooltipTxt1.alpha = 0;
        tooltipTxt2.alpha = 0;       
    }completion:^(BOOL finished)
     {
         [arrowOverlay1 removeFromSuperview];
         [arrowOverlay2 removeFromSuperview];
         [tooltipTxt1 removeFromSuperview];
         [tooltipTxt2 removeFromSuperview];
         [overlayButton removeFromSuperview];
     }];

}

- (void)checkFirstLaunch
{
    if (tableColor==1) {
        if ([NSUserDefaults standardUserDefaults].firstLaunchSleepTimes) {
            overlayButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
            overlayButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75];
            [overlayButton addTarget:self action:@selector(dismissOverlay:) forControlEvents:UIControlEventTouchUpInside];
            overlayButton.alpha = 0;
            [self.view addSubview:overlayButton];
            arrowOverlay1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FirstArrow"]];
            arrowOverlay2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SecondArrow"]];
            arrowOverlay1.alpha = 0;
            arrowOverlay2.alpha = 0;
            arrowOverlay1.frame = CGRectMake(225, 105, arrowOverlay1.frame.size.width, arrowOverlay1.frame.size.height);
            arrowOverlay2.frame = CGRectMake(30, 250, arrowOverlay2.frame.size.width, arrowOverlay2.frame.size.height);
            [self.view addSubview:arrowOverlay1];
            [self.view addSubview:arrowOverlay2];
            tooltipTxt1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TooltipTxt1"]];
            tooltipTxt2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TooltipTxt2"]];
            tooltipTxt1.alpha = 0;
            tooltipTxt2.alpha = 0;
            tooltipTxt1.frame = CGRectMake(170, 160, tooltipTxt1.frame.size.width, tooltipTxt1.frame.size.height);
            tooltipTxt2.frame = CGRectMake(35, 325, tooltipTxt2.frame.size.width, tooltipTxt2.frame.size.height);
            [self.view addSubview:tooltipTxt1];
            [self.view addSubview:tooltipTxt2];
            [[NSUserDefaults standardUserDefaults] setFirstLaunchSleepTimes:NO];
            [self animateOverlay];
        }
    }
    else
    {
        if ([NSUserDefaults standardUserDefaults].firstLaunchWakeTimes) {
            overlayButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
            overlayButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75];
            [overlayButton addTarget:self action:@selector(dismissOverlay:) forControlEvents:UIControlEventTouchUpInside];
            overlayButton.alpha = 0;
            [self.view addSubview:overlayButton];
            arrowOverlay1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FirstArrow"]];
            arrowOverlay2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SecondArrow"]];
            arrowOverlay1.alpha = 0;
            arrowOverlay2.alpha = 0;
            arrowOverlay1.frame = CGRectMake(225, 105, arrowOverlay1.frame.size.width, arrowOverlay1.frame.size.height);
            arrowOverlay2.frame = CGRectMake(30, 250, arrowOverlay2.frame.size.width, arrowOverlay2.frame.size.height);
            [self.view addSubview:arrowOverlay1];
            [self.view addSubview:arrowOverlay2];
            tooltipTxt1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TooltipTxt3"]];
            tooltipTxt2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TooltipTxt2"]];
            tooltipTxt1.alpha = 0;
            tooltipTxt2.alpha = 0;
            tooltipTxt1.frame = CGRectMake(170, 160, tooltipTxt1.frame.size.width, tooltipTxt1.frame.size.height);
            tooltipTxt2.frame = CGRectMake(35, 325, tooltipTxt2.frame.size.width, tooltipTxt2.frame.size.height);
            [self.view addSubview:tooltipTxt1];
            [self.view addSubview:tooltipTxt2];
            [[NSUserDefaults standardUserDefaults] setFirstLaunchWakeTimes:NO];
            [self animateOverlay];        
        }  
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [subNavBar setFrame:CGRectMake(0.0, 44.0, 320.0, 62.0)];
        [timesTableLeft setFrame:CGRectMake(33.0, 155.0, 255.0/2.0, 238.0)];
        [timesTableRight setFrame:CGRectMake(33.0+(255.0/2.0), 155.0, 255.0/2.0, 238.0)];
        [helpText setFrame:CGRectMake(0.0, 114.0, 320.0, 35.0)];
        [subNavBarText setFrame:CGRectMake(0.0, 68.0, 320.0, 23.0)];
        [firstTime setFrame:CGRectMake(6, 168, 240, 100)];
        [firstTimeAMorPM setFrame:CGRectMake(245.0, 212, 80, 50)];
        [secondTime setFrame:CGRectMake(16, 276, 120, 60)];
        [secondTimeAMorPM setFrame:CGRectMake(137.0, 289, 80, 50)];
        [thirdTime setFrame:CGRectMake(16+127, 276, 120, 60)];
        [thirdTimeAMorPM setFrame:CGRectMake(137.0+127, 289, 80, 50)];
        [fourthTime setFrame:CGRectMake(16, 275+60, 120, 60)];
        [fourthTimeAMorPM setFrame:CGRectMake(137.0, 288+60, 80, 50)];
        [fifthTime setFrame:CGRectMake(16+127, 275+60, 120, 60)];
        [fifthTimeAMorPM setFrame:CGRectMake(137.0+127, 288+60, 80, 50)];
        homeButton.alpha = 1;}
                     completion:^(BOOL finished){
                         [self checkFirstLaunch];
                     }];



}

- (void)refreshTimes
{
    [self setTimes:[JaDFreshlyCore sleepTimesGivenDate:[NSDate date]]];
}

- (void)setTimes:(NSMutableArray *)timesArray
{
    times = timesArray;
    firstTime.text = [times objectAtIndex:6];
    firstTimeAMorPM.text = [times objectAtIndex:7];
    secondTime.text = [times objectAtIndex:8];
    secondTimeAMorPM.text = [times objectAtIndex:9];
    thirdTime.text = [times objectAtIndex:4];
    thirdTimeAMorPM.text = [times objectAtIndex:5];
    fourthTime.text = [times objectAtIndex:2];
    fourthTimeAMorPM.text = [times objectAtIndex:3];
    fifthTime.text = [times objectAtIndex:0];
    fifthTimeAMorPM.text = [times objectAtIndex:1];
}

- (IBAction)homeBtnSelected:(id)sender
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [subNavBar setFrame:CGRectMake(0.0, 44.0+364, 320.0, 62.0)];
        [timesTableLeft setFrame:CGRectMake(33.0, 155.0+364, 255.0/2.0, 238.0)];
        [timesTableRight setFrame:CGRectMake(33.0+(255.0/2.0), 155.0+364, 255.0/2.0, 238.0)];
        [helpText setFrame:CGRectMake(0.0, 114.0+364, 320.0, 35.0)];
        [subNavBarText setFrame:CGRectMake(0.0, 68.0+364, 320.0, 23.0)];
        [firstTime setFrame:CGRectMake(6, 168+364, 240, 100)];
        [firstTimeAMorPM setFrame:CGRectMake(245.0, 212+364, 80, 50)];
        [secondTime setFrame:CGRectMake(16, 276+364, 120, 60)];
        [secondTimeAMorPM setFrame:CGRectMake(137.0, 289+364, 80, 50)];
        [thirdTime setFrame:CGRectMake(16+127, 276+364, 120, 60)];
        [thirdTimeAMorPM setFrame:CGRectMake(137.0+127, 289+364, 80, 50)];
        [fourthTime setFrame:CGRectMake(16, 275+60+364, 120, 60)];
        [fourthTimeAMorPM setFrame:CGRectMake(137.0, 288+60+364, 80, 50)];
        [fifthTime setFrame:CGRectMake(16+127, 275+60+364, 120, 60)];
        [fifthTimeAMorPM setFrame:CGRectMake(137.0+127, 288+60+364, 80, 50)];
        homeButton.alpha = 0;}
                     completion:^(BOOL finished){
                         [self.navigationController popToRootViewControllerAnimated:NO];
                     }];
}

- (void)subNavBarSelected:(id)sender
{
    if (tableColor!=1) {
        [UIView animateWithDuration:kAnimationDuration animations:^{
            [subNavBar setFrame:CGRectMake(0.0, 44.0+364, 320.0, 62.0)];
            [timesTableLeft setFrame:CGRectMake(33.0, 155.0+364, 255.0/2.0, 238.0)];
            [timesTableRight setFrame:CGRectMake(33.0+(255.0/2.0), 155.0+364, 255.0/2.0, 238.0)];
            [helpText setFrame:CGRectMake(0.0, 114.0+364, 320.0, 35.0)];
            [subNavBarText setFrame:CGRectMake(0.0, 68.0+364, 320.0, 23.0)];
            [firstTime setFrame:CGRectMake(6, 168+364, 240, 100)];
            [firstTimeAMorPM setFrame:CGRectMake(245.0, 212+364, 80, 50)];
            [secondTime setFrame:CGRectMake(16, 276+364, 120, 60)];
            [secondTimeAMorPM setFrame:CGRectMake(137.0, 289+364, 80, 50)];
            [thirdTime setFrame:CGRectMake(16+127, 276+364, 120, 60)];
            [thirdTimeAMorPM setFrame:CGRectMake(137.0+127, 289+364, 80, 50)];
            [fourthTime setFrame:CGRectMake(16, 275+60+364, 120, 60)];
            [fourthTimeAMorPM setFrame:CGRectMake(137.0, 288+60+364, 80, 50)];
            [fifthTime setFrame:CGRectMake(16+127, 275+60+364, 120, 60)];
            [fifthTimeAMorPM setFrame:CGRectMake(137.0+127, 288+60+364, 80, 50)];
            /*homeButton.alpha = 0;*/}
                         completion:^(BOOL finished){
                             [self.navigationController popViewControllerAnimated:NO];
                         }
         ];
    }
    else
    {
        [self refreshTimes];
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil colorAndTextCombination:(int)combination
{
    tableColor = combination;
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view.layer setMasksToBounds:TRUE];
        [self.view.layer setCornerRadius:kCornerRadius];
        subNavBar = [UIButton buttonWithType:UIButtonTypeCustom];
        if (tableColor == 1) {
            [subNavBar setBackgroundImage:[UIImage imageNamed:@"SubNavBarOrange"] forState:UIControlStateNormal];
            [subNavBar setBackgroundImage:[UIImage imageNamed:@"SubNavBarOrangeSel"] forState:UIControlStateHighlighted];
            //timesTable = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TimesTableYellow"]];
            timesTableLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HalfTimesTableYellow"]];
            timesTableRight = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:[UIImage imageNamed:@"HalfTimesTableYellow"].CGImage scale:1.0 orientation:UIImageOrientationUpMirrored]];
            helpText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SleepNowTxt"]];
            subNavBarText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"JustSleepNowTxt"]];
            homeButton.alpha = 0;

        }
        else {
            [subNavBar setBackgroundImage:[UIImage imageNamed:@"SubNavBarYellow"] forState:UIControlStateNormal];
            [subNavBar setBackgroundImage:[UIImage imageNamed:@"SubNavBarYellowSel"] forState:UIControlStateHighlighted];
            //timesTable = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TimesTableOrange"]];
            timesTableLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HalfTimesTableOrange"]];
            timesTableRight = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:[UIImage imageNamed:@"HalfTimesTableOrange"].CGImage scale:1.0 orientation:UIImageOrientationUpMirrored]];
            helpText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ChooseTimeTxt"]];
            subNavBarText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ChooseWakeUpTimeTxt"]];

        }
        [subNavBar setFrame:CGRectMake(0.0, 44.0+364, 320.0, 62.0)];
        [subNavBar addTarget:self action:@selector(subNavBarSelected:) forControlEvents:UIControlEventTouchUpInside];
        //[timesTable setFrame:CGRectMake(33.0, 155.0, 255.0, 238.0)];
        [timesTableLeft setFrame:CGRectMake(33.0, 155.0+364, 255.0/2.0, 238.0)];
        [timesTableRight setFrame:CGRectMake(33.0+(255.0/2.0), 155.0+364, 255.0/2.0, 238.0)];
        [helpText setFrame:CGRectMake(0.0, 114.0+364, 320.0, 35.0)];
        [subNavBarText setFrame:CGRectMake(0.0, 68.0+364, 320.0, 23.0)];
        
        firstTime = [[UILabel alloc] initWithFrame:CGRectMake(6, 168+364, 240, 100)];
        firstTime.backgroundColor = [UIColor clearColor];
        firstTime.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        firstTime.textAlignment = UITextAlignmentRight;
        firstTime.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:80.0];
        
        firstTimeAMorPM = [[UILabel alloc] initWithFrame:CGRectMake(245.0, 212+364, 80, 50)];
        firstTimeAMorPM.backgroundColor = [UIColor clearColor];
        firstTimeAMorPM.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        firstTimeAMorPM.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:25.0];
        
        secondTime = [[UILabel alloc] initWithFrame:CGRectMake(16, 276+364, 120, 60)];
        secondTime.backgroundColor = [UIColor clearColor];
        secondTime.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        secondTime.textAlignment = UITextAlignmentRight;
        secondTime.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:38.0];
        
        secondTimeAMorPM = [[UILabel alloc] initWithFrame:CGRectMake(137.0, 289+364, 80, 50)];
        secondTimeAMorPM.backgroundColor = [UIColor clearColor];
        secondTimeAMorPM.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        secondTimeAMorPM.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:13.0];
        
        thirdTime = [[UILabel alloc] initWithFrame:CGRectMake(16+127, 276+364, 120, 60)];
        thirdTime.backgroundColor = [UIColor clearColor];
        thirdTime.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        thirdTime.textAlignment = UITextAlignmentRight;
        thirdTime.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:38.0];
        
        thirdTimeAMorPM = [[UILabel alloc] initWithFrame:CGRectMake(137.0+127, 289+364, 80, 50)];
        thirdTimeAMorPM.backgroundColor = [UIColor clearColor];
        thirdTimeAMorPM.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        thirdTimeAMorPM.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:13.0];
        
        fourthTime = [[UILabel alloc] initWithFrame:CGRectMake(16, 275+60+364, 120, 60)];
        fourthTime.backgroundColor = [UIColor clearColor];
        fourthTime.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        fourthTime.textAlignment = UITextAlignmentRight;
        fourthTime.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:38.0];
        
        fourthTimeAMorPM = [[UILabel alloc] initWithFrame:CGRectMake(137.0, 288+60+364, 80, 50)];
        fourthTimeAMorPM.backgroundColor = [UIColor clearColor];
        fourthTimeAMorPM.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        fourthTimeAMorPM.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:13.0];
        
        fifthTime = [[UILabel alloc] initWithFrame:CGRectMake(16+127, 275+60+364, 120, 60)];
        fifthTime.backgroundColor = [UIColor clearColor];
        fifthTime.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        fifthTime.textAlignment = UITextAlignmentRight;
        fifthTime.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:38.0];
        
        fifthTimeAMorPM = [[UILabel alloc] initWithFrame:CGRectMake(137.0+127, 288+60+364, 80, 50)];
        fifthTimeAMorPM.backgroundColor = [UIColor clearColor];
        fifthTimeAMorPM.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        fifthTimeAMorPM.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:13.0];
                
        [self.view addSubview:subNavBar];
        //[self.view addSubview:timesTable];
        [self.view addSubview:timesTableLeft];
        [self.view addSubview:timesTableRight];
        [self.view addSubview:helpText];
        [self.view addSubview:subNavBarText];
        
        [self.view addSubview:firstTime];
        [self.view addSubview:firstTimeAMorPM];
        [self.view addSubview:secondTime];
        [self.view addSubview:secondTimeAMorPM];
        [self.view addSubview:thirdTime];
        [self.view addSubview:thirdTimeAMorPM];
        [self.view addSubview:fourthTime];
        [self.view addSubview:fourthTimeAMorPM];
        [self.view addSubview:fifthTime];
        [self.view addSubview:fifthTimeAMorPM];
        [self.view bringSubviewToFront:bottomBar];
        [self.view bringSubviewToFront:homeButton];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
