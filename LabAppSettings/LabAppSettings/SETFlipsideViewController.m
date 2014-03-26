//
//  SETFlipsideViewController.m
//  LabAppSettings
//
//  Created by Maria Montserrat Lozano on 24/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "SETFlipsideViewController.h"
#import "SETMainViewController.h"

@interface SETFlipsideViewController ()

@end

@implementation SETFlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self refreshFields];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.warpSwitch.on = [defaults boolForKey:kWarpDriveKey];
    self.factorSlider.value = [defaults floatForKey:kWarpFactorKey];
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)warpSwitchTouched:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.warpSwitch.on forKey:kWarpDriveKey];
}

- (IBAction)warpSliderTouched:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.factorSlider.value forKey:kWarpFactorKey];
}
@end
