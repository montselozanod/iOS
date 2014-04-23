//
//  ManejoBD.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 31/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Libro.h"
#import "Materia.h"

@interface ManejoBD : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) NSMutableArray *listaLibros;
@property (strong, nonatomic) NSMutableArray *listaMaterias;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//metodos de singleton
//inicializar singleton
-(id) init;
+(ManejoBD *) instancia; //metodo de clase que crea el thread

//metodos para insertar en la BD
- (Materia *) insertarMateria:(id) datosMateria libros:(NSArray *)misLibros;
-(Libro *) insertarLibro:(id) datosLibro;

//metodos para cargar datos de la BD
-(void) cargarMaterias;
-(void) cargarLibros;

//buscar

-(id) buscarLibro: (NSString *)isbn;
-(NSArray*) buscarLibrosMateria: (NSString *)clave;


@end
