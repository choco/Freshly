//
//  MainViewController.m
//  Freshly
//
//  Created by Enrico Ghirardi on 23/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "JaDFMainViewController.h"

#define kCornerRadius 15.f
#define KAnimationDuration 0.5f

@implementation JaDFMainViewController

@synthesize sleepNowBtn, chooseTimeBtn;

- (void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:KAnimationDuration animations:^{
        [sleepNowBtn setFrameOriginY:sleepNowBtn.frame.origin.y+180];
        [sleepNowTxt setFrameOriginY:sleepNowTxt.frame.origin.y+180];
        [sleepNowLogo setFrameOriginY:sleepNowLogo.frame.origin.y+180];
        [arrow1 setFrameOriginY:arrow1.frame.origin.y+180];
        [chooseTimeBtn setFrameOriginY:chooseTimeBtn.frame.origin.y-187];
        [chooseTimeTxt setFrameOriginY:chooseTimeTxt.frame.origin.y-187];
        [chooseTimeLogo setFrameOriginY:chooseTimeLogo.frame.origin.y-187];
        [arrow2 setFrameOriginY:arrow2.frame.origin.y-187];
        infoBtn.alpha = 1;
        //settingsBtn.alpha = 1;
    }completion:^(BOOL finished){
    }];
}

- (void)viewWillDisappearAnimationWithAction:(int)sel
{
    [UIView animateWithDuration:KAnimationDuration animations:^{
        [sleepNowBtn setFrameOriginY:sleepNowBtn.frame.origin.y-180];
        [sleepNowTxt setFrameOriginY:sleepNowTxt.frame.origin.y-180];
        [sleepNowLogo setFrameOriginY:sleepNowLogo.frame.origin.y-180];
        [arrow1 setFrameOriginY:arrow1.frame.origin.y-180];
        [chooseTimeBtn setFrameOriginY:chooseTimeBtn.frame.origin.y+187];
        [chooseTimeTxt setFrameOriginY:chooseTimeTxt.frame.origin.y+187];
        [chooseTimeLogo setFrameOriginY:chooseTimeLogo.frame.origin.y+187];
        [arrow2 setFrameOriginY:arrow2.frame.origin.y+187];
        infoBtn.alpha = 0;
        settingsBtn.alpha = 0;
    }completion:^(BOOL finished){
        if (sel == 1) {
            JaDFDisplayTimesViewController *sleepNowTimesViewController = [[JaDFDisplayTimesViewController alloc] initWithNibName:nil bundle:nil colorAndTextCombination:1];
            [sleepNowTimesViewController setTimes:[JaDFreshlyCore sleepTimesGivenDate:[NSDate date]]];
            [self.navigationController pushViewController:sleepNowTimesViewController animated:NO];
        }
        else if (sel == 2)
        {
            JaDFChooseTimeViewController *chooseTimeViewController = [[JaDFChooseTimeViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:chooseTimeViewController animated:NO];
        }
        else{
            JaDFInfoViewController *infoViewController = [[JaDFInfoViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:infoViewController animated:NO];
        }
    }];
}

- (void)startupAnimationDoneNext
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:KAnimationDuration];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
    [UIView setAnimationDelegate:self]; 
    startViewUp.alpha = 0;
    startViewDown.alpha = 0;
    [UIView commitAnimations];
}

- (void)startupAnimationDone
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:KAnimationDuration];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
    [UIView setAnimationDelegate:self]; 
    [UIView setAnimationDidStopSelector:@selector(startupAnimationDoneNext)];
    [startViewUp setFrameOriginY:startViewUp.frame.origin.y-180];
    [startViewDown setFrameOriginY:startViewDown.frame.origin.y+186];
    [UIView commitAnimations];
}

- (IBAction)settingsBtnSelected:(id)sender
{
    
}

- (IBAction)infoBtnSelected:(id)sender
{
    [self viewWillDisappearAnimationWithAction:3];
}

- (IBAction)sleepNowSelected:(id)sender
{
    [self viewWillDisappearAnimationWithAction:1];

}

- (IBAction)chooseTimeSelected:(id)sender
{
    [self viewWillDisappearAnimationWithAction:2];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view.layer setMasksToBounds:TRUE];
        [self.view.layer setCornerRadius:kCornerRadius];
        
        // Custom initialization
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
    
    startViewUp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DefUp"]];
    startViewDown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DefDown"]];
    [startViewDown setFrameOriginY:startViewDown.frame.origin.y+222];
    
    [self.view addSubview:startViewUp];
    [self.view addSubview:startViewDown];
    
    [sleepNowBtn setFrameOriginY:sleepNowBtn.frame.origin.y-180];
    [sleepNowTxt setFrameOriginY:sleepNowTxt.frame.origin.y-180];
    [sleepNowLogo setFrameOriginY:sleepNowLogo.frame.origin.y-180];
    [arrow1 setFrameOriginY:arrow1.frame.origin.y-180];
    [chooseTimeBtn setFrameOriginY:chooseTimeBtn.frame.origin.y+187];
    [chooseTimeTxt setFrameOriginY:chooseTimeTxt.frame.origin.y+187];
    [chooseTimeLogo setFrameOriginY:chooseTimeLogo.frame.origin.y+187];
    [arrow2 setFrameOriginY:arrow2.frame.origin.y+187];
    settingsBtn.alpha = 0;
    settingsBtn.userInteractionEnabled = NO;
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
