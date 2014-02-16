//
//  MDDetailViewController.m
//  LaboratorioMasterDetail
//
//  Created by Maria Montserrat Lozano on 15/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "MDDetailViewController.h"

@interface MDDetailViewController ()
- (void)configureView;
@end

@implementation MDDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.nombreLabel.text = [self.detailItem objectForKey:@"nombre"];
        self.emailLabel.text = [self.detailItem objectForKey:@"email"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
