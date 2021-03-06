//
//  LaboINTLibrosTableViewController.m
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboINTLibrosTableViewController.h"
#import "LaboINTAddLibroViewController.h"
#import "LaboINTDetalleLibroViewController.h"
#import "ManejoBD.h"

@interface LaboINTLibrosTableViewController (){

    NSMutableArray *listaLibros;
}

@end

@implementation LaboINTLibrosTableViewController

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
    listaLibros = [NSMutableArray arrayWithArray:servicios.listaLibros];
    
    
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
    return listaLibros.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LibroCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Libro *l = listaLibros[indexPath.row];
    
    cell.textLabel.text = l.titulo;
    cell.detailTextLabel.text = l.isbn;
    
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
    if([[segue identifier] isEqualToString:@"showDetail"]){
        
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setObjetoMostrar: [listaLibros objectAtIndex:index.row]];

    }else if([[segue identifier] isEqualToString:@"add"]){
        
        [[segue destinationViewController] setDelegado: self];
    }
}

#pragma mark - metodos de protocolo

-(void) insertar:(id)datos{
    if(!listaLibros){
        listaLibros = [[NSMutableArray alloc]init];
    }
    
    Libro *lib = (Libro *)datos;
    
    [listaLibros addObject:lib];
    [self.tableView reloadData];
}

-(void)removerVista{

    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
