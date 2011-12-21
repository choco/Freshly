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
        sleepNowBtn.frame = CGRectMake(sleepNowBtn.frame.origin.x, sleepNowBtn.frame.origin.y+180, sleepNowBtn.frame.size.width , sleepNowBtn.frame.size.height);
        chooseTimeBtn.frame = CGRectMake(chooseTimeBtn.frame.origin.x, chooseTimeBtn.frame.origin.y-187, chooseTimeBtn.frame.size.width , chooseTimeBtn.frame.size.height);
        sleepNowTxt.frame = CGRectMake(sleepNowTxt.frame.origin.x, sleepNowTxt.frame.origin.y+180, sleepNowTxt.frame.size.width , sleepNowTxt.frame.size.height);
        sleepNowLogo.frame = CGRectMake(sleepNowLogo.frame.origin.x, sleepNowLogo.frame.origin.y+180, sleepNowLogo.frame.size.width , sleepNowLogo.frame.size.height);
        chooseTimeTxt.frame = CGRectMake(chooseTimeTxt.frame.origin.x, chooseTimeTxt.frame.origin.y-187, chooseTimeTxt.frame.size.width , chooseTimeTxt.frame.size.height);
        chooseTimeLogo.frame = CGRectMake(chooseTimeLogo.frame.origin.x, chooseTimeLogo.frame.origin.y-187, chooseTimeLogo.frame.size.width , chooseTimeLogo.frame.size.height);
        arrow1.frame = CGRectMake(arrow1.frame.origin.x, arrow1.frame.origin.y+180, arrow1.frame.size.width , arrow1.frame.size.height);
        arrow2.frame = CGRectMake(arrow2.frame.origin.x, arrow2.frame.origin.y-187, arrow2.frame.size.width , arrow2.frame.size.height);
        infoBtn.alpha = 1;
        //settingsBtn.alpha = 1;
    }completion:^(BOOL finished){
    }];
}

- (void)viewWillDisappearAnimationWithAction:(int)sel
{
    [UIView animateWithDuration:KAnimationDuration animations:^{
        sleepNowBtn.frame = CGRectMake(sleepNowBtn.frame.origin.x, sleepNowBtn.frame.origin.y-180, sleepNowBtn.frame.size.width , sleepNowBtn.frame.size.height);
        chooseTimeBtn.frame = CGRectMake(chooseTimeBtn.frame.origin.x, chooseTimeBtn.frame.origin.y+187, chooseTimeBtn.frame.size.width , chooseTimeBtn.frame.size.height);
        sleepNowTxt.frame = CGRectMake(sleepNowTxt.frame.origin.x, sleepNowTxt.frame.origin.y-180, sleepNowTxt.frame.size.width , sleepNowTxt.frame.size.height);
        sleepNowLogo.frame = CGRectMake(sleepNowLogo.frame.origin.x, sleepNowLogo.frame.origin.y-180, sleepNowLogo.frame.size.width , sleepNowLogo.frame.size.height);
        chooseTimeTxt.frame = CGRectMake(chooseTimeTxt.frame.origin.x, chooseTimeTxt.frame.origin.y+187, chooseTimeTxt.frame.size.width , chooseTimeTxt.frame.size.height);
        chooseTimeLogo.frame = CGRectMake(chooseTimeLogo.frame.origin.x, chooseTimeLogo.frame.origin.y+187, chooseTimeLogo.frame.size.width , chooseTimeLogo.frame.size.height);
        arrow1.frame = CGRectMake(arrow1.frame.origin.x, arrow1.frame.origin.y-180, arrow1.frame.size.width , arrow1.frame.size.height);
        arrow2.frame = CGRectMake(arrow2.frame.origin.x, arrow2.frame.origin.y+187, arrow2.frame.size.width , arrow2.frame.size.height);
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
    startViewUp.frame = CGRectMake(startViewUp.frame.origin.x, startViewUp.frame.origin.y-180, startViewUp.frame.size.width, startViewUp.frame.size.height);
    startViewDown.frame = CGRectMake(startViewDown.frame.origin.x, startViewDown.frame.origin.y+186, startViewDown.frame.size.width, startViewDown.frame.size.height);
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
    [startViewUp setFrame:CGRectMake(startViewUp.frame.origin.x, startViewUp.frame.origin.y, startViewUp.frame.size.width, startViewUp.frame.size.height)];
    
    
    startViewDown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DefDown"]];
    [startViewDown setFrame:CGRectMake(startViewDown.frame.origin.x, startViewDown.frame.origin.y+222, startViewDown.frame.size.width, startViewDown.frame.size.height)];
    
    
    [self.view addSubview:startViewUp];
    [self.view addSubview:startViewDown];
    sleepNowBtn.frame = CGRectMake(sleepNowBtn.frame.origin.x, sleepNowBtn.frame.origin.y-180, sleepNowBtn.frame.size.width , sleepNowBtn.frame.size.height);
    chooseTimeBtn.frame = CGRectMake(chooseTimeBtn.frame.origin.x, chooseTimeBtn.frame.origin.y+187, chooseTimeBtn.frame.size.width , chooseTimeBtn.frame.size.height);
    sleepNowTxt.frame = CGRectMake(sleepNowTxt.frame.origin.x, sleepNowTxt.frame.origin.y-180, sleepNowTxt.frame.size.width , sleepNowTxt.frame.size.height);
    sleepNowLogo.frame = CGRectMake(sleepNowLogo.frame.origin.x, sleepNowLogo.frame.origin.y-180, sleepNowLogo.frame.size.width , sleepNowLogo.frame.size.height);
    chooseTimeTxt.frame = CGRectMake(chooseTimeTxt.frame.origin.x, chooseTimeTxt.frame.origin.y+187, chooseTimeTxt.frame.size.width , chooseTimeTxt.frame.size.height);
    chooseTimeLogo.frame = CGRectMake(chooseTimeLogo.frame.origin.x, chooseTimeLogo.frame.origin.y+187, chooseTimeLogo.frame.size.width , chooseTimeLogo.frame.size.height);
    arrow1.frame = CGRectMake(arrow1.frame.origin.x, arrow1.frame.origin.y-180, arrow1.frame.size.width , arrow1.frame.size.height);
    arrow2.frame = CGRectMake(arrow2.frame.origin.x, arrow2.frame.origin.y+187, arrow2.frame.size.width , arrow2.frame.size.height);
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
