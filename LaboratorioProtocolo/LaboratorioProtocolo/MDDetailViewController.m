//
//  MDDetailViewController.m
//  LaboratorioProtocolo
//
//  Created by Maria Montserrat Lozano on 17/02/14.
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
        self.nombreLabel.text = ((Perfil *)self.detailItem).nombre;
        self.emailLabel.text = ((Perfil *)self.detailItem).email;
        NSString *tel = [[NSString  alloc] initWithFormat:@"%d", ((Perfil *)self.detailItem).telefono];
        //se debe covertir primero el tel a string
        self.telLabel.text = tel;
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
