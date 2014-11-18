//
//  ViewController.h
//  Theremin's Wand
//
//  Created by Apple on 02/11/14.
//  Copyright (c) 2014 Carla & Mario. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>
#import "RecordedVC.h"


@interface ViewController : UIViewController
{
    __weak IBOutlet UILabel *x_acc;
    
    __weak IBOutlet UILabel *y_acc;
    
    __weak IBOutlet UILabel *z_acc;
    
    __weak IBOutlet UILabel *Note;
    BOOL play_pressed;
}
- (IBAction)Theremin_play:(id)sender;
- (IBAction)Theremin_stop:(id)sender;
-(NSString *)getNote: (NSInteger) x_acc;

@property (strong,nonatomic) CMMotionManager *manager;
@property (strong,nonatomic) AVAudioPlayer *player;

@end

