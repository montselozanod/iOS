//
//  DetailViewController.m
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "DetailViewController.h"
#import "Mascota.h"
#import "Vacunas.h"

@interface DetailViewController (){
    NSArray *vacunas;
}
- (void)configureView;
@end

@implementation DetailViewController

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


}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableViewVacunas.delegate = self;
	self.tableViewVacunas.dataSource = self;
    
    NSLog(@"llegue con %@",self.objetoMostrar);
    
    Mascota *m = self.objetoMostrar;
    NSSet *s = m.relationship;
    vacunas = [s allObjects];
    
    
    self.nombreTF.text = m.nombre;
    self.razaTf.text = m.raza;
    self.edadTF.text = [NSString stringWithFormat:@"%@", m.edad];
    self.imageView.image = [UIImage imageNamed:m.foto];
    
    
    
    NSLog(@"%@", vacunas);

    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/* 
 
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 
 self.tablaVacunas.delegate = self;
 self.tablaVacunas.dataSource = self;
 
 //NSLog(@"llegue con %@",self.objetoMostrar);
 
 self.nombre.text = [(NSDictionary *)self.objetoMostrar objectForKey:@"nombre"];
 self.raza.text = [(NSDictionary *)self.objetoMostrar objectForKey:@"raza"];
 self.edad.text = [[(NSDictionary *)self.objetoMostrar objectForKey:@"edad"] stringValue];
 self.imagen.image = [UIImage imageNamed:[(NSDictionary *)self.objetoMostrar objectForKey:@"foto"]];
 
 listaVacunas = [[NSMutableArray alloc] init];
 
 
 
 for(int i=0; i<((NSArray *)[(NSDictionary *)self.objetoMostrar objectForKey:@"vacunas"]).count;i++){
 [listaVacunas addObject:((NSArray *)[(NSDictionary *)self.objetoMostrar objectForKey:@"vacunas"])[i]];
 }
 
 //NSLog(@"%@",listaVacunas);
 
 }
 
 */

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return vacunas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Vacunas *v = vacunas[indexPath.row];
    
    cell.textLabel.text = v.nombre;
    
    
    NSDate *fecha = v.fecha;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"MM-dd-yyyy"];
    NSString *dia = [format stringFromDate:fecha];
    
    cell.detailTextLabel.text = dia;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//descending
- (IBAction)ordenarFecha:(id)sender {

    NSSortDescriptor *dateSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"fecha" ascending:NO];
    NSArray *arr = [[NSArray alloc]initWithArray:vacunas];
    arr = [arr sortedArrayUsingDescriptors:@[dateSortDescriptor]];
    vacunas = (NSMutableArray*)arr;
    [self.tableViewVacunas reloadData];
}

//ascending
- (IBAction)ordenarVacuna:(id)sender {
    
    NSSortDescriptor *dateSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"nombre" ascending:YES];
    NSArray *arr = [[NSArray alloc]initWithArray:vacunas];
    arr = [arr sortedArrayUsingDescriptors:@[dateSortDescriptor]];
    vacunas = (NSMutableArray*)arr;
    [self.tableViewVacunas reloadData];
}
@end
