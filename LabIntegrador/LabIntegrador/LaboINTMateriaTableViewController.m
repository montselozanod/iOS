//
//  LaboINTMateriaTableViewController.m
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboINTMateriaTableViewController.h"
#import "LaboINTAddMateriaViewController.h"
#import "LaboINTDetalleMateriaViewController.h"
#import "ManejoBD.h"
#import "Materia.h"

@interface LaboINTMateriaTableViewController ()
{
    NSMutableArray *materias;
}


@end

@implementation LaboINTMateriaTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    ManejoBD *servicios = [ManejoBD instancia];
    materias = [NSMutableArray arrayWithArray:servicios.listaMaterias];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return materias.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MateriaCell" forIndexPath:indexPath];
    
    //NSDictionary *celda = materias[indexPath.row];
    Materia *mat = [materias objectAtIndex:indexPath.row];
    cell.textLabel.Text = mat.clave;
    cell.detailTextLabel.Text = mat.nombre;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"showDetail"]){
        
       NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setObjetoMostrar: [materias objectAtIndex:index.row]];
    
    }else if([[segue identifier] isEqualToString:@"add"]){
    
       [[segue destinationViewController] setDelegado:self];
    
        //falta lo de setObjetomostrar
    }
}

#pragma mark - metodos de protocolo

-(void) insertar:(id)datos{
    if(!materias){
        materias = [[NSMutableArray alloc]init];
    }
    
    [materias insertObject: datos atIndex:0];
    [self.tableView reloadData];
}

-(void)removerVista{
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
