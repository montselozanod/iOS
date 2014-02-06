//
//  ViewController.m
//  Flores
//
//  Created by Maria Montserrat Lozano on 29/01/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.webViewInfo.hidden = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)switchDetails:(id)sender {
    
    self.webViewInfo.hidden =! [sender isOn];
}

- (IBAction)buttonPicture:(id)sender {
    
    NSString *color = [self.segmentColor titleForSegmentAtIndex:self.segmentColor.selectedSegmentIndex];
    
    //[variable metododeinstancia:parametro]
    
    //alloc es metodo de clase
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/showrandomios.php?color=%@&session=%d", color, 10];
    
    //convertir a url el string...para poder hacer request
    NSURL *imageURL = [NSURL URLWithString:strURL];
    
    //se hace el request
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:imageURL];
    
    [self.webViewPicture loadRequest:imageRequest];
    
    NSString *strDetails = [[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/detailios.php?session=%d", 10];
    
    NSURL *detailsURL = [NSURL URLWithString:strDetails];
    NSURLRequest *detailsRequest = [NSURLRequest requestWithURL:detailsURL];
    
    [self.webViewInfo loadRequest:detailsRequest];
    
}
@end
