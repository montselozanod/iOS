//
//  ManejoBD.h
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vacunas.h"

@interface ManejoBD : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSMutableArray *listaVacunas;
@property (strong, nonatomic) NSMutableArray *listaMascotas;

- (void)saveContext;

- (NSURL *)applicationDocumentsDirectory;

//Metodos para SINGLETON
//Metodos para inicializar el Singleton

- (id) init;
+ (ManejoBD *) instancia;

//Metodos para  insertar en la Bd
- (Mascota *) insertarMascota:(id) datosMascota vacunas:(NSArray *) misVacunas;
- (Vacunas *)insertarVacuna:(id)datosVacuna;

//Metodos para cargar los datos de la BD
- (void) cargarMascotas;
- (void) cargarVacunas;

//Metodos para buscar libros en la BD
- (id) buscarVacunas:(NSString *) nombre;
- (NSArray *) buscarMascotas:(NSString *) nombre;

@end
