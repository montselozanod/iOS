//
//  MasterViewController.m
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "CeldaMascota.h"
#import "AgregarViewController.h"
#import "Mascota.h"
#import "ManejoBD.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    NSMutableArray *mascotas;
    Mascota *hello;
    
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ManejoBD *serv = [ManejoBD instancia];
    [serv cargarMascotas];
    _objects =[[NSMutableArray alloc]init];
    _objects = [NSMutableArray arrayWithArray:[serv listaMascotas]];
    hello = _objects[0];

    
    [self.tableView reloadData];
    //[self cargaMascotasPlist];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CeldaMascota *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSLog(@"%@", _objects);
    
    Mascota *m = _objects[indexPath.row];
    
    cell.nombreLabel.text = m.nombre;
    cell.razaTF.text = m.raza;
    cell.edadTF.text = [NSString stringWithFormat:@"%@", m.edad];
    cell.imageView.image = [UIImage imageNamed:m.foto];
    //cell.imageView.image = [UIImage imageWithContentsOfFile:m.foto];
    //cell.nombreLabel.text = [NSString stringWithFormat:@"%@",[_objects[indexPath.row] objectForKey:@"nombre"]];
	//cell.razaTF.text = [NSString stringWithFormat:@"%@",[_objects[indexPath.row] objectForKey:@"raza"]];
	//cell.edadTF.text = [NSString stringWithFormat:@"%@",[_objects[indexPath.row] objectForKey:@"edad"]];
    //cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //cell.imageView.image = [UIImage imageNamed:[_objects[indexPath.row] objectForKey:@"foto"]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"add"]) {
        [[segue destinationViewController] setDelegado: self];
    } else {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setObjetoMostrar: [_objects objectAtIndex:index.row]];
    }
}

#pragma mark - protocolo

- (void) insertar:(id)datos {
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
   
    Mascota *m = (Mascota *)datos;
    
    [_objects  addObject:m];
    [self.tableView reloadData];
}

- (void) removerVista {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
