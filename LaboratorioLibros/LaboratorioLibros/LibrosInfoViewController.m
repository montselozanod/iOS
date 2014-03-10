//
//  LibrosInfoViewController.m
//  LaboratorioLibros
//
//  Created by Maria Montserrat Lozano on 09/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LibrosInfoViewController.h"

@interface LibrosInfoViewController ()

@end

@implementation LibrosInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        NSDictionary *diccionarioVolumInfo = [self.detailItem objectForKey: @"volumeInfo"];
        
        
        self.descripText.text = [diccionarioVolumInfo objectForKey:@"description"];
        
        
        self.editorLabel.text = [diccionarioVolumInfo objectForKey:@"publisher"];
        
        NSArray *authors = [diccionarioVolumInfo objectForKey:@"authors"];
        
        NSString *autores = @"";
        
        for (int i = 0; i < authors.count; i++){
            autores = [autores stringByAppendingString:[NSString stringWithFormat:@"%@ , ", authors[i]]];
        }
        
        self.autorText.text = autores;
        
        /*self.isbnDetail.text = [[[diccionarioVolumInfo objectForKey:@"industryIdentifiers"] objectAtIndex:0] objectForKey:@"identifier"];
        self.fechaDetail.text = [diccionarioVolumInfo objectForKey:@"publishedDate"];*/
        

        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
