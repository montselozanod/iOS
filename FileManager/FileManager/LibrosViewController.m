//
//  LibrosViewController.m
//  FileManager
//
//  Created by Maria Montserrat Lozano on 12/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LibrosViewController.h"

@interface LibrosViewController (){
    
    NSMutableArray *personas;
    
}

@end

@implementation LibrosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    personas = [[NSMutableArray alloc]init]; //inicalizo arreglo
    
    self.tabla.delegate= self;
    self.tabla.dataSource= self;
    
    UITapGestureRecognizer *tap =   [[UITapGestureRecognizer alloc]
                                     initWithTarget:self
                                     action:@selector(quitarTeclado)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)quitarTeclado {
    
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registrarButton:(id)sender {
    
    NSDictionary *diccionario = [[NSDictionary alloc] initWithObjectsAndKeys: self.nombreTF.text,@"nombre", self.emailTF.text, @"email",nil];
    
    [personas addObject:diccionario];
    [self.tabla reloadData];
    
}

- (IBAction)guardarButton:(id)sender {
}

#pragma mark -TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return personas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    
    NSDictionary *diccionario = personas[indexPath.row];
    celda.textLabel.text = [diccionario objectForKey:@"nombre"];
    celda.detailTextLabel.text = [diccionario objectForKey:@"email"];
    
    
    return celda;

}

@end
