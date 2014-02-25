//
//  LIBDetailViewController.m
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LIBDetailViewController.h"
#import "LIBLibro.h"

@interface LIBDetailViewController ()
- (void)configureView;
@end

@implementation LIBDetailViewController

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
        self.tituloLabel.text = ((LIBLibro *)self.detailItem).titulo;
        NSString *isb = [[NSString  alloc] initWithFormat:@"%lli", ((LIBLibro *)self.detailItem).isbn];
        self.isbnLabel.text = isb;
        NSString *cant = [[NSString  alloc] initWithFormat:@"%d", ((LIBLibro*)self.detailItem).cantidad];
       
        self.cantLabel.text = cant;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter  setDateFormat:@"EEEE MM/dd/yyyy"];
        NSString *strDate = [formatter stringFromDate:((LIBLibro *)self.detailItem).date];
        NSLog(@"%@", strDate);
        self.fechaLabel.text = strDate;
        
        
        NSString *strURL = [[NSString alloc] initWithFormat:@"http://content-3.powells.com/cgi-bin/imageDB.cgi?isbn=%@", isb];
        NSURL *imageURL = [NSURL URLWithString:strURL];
        NSURLRequest *imageRequest = [NSURLRequest requestWithURL:imageURL];
        
        [self.imagenWebView loadRequest:imageRequest];
        
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
