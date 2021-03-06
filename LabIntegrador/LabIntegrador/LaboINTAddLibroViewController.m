//
//  LaboINTAddLibroViewController.m
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboINTAddLibroViewController.h"
#import "ManejoBD.h"

@interface LaboINTAddLibroViewController ()

@end

@implementation LaboINTAddLibroViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)saveButton:(id)sender {
    
    
    ManejoBD *serv = [ManejoBD instancia];
    
    NSDictionary *libro = @{@"isbn" : self.isbnTF.text, @"titulo" : self.tituloTF.text};
    
    Libro *lib = [serv insertarLibro:libro];
    
    [self.delegado insertar: lib];
    [self.delegado removerVista];
    
    
}
@end
