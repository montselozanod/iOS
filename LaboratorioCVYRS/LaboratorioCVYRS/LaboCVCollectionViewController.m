//
//  LaboCVCollectionViewController.m
//  LaboratorioCVYRS
//
//  Created by Maria Montserrat Lozano on 09/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LaboCVCollectionViewController.h"
#import "LaboCVCollectionCelda.h"
#import "LaboCVViewController.h"

@interface LaboCVCollectionViewController (){
    NSMutableArray *imagenes;
}

@end

@implementation LaboCVCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)cargarPlist{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"platillos" ofType:@"plist"];
    
    imagenes = [NSMutableArray arrayWithContentsOfFile:path];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imagenes = [[NSMutableArray alloc]init];
    [self cargarPlist];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"detail"]){
        NSIndexPath *index = [self.collectionView indexPathForCell:sender]; //sender es la celda que me estan enviando
        [[segue destinationViewController] setDetalle:[imagenes objectAtIndex:index.row]];
    }
}


#pragma mark - collection

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return imagenes.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LaboCVCollectionCelda *celda = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath: indexPath];
    celda.imagenCelda.image = [UIImage imageNamed:[imagenes objectAtIndex:indexPath.row]];
    return celda;
}


@end
