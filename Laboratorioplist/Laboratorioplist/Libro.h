//
//  Libro.h
//  Laboratorioplist
//
//  Created by Maria Montserrat Lozano on 26/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Libro : NSObject

@property (strong, nonatomic) NSString *titulo;
@property long long isbn;
@property NSInteger cantidad;
@property (strong, nonatomic) NSString *urlImage;

-(id) initWithTitle:(NSString *)titulo isbn: (long long) isbn cantidad: (NSInteger) cantidad urlImage: (NSString *) urlImage;

@end
