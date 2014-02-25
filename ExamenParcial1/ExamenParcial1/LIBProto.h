//
//  LIBProto.h
//  ExamenParcial1
//
//  Created by Maria Montserrat Lozano on 24/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LIBProto <NSObject>

- (void) agregarLibro: (NSString *) titulo isbn: (long long) isb cantidad: (NSInteger) cant fecha: (NSDate *) fecha;
-(void) removerVista;

@end
