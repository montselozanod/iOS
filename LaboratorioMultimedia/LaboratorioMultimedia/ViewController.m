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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectButton:(id)sender {
}
- (IBAction)takeButton:(id)sender {
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
