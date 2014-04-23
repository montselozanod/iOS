//
//  Mascota.h
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Mascota : NSManagedObject

@property (nonatomic, retain) NSNumber * edad;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * raza;
@property (nonatomic, retain) NSSet *relationship;
@end

@interface Mascota (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(NSManagedObject *)value;
- (void)removeRelationshipObject:(NSManagedObject *)value;
- (void)addRelationship:(NSSet *)values;
- (void)removeRelationship:(NSSet *)values;

@end
