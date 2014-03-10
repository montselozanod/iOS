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
        
         NSDictionary *diccionarioVolumInfo = [self.detailItem objectForKey: @"volumeInfo"];
        
        
       self.tituloDetail.text = [diccionarioVolumInfo objectForKey:@"title"];
        self.isbnDetail.text = [[[diccionarioVolumInfo objectForKey:@"industryIdentifiers"] objectAtIndex:0] objectForKey:@"identifier"];
        self.fechaDetail.text = [diccionarioVolumInfo objectForKey:@"publishedDate"];

        
        NSString *pages =[NSString stringWithFormat:@"%@", [diccionarioVolumInfo objectForKey:@"pageCount"]];
    
        self.cantidadDetail.text = pages;
       
    NSString *stringURL = [[NSString alloc]initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%@", self.isbnDetail.text];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"info"]) {
        
        [[segue destinationViewController] setDetailItem:self.detailItem];
    }
}

@end
