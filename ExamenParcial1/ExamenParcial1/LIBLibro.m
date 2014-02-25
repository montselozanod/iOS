//
//  LIBLibro.m
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "LIBLibro.h"

@implementation LIBLibro

- (id) initWithName: (NSString *) titu num: (long long) isb cant: (NSInteger) cant fecha: (NSDate *)fecha{

    _titulo = titu;
    _isbn = isb;
    _cantidad = cant;
    _date = fecha;
    
    return self;

}

@end
