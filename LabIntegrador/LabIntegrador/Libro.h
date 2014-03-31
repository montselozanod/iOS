//
//  Libro.h
//  LabIntegrador
//
//  Created by Maria Montserrat Lozano on 31/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Materia;

@interface Libro : NSManagedObject

@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSString * isbn;
@property (nonatomic, retain) NSSet *materiaRel;
@end

@interface Libro (CoreDataGeneratedAccessors)

- (void)addMateriaRelObject:(Materia *)value;
- (void)removeMateriaRelObject:(Materia *)value;
- (void)addMateriaRel:(NSSet *)values;
- (void)removeMateriaRel:(NSSet *)values;

@end
