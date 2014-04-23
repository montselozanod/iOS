//
//  ViewController.h
//  LaboratorioMultimedia
//
//  Created by Maria Montserrat Lozano on 23/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)selectButton:(id)sender;
- (IBAction)takeButton:(id)sender;
- (IBAction)playVideo:(id)sender;
- (IBAction)playAudio:(id)sender;

@end
