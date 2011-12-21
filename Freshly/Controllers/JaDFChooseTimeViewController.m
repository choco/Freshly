//
//  JaDFChooseTimeViewController.m
//  Freshly
//
//  Created by Enrico Ghirardi on 27/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "JaDFChooseTimeViewController.h"

#define kCornerRadius 15.f
#define kAnimationDuration 0.5f

@implementation JaDFChooseTimeViewController


- (void)viewWillAppear:(BOOL)animated 
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [subNavBar setFrame:CGRectMake(subNavBar.frame.origin.x, subNavBar.frame.origin.y-388, subNavBar.frame.size.width, subNavBar.frame.size.height)];
        [chooseTimeTxt setFrame:CGRectMake(chooseTimeTxt.frame.origin.x, chooseTimeTxt.frame.origin.y-388, chooseTimeTxt.frame.size.width, chooseTimeTxt.frame.size.height)];
        [chooseTimeOverlay setFrame:CGRectMake(chooseTimeOverlay.frame.origin.x, chooseTimeOverlay.frame.origin.y-388, chooseTimeOverlay.frame.size.width, chooseTimeOverlay.frame.size.height)];
        [hourPicker setFrame:CGRectMake(hourPicker.frame.origin.x, hourPicker.frame.origin.y-388, hourPicker.frame.size.width, hourPicker.frame.size.height)];
        [minutesPicker setFrame:CGRectMake(minutesPicker.frame.origin.x, minutesPicker.frame.origin.y-388, minutesPicker.frame.size.width, minutesPicker.frame.size.height)];
        [doneTxt setFrame:CGRectMake(doneTxt.frame.origin.x,doneTxt.frame.origin.y-388, doneTxt.frame.size.width, doneTxt.frame.size.height)];
        [AMandPMHighlighther setFrame:CGRectMake(AMandPMHighlighther.frame.origin.x, AMandPMHighlighther.frame.origin.y-388, AMandPMHighlighther.frame.size.width, AMandPMHighlighther.frame.size.height)];
        [AMandPMSelector setFrame:CGRectMake(AMandPMSelector.frame.origin.x, AMandPMSelector.frame.origin.y-388, AMandPMSelector.frame.size.width, AMandPMSelector.frame.size.height)];
        [AMandPMTxt setFrame:CGRectMake(AMandPMTxt.frame.origin.x, AMandPMTxt.frame.origin.y-388, AMandPMTxt.frame.size.width, AMandPMTxt.frame.size.height)];
        homeBtn.alpha = 1;
    }completion:^(BOOL finished){
        [hourPicker scrollToRowAtIndex:6 animated:YES];
        [minutesPicker scrollToRowAtIndex:6 animated:YES];
    }
     ];
}

- (void)viewWillDisappearAnimationForSelectedView:(int)selected
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [subNavBar setFrame:CGRectMake(subNavBar.frame.origin.x, subNavBar.frame.origin.y+388, subNavBar.frame.size.width, subNavBar.frame.size.height)];
        [chooseTimeTxt setFrame:CGRectMake(chooseTimeTxt.frame.origin.x, chooseTimeTxt.frame.origin.y+388, chooseTimeTxt.frame.size.width, chooseTimeTxt.frame.size.height)];
        [chooseTimeOverlay setFrame:CGRectMake(chooseTimeOverlay.frame.origin.x, chooseTimeOverlay.frame.origin.y+388, chooseTimeOverlay.frame.size.width, chooseTimeOverlay.frame.size.height)];
        [hourPicker setFrame:CGRectMake(hourPicker.frame.origin.x, hourPicker.frame.origin.y+388, hourPicker.frame.size.width, hourPicker.frame.size.height)];
        [minutesPicker setFrame:CGRectMake(minutesPicker.frame.origin.x, minutesPicker.frame.origin.y+388, minutesPicker.frame.size.width, minutesPicker.frame.size.height)];
        [doneTxt setFrame:CGRectMake(doneTxt.frame.origin.x,doneTxt.frame.origin.y+388, doneTxt.frame.size.width, doneTxt.frame.size.height)];
        [AMandPMHighlighther setFrame:CGRectMake(AMandPMHighlighther.frame.origin.x, AMandPMHighlighther.frame.origin.y+388, AMandPMHighlighther.frame.size.width, AMandPMHighlighther.frame.size.height)];
        [AMandPMSelector setFrame:CGRectMake(AMandPMSelector.frame.origin.x, AMandPMSelector.frame.origin.y+388, AMandPMSelector.frame.size.width, AMandPMSelector.frame.size.height)];
        [AMandPMTxt setFrame:CGRectMake(AMandPMTxt.frame.origin.x, AMandPMTxt.frame.origin.y+388, AMandPMTxt.frame.size.width, AMandPMTxt.frame.size.height)];
        if (selected!=1) {
            homeBtn.alpha = 0;
        }
    }
                     completion:^(BOOL finished){
                         if(selected==1)
                         {
                             JaDFDisplayTimesViewController *sleepNowTimesViewController = [[JaDFDisplayTimesViewController alloc] initWithNibName:nil bundle:nil colorAndTextCombination:2];
                             NSString *ap;
                             if (AMorPM==1) {
                                 ap = @"AM";
                             }
                             else
                             {
                                 ap = @"PM";
                             }
                             NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                             [f setNumberStyle:NSNumberFormatterDecimalStyle];
                             [sleepNowTimesViewController setTimes:[JaDFreshlyCore wakeUpTimesGiveHour:[f numberFromString:[hourData objectAtIndex:hourPicker.selectedRowIndex]].intValue
                                                                                               minutes:[f numberFromString:[minutesData objectAtIndex:minutesPicker.selectedRowIndex]].intValue
                                                                                                    ap:ap]];
                             [self.navigationController pushViewController:sleepNowTimesViewController animated:NO];
                         }
                         else{
                             [self.navigationController popToRootViewControllerAnimated:NO];
                         }}
     
     ];
}

- (IBAction)AMandPMbgSelected:(id)sender
{
    AMandPMbg.userInteractionEnabled = FALSE;
    CGRect frame = AMandPMHighlighther.frame;
    if (frame.origin.x == 34.0) {
        [AMandPMHighlighther setFrame:CGRectMake(frame.origin.x+65, frame.origin.y, frame.size.width, frame.size.height)];
        AMorPM = 2;
    }
    else
    {
        [AMandPMHighlighther setFrame:CGRectMake(frame.origin.x-65, frame.origin.y, frame.size.width, frame.size.height)];
        AMorPM = 1;
    }
    AMandPMbg.userInteractionEnabled = TRUE;
    
}

- (IBAction)doneBtnSelected:(id)sender
{
    [self viewWillDisappearAnimationForSelectedView:1];
}

- (IBAction)homeBtnSelected:(id)sender
{
    [self viewWillDisappearAnimationForSelectedView:2];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view.layer setMasksToBounds:TRUE];
        [self.view.layer setCornerRadius:kCornerRadius];
        AMorPM = 1;
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
    
    hourData = [[NSMutableArray alloc] init];
    for (int i=1; i<13; i++) {
        [hourData addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    minutesData = [[NSMutableArray alloc] init];
    [minutesData addObject:@"00"];
    [minutesData addObject:@"05"];
    for (int i=10; i<60; i+=5) {
        [minutesData addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    hourPicker = [[KSAdvancedPicker alloc] initWithFrame:CGRectMake(33, 133, 130, 169) delegate:self tag:1];
    [hourPicker reloadData];
    [self.view addSubview:hourPicker];
    
    minutesPicker = [[KSAdvancedPicker alloc] initWithFrame:CGRectMake(157, 132, 130, 169) delegate:self tag:2];
    [minutesPicker reloadData];
    [self.view addSubview:minutesPicker];
    
    chooseTimeOverlay = [[UIImageView alloc] initWithFrame:CGRectMake(25, 125, 270, 184)];
    [chooseTimeOverlay setImage:[UIImage imageNamed:@"ChooseTimeOverlay"]];
    [self.view addSubview:chooseTimeOverlay];
    
    [subNavBar setFrame:CGRectMake(subNavBar.frame.origin.x, subNavBar.frame.origin.y+388, subNavBar.frame.size.width, subNavBar.frame.size.height)];
    [chooseTimeTxt setFrame:CGRectMake(chooseTimeTxt.frame.origin.x, chooseTimeTxt.frame.origin.y+388, chooseTimeTxt.frame.size.width, chooseTimeTxt.frame.size.height)];
    [chooseTimeOverlay setFrame:CGRectMake(chooseTimeOverlay.frame.origin.x, chooseTimeOverlay.frame.origin.y+388, chooseTimeOverlay.frame.size.width, chooseTimeOverlay.frame.size.height)];
    [hourPicker setFrame:CGRectMake(hourPicker.frame.origin.x, hourPicker.frame.origin.y+388, hourPicker.frame.size.width, hourPicker.frame.size.height)];
    [minutesPicker setFrame:CGRectMake(minutesPicker.frame.origin.x, minutesPicker.frame.origin.y+388, minutesPicker.frame.size.width, minutesPicker.frame.size.height)];
    [doneTxt setFrame:CGRectMake(doneTxt.frame.origin.x,doneTxt.frame.origin.y+388, doneTxt.frame.size.width, doneTxt.frame.size.height)];
    [AMandPMHighlighther setFrame:CGRectMake(AMandPMHighlighther.frame.origin.x, AMandPMHighlighther.frame.origin.y+388, AMandPMHighlighther.frame.size.width, AMandPMHighlighther.frame.size.height)];
    [AMandPMSelector setFrame:CGRectMake(AMandPMSelector.frame.origin.x, AMandPMSelector.frame.origin.y+388, AMandPMSelector.frame.size.width, AMandPMSelector.frame.size.height)];
    [AMandPMTxt setFrame:CGRectMake(AMandPMTxt.frame.origin.x, AMandPMTxt.frame.origin.y+388, AMandPMTxt.frame.size.width, AMandPMTxt.frame.size.height)];
    homeBtn.alpha = 0;
    [self.view bringSubviewToFront:bottomBar];
    [self.view bringSubviewToFront:homeBtn];
    
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

#pragma mark - KSAdvancedPickerDelegate

- (CGFloat) heightForRowInAdvancedPicker:(KSAdvancedPicker *)picker
{
    return 169;
}

- (NSInteger) numberOfRowsInAdvancedPicker:(KSAdvancedPicker *)picker
{
    if (picker.tag == 1) {
        return [hourData count];
    }
    return [minutesData count];
}

- (UITableViewCell *) advancedPicker:(KSAdvancedPicker *)picker tableView:(UITableView *)tableView cellForRowAtIndex:(NSInteger)rowIndex
{
    NSString *identifier = [NSString stringWithFormat:@"Cell %d", rowIndex];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
        //[cell autorelease];
    }
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(-5, 0, 130, 169)];
    UILabel *textLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(-5, 0, 130, 169)];
    textLabel.textColor = [UIColor orangeColor];
    textLabel2.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"txtBG"]];
    if (picker.tag == 1) {
        [textLabel2 setFrame:CGRectMake(textLabel2.frame.origin.x-15, textLabel2.frame.origin.y, textLabel2.frame.size.width, textLabel2.frame.size.height)];
        [textLabel setFrame:CGRectMake(textLabel.frame.origin.x-15, textLabel.frame.origin.y, textLabel.frame.size.width, textLabel.frame.size.height)];
        textLabel2.text = [hourData objectAtIndex:rowIndex];
        textLabel.text = [hourData objectAtIndex:rowIndex];
    }
    else
    {
        textLabel2.text = [minutesData objectAtIndex:rowIndex];
        textLabel.text = [minutesData objectAtIndex:rowIndex];

    }
    textLabel2.textAlignment = UITextAlignmentRight;
    textLabel2.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:85];
    textLabel.textAlignment = UITextAlignmentRight;
    textLabel.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:88];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel2.backgroundColor = [UIColor clearColor];
    [cell addSubview:textLabel2];
    [cell addSubview:textLabel];
    [cell sendSubviewToBack:textLabel];
    return cell;
}

//- (UIView *) backgroundViewForAdvancedPicker:(KSAdvancedPicker *)picker
//{
//    return nil;
//}

- (UIColor *) backgroundColorForAdvancedPicker:(KSAdvancedPicker *)picker
{
    return [UIColor clearColor];
}

- (UIColor *) viewColorForAdvancedPickerSelector:(KSAdvancedPicker *)picker
{
    return [UIColor clearColor];
}


- (UIView *) backgroundViewForAdvancedPicker:(KSAdvancedPicker *)picker
{
    if (picker.tag == 1) {
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ChooseTimeBgSx"]];
        return bg;
    }
    UIImageView *bg = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"ChooseTimeBgSx"] imageRotatedByDegrees:180]];
    return bg;
}

@end
