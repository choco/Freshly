//
//  JaDFInfoViewController.m
//  Freshly
//
//  Created by Enrico Ghirardi on 16/12/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "JaDFInfoViewController.h"

#define kCornerRadius 15.f
#define kAnimationDuration 0.5f

@implementation JaDFInfoViewController

-(void)showPicker
{
	// This sample can run on devices running iPhone OS 2.0 or later  
	// The MFMailComposeViewController class is only available in iPhone OS 3.0 or later. 
	// So, we must verify the existence of the above class and provide a workaround for devices running 
	// earlier versions of the iPhone OS. 
	// We display an email composition interface if MFMailComposeViewController exists and the device can send emails.
	// We launch the Mail application on the device, otherwise.
	
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
		else
		{
			[self launchMailAppOnDevice];
		}
	}
	else
	{
		[self launchMailAppOnDevice];
	}
}


#pragma mark -
#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields. 
-(void)displayComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"Freshly Support"];
	
    
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@"freshly+support@adream.me"]; 
	
	[picker setToRecipients:toRecipients];

	
	[self presentModalViewController:picker animated:YES];
}


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			message = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
			message = @"Result: saved";
			break;
		case MFMailComposeResultSent:
			message = @"Result: sent";
			break;
		case MFMailComposeResultFailed:
			message = @"Result: failed";
			break;
		default:
			message = @"Result: not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Workaround

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
	NSString *recipients = @"mailto:freshly+support@adream.me?subject=Freshly Support";
	NSString *body = @"";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}


- (void)viewWillAppear:(BOOL)animated 
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        followTwitterBtn.alpha = 1;
        contactUsBtn.alpha = 1;
        websiteBtn.alpha = 1;
        mainInfoTxt.alpha = 1;
        heart.alpha = 1;
        rateAppBtn.alpha = 1;
        homeBtn.alpha = 1;
    }completion:^(BOOL finished){
    }
     ];
}

- (void)viewWillDisappearAnimation
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        followTwitterBtn.alpha = 0;
        contactUsBtn.alpha = 0;
        websiteBtn.alpha = 0;
        mainInfoTxt.alpha = 0;
        heart.alpha = 0;
        rateAppBtn.alpha = 0;
        homeBtn.alpha = 0;
    }completion:^(BOOL finished){
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
     ];
}

- (IBAction)homeBtnSelected:(id)sender;
{
    [self viewWillDisappearAnimation];
}

- (IBAction)contactUsBtnSelected:(id)sender
{
    [self showPicker];
}

- (IBAction)followTwitterBtnSelected:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/JustaDreamApps"]];
}

- (IBAction)websiteBtnSelected:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://just.adream.me/"]];
}

- (IBAction)rateAppBtnSelected:(id)sender
{
    [[iRate sharedInstance] openRatingsPageInAppStore];
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
    followTwitterBtn.alpha = 0;
    contactUsBtn.alpha = 0;
    websiteBtn.alpha = 0;
    mainInfoTxt.alpha = 0;
    heart.alpha = 0;
    rateAppBtn.alpha = 0;
    homeBtn.alpha = 0;
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
