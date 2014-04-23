//
//  LaboINTDetalleMateriaViewController.m
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 26/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboINTDetalleMateriaViewController.h"
#import "Libro.h"
#import "Materia.h"

@interface LaboINTDetalleMateriaViewController (){
    NSArray *biblio;
}

@end

@implementation LaboINTDetalleMateriaViewController

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
    
    self.tableViewLibro.delegate = self;
    self.tableViewLibro.dataSource= self;
    
    biblio = [[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view.
    Materia *mat = self.objetoMostrar;
    
    self.claveLabel.text = mat.clave;
    self.nombreLabel.text = mat.nombre;
    NSSet *bib = mat.bibliografia;
    biblio = [bib allObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return biblio.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Celda" forIndexPath:indexPath];
    
    Libro *l = biblio[indexPath.row];
    cell.textLabel.text = l.titulo;
    cell.detailTextLabel.text = l.isbn;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
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

@end
