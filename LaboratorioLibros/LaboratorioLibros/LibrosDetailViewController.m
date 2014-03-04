//
//  LibrosDetailViewController.m
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 03/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LibrosDetailViewController.h"

@interface LibrosDetailViewController ()
- (void)configureView;
@end

@implementation LibrosDetailViewController

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
       self.tituloDetail.text = [self.detailItem objectForKey:@"titulo"];
        self.isbnDetail.text = [self.detailItem objectForKey:@"isbn"];
        self.fechaDetail.text = [self.detailItem objectForKey:@"fecha"];

        
        self.cantidadDetail.text = [self.detailItem objectForKey:@"cantidad"];
       
    NSString *stringURL = [[NSString alloc]initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%@", [self.detailItem objectForKey:@"isbn"]];
        NSURL *url = [[NSURL alloc] initWithString: stringURL];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.imagenDetail loadRequest:request];
        
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
