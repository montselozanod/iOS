//
//  ManejoBD.h
//  Examen3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Mascota.h"
#import "Vacuna.h"

@interface ManejoBD : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) NSMutableArray *listaVacunas;
@property (strong, nonatomic) NSMutableArray *listaMascotas;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//metodos de singleton
//inicializar singleton
-(id) init;
+(ManejoBD *) instancia; //metodo de clase que crea el thread

//metodos para insertar en la BD
- (void) insertarMascota:(id) datosMascota vacunas:(NSArray *)vacunasMascotas;
-(void) insertarVacuna:(id) datosLibro;

//metodos para cargar datos de la BD
-(void) cargarMascotas;
-(void) cargarVacunas;

//buscar

-(id) buscarVacuna: (NSString *)isbn;
-(NSArray*) buscarMascotaVacuna: (NSString *)clave;

@end
