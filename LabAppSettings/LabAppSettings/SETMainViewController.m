//
//  SETMainViewController.m
//  LabAppSettings
//
//  Created by Maria Montserrat Lozano on 24/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "SETMainViewController.h"

@interface SETMainViewController ()

@end

@implementation SETMainViewController

- (void)refreshFields {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *n = [defaults objectForKey:kFavoriteSinKey];
    NSLog(@"hello %@", n);
    
    self.userLabel.text = [defaults objectForKey:kUsernameKey];
    self.passLabel.text = [defaults objectForKey:kPasswordKey];
    self.protocolLabel.text = [defaults objectForKey:kProtocolKey];
    self.driveLabel.text = [defaults boolForKey:kWarpDriveKey]
    ? @"Engaged" : @"Disabled";
    self.factorLabel.text = [[defaults objectForKey:kWarpFactorKey]
                             stringValue];
    self.teaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    self.candyLabel.text = [defaults objectForKey:kFavoriteCandyKey];
    self.gameLabel.text = [defaults objectForKey:kFavoriteGameKey];
    self.excuseLabel.text = [defaults objectForKey:kFavoriteExcuseKey];
    self.sinLabel.text = [defaults objectForKey:kFavoriteSinKey];
}

- (void)viewDidLoad
{
    [self refreshFields];
    
    [super viewDidLoad];
    
  
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(SETFlipsideViewController *)controller
{
    [self refreshFields];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
