//
//  LIBLibro.h
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LIBLibro : NSObject

@property NSString *titulo;
@property long long isbn;
@property NSInteger cantidad;
@property NSDate *date;

- (id) initWithName: (NSString *) titulo num: (long long) isb cant: (NSInteger) cant fecha: (NSDate *)fecha;

@end
