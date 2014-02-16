//
//  StoryImageInfoViewController.m
//  Storyboard
//
//  Created by Maria Montserrat Lozano on 12/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "StoryImageInfoViewController.h"

@interface StoryImageInfoViewController ()

@end

@implementation StoryImageInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.anchoLabel.text = [NSString stringWithFormat:@"%0.0f", self.ancho];
    self.alturaLabel.text = [NSString stringWithFormat:@"%0.0f", self.alto];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
