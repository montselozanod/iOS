//
//  ParcialTableViewController.m
//  Examen3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ParcialTableViewController.h"
#import "Mascota.h"

@interface ParcialTableViewController (){

    NSMutableArray *mascotas;
}

@end

@implementation ParcialTableViewController

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
    
    [self cargaMascotaPlist];
 
}

-(void) insertNewObject:(id)sender{

    if(!mascotas){
        mascotas = [[NSMutableArray alloc]init];
    }
    
    [mascotas insertObject:sender atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void) cargaMascotaPlist{
    
    //te dice path de acceso al archivo de la aplicación
    NSBundle *miBundle = [NSBundle mainBundle];
    //ahora tienes que decir que te traiga archivo plist
    
    NSString *path = [miBundle pathForResource:@"Mascotas" ofType:@"plist" ];
    
    //arreglo de diccionarios
    NSMutableArray *misLibros = [NSMutableArray arrayWithContentsOfFile:path];
    
    for(int i = 0; i < misLibros.count; i++){
        
        [self insertNewObject:[mascotas objectAtIndex:i]];
    }


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
    return mascotas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mascotaCell" forIndexPath:indexPath];
    
    NSDictionary *mascota = mascotas[indexPath.row];
    
    Mascota *mas = [[Mascota alloc]initWithTitle:[mascota objectForKey: @"nombre"] edad:[[mascota objectForKey: @"edad"]integerValue] raza:[mascota objectForKey: @"raza"] foto:[mascota objectForKey: @"foto"]];
    
    //hacer uso de cell custom
    // Configure the cell...
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


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
    
    if([[segue identifier] isEqualToString:@"add"]){
        
        
    }else if([[segue identifier] isEqualToString:@"show"]){
        
        
    }
}


@end
