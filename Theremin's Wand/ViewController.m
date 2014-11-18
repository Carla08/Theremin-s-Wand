//
//  ViewController.m
//  Theremin's Wand
//
//  Created by Apple on 02/11/14.
//  Copyright (c) 2014 Carla & Mario. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.manager = [[CMMotionManager alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(getValues:) userInfo:nil repeats:YES];
    self.manager.accelerometerUpdateInterval = 0.1;  // 40 Hz
    [self.manager startAccelerometerUpdates];
    
}


-(void) getValues:(NSTimer *) timer {
    NSInteger x_note= ABS(self.manager.accelerometerData.acceleration.x*100);
    x_acc.text = [NSString stringWithFormat:@"%.2f",self.manager.accelerometerData.acceleration.x];//NOTAS
    y_acc.text = [NSString stringWithFormat:@"%.2f",self.manager.accelerometerData.acceleration.y];//CONSTANTE
    z_acc.text = [NSString stringWithFormat:@"%.2f",self.manager.accelerometerData.acceleration.z];
    Note.text=[self getNote:x_note];
    if (self.player.playing==false) {
        NSURL *note_path = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                   pathForResource:[self getNote:x_note]
                                                   ofType:@"mp3"]];
        self.player=[[AVAudioPlayer alloc] initWithContentsOfURL:note_path error:nil];
        
    }
    
    if(play_pressed==true){
        [self.player play];
    }
}
-(NSString *) getNote: (NSInteger) x{
    if((x>=0)&&(x<8)){
        return @"C_middle";
    }
    if((x>=8)&&(x<16)){
        return @"C_sharp";
    }
    if((x>=16)&&(x<24)){
        return @"D";
    }
    if((x>=24)&&(x<32)){
        return @"D_sharp";
    }
    if((x>=32)&&(x<40)){
        return @"E";
    }
    if((x>=40)&&(x<48)){
        return @"F";
    }
    if((x>=48)&&(x<56)){
        return @"F_sharp";
    }
    if((x>=56)&&(x<64)){
        return @"G";
    }
    if((x>=64)&&(x<72)){
        return @"G_sharp";
    }
    if((x>=72)&&(x<80)){
        return @"A";
    }
    if((x>=80)&&(x<88)){
        return @"A_sharp";
    }
    if((x>=88)&&(x<96)){
        return @"B";
    }
    if((x>=96)&&(x<104)){
        return @"B";
    }
    return @"";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Theremin_play:(id)sender {
    play_pressed=true;
    
}

- (IBAction)Theremin_stop:(id)sender {
    play_pressed=false;
    
}
@end
