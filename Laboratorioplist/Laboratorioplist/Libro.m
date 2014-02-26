//
//  Libro.m
//  Laboratorioplist
//
//  Created by Maria Montserrat Lozano on 26/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "Libro.h"

@implementation Libro

-(id) initWithTitle:(NSString *)titulo isbn: (long long) isbn cantidad: (NSInteger) cantidad urlImage: (NSString *) urlImage{
    
    self = [super init];
    
    if(self){
    
    _titulo = titulo;
    _isbn = isbn;
    _cantidad = cantidad;
    _urlImage = urlImage;
    
    }

    return self;
}

@end
