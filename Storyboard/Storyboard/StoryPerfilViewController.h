//
//  StoryPerfilViewController.h
//  Storyboard
//
//  Created by Maria Montserrat Lozano on 12/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryImageInfoViewController.h"
#import "StoryPersonalDataViewController.h"


@interface StoryPerfilViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imagen;
@property (strong, nonatomic) IBOutlet UILabel *nombreLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

//propiedades adicionales a los outlets para pasar datos son diferentes a las de outlet (no con interfaz)
@property(strong, nonatomic) NSString *nombre;
@property(strong, nonatomic) NSString *email;


@end
