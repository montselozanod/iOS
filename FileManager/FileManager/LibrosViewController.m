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
    
    
    if([self.emailTF.text isEqualToString:@""] || [self.nombreTF.text isEqualToString:@""]){
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Debes escribir datos en los dos campos." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    
    
    }else{
        
        NSDictionary *diccionario = [[NSDictionary alloc] initWithObjectsAndKeys: self.nombreTF.text,@"nombre", self.emailTF.text, @"email",nil];
    
        [personas addObject:diccionario];
        [self.tabla reloadData];
        self.nombreTF.text = @"";
        self.emailTF.text = @"";
        
    }
    
}

- (NSString *) dataFilePath{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *filePath;
    
    if([paths count] > 0){
        NSString *dir = [paths objectAtIndex:0];
        filePath = [dir stringByAppendingString:@"data.plist"];
        NSLog(@"%@", filePath);
    }else{
    
        NSLog(@"No se pudo");
        filePath= @"";
    }
    
    return filePath;
    
}

- (IBAction)guardarButton:(id)sender {
    
    NSString *filepath = [self dataFilePath];
    BOOL success = [personas writeToFile:filepath atomically:YES];
    
    if(success){
        NSLog(@"Archivo fue guardado en %@", filepath);
    }else{
        NSLog(@"No se guardo en %@", filepath);
    }
}

- (void) cargaDatos{

    NSString *filepath = [self dataFilePath];
    
    //si existe archivo los carga al arreglo
    
    if([[NSFileManager defaultManager]fileExistsAtPath:filepath]){
        personas = [[NSMutableArray alloc]initWithContentsOfFile:filepath];
        
        if([personas count] > 0){
            NSLog(@"Se leyo bien el archivo %@", personas);
        }else{
            NSLog(@"fallo archivo lectura");
        }
    }
    
    [self.tabla reloadData];
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
