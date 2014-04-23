//
//  Protocolo.h
//  Parcial3
//
//  Created by Maria Montserrat Lozano on 07/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Protocolo <NSObject>

@required
-(void) insertar: (id) datos;
- (void) removerVista;

@end
