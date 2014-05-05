//
//  ViewController.m
//  LaboratorioMultimedia
//
//  Created by Maria Montserrat Lozano on 23/04/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>



@interface ViewController (){
    
    MPMoviePlayerViewController *moviePlayer;
    AVAudioPlayer *audioPlayer;
    

}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"No se tiene acceso a camara." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectButton:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *imagen = [info objectForKey:UIImagePickerControllerEditedImage]; //imagen editada
    
    if(imagen ==nil){
        
        imagen = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    self.imageView.image= imagen;
    
    if([picker sourceType] == UIImagePickerControllerSourceTypeCamera){
        UIImageWriteToSavedPhotosAlbum(imagen, self, @selector(image:finishedWithError:contextInfo:), nil);
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

-(void) image: (UIImage *) image finishedWithError: (NSError *) error contextInfo: (void *)contextInfo{
    if(error){
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"Error al guardar" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:YES completion: NULL];
    
}
- (IBAction)takeButton:(id)sender {
    
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"No se tiene acceso a camara." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
    
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
    }
   
}

- (IBAction)playVideo:(id)sender {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"creme" ofType:@"mov"];
    moviePlayer = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL fileURLWithPath:path]];
    [self presentMoviePlayerViewControllerAnimated:moviePlayer]; //presentar el controller que acabamos de crear
}

- (IBAction)playAudio:(id)sender {
    
    
    NSError *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"alarm_rooster" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error: &error];
    [audioPlayer play];
    
}
@end
