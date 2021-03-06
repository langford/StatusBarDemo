//
//  SBDViewController.m
//  StatusBarDemo
//
//  Created by Michael Langford on 4/14/13.
//
//

#import "SBDViewController.h"

@interface SBDViewController ()
@property (weak, nonatomic) IBOutlet UILabel *boldClock;
@property (weak, nonatomic) IBOutlet UILabel *instructions;
@property (weak, nonatomic) IBOutlet UIView *bearGroup;
@property (weak, nonatomic) IBOutlet UIImageView *characterImage;
@property (assign, nonatomic) BOOL isAngry;
@end

@implementation SBDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _boldClock.font = [UIFont boldSystemFontOfSize:14];
    _boldClock.textColor = [UIColor colorWithRed:191.0/256.0 green:191.0/256.0 blue:191.0/256.0 alpha:1.0]; //match clock UI Grey
}
- (IBAction)pokeNose:(id)sender {
    if(_isAngry) return;
    
    _isAngry = YES; //Don't reanimate poking of the nose if still angry. Angry bears don't do tricks.
    
    //Note the position in the Xib of the black view at -20pts
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    _boldClock.text = @"BEAR ANGRY!!! RUN!";
    _instructions.text = @"Fix tie to sooth me";
    
    _boldClock.frame = CGRectMake(0,20,320,20);
    _bearGroup.userInteractionEnabled = NO; //don't let them fix the tie too fast.
    _characterImage.image = [UIImage imageNamed:@"angryBear"];
    _boldClock.alpha = 1.0;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = _boldClock.frame;
        frame.origin.y = 0;
        _boldClock.frame = frame;
    } completion:^(BOOL finished){
        _bearGroup.userInteractionEnabled = YES;
    }];
    
}

- (IBAction)fixTie:(id)sender{
    _isAngry = NO;
    _bearGroup.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _boldClock.alpha = 0.0;
    } completion:^(BOOL finished){
        _bearGroup.userInteractionEnabled = YES;
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }];
    
    _characterImage.image = [UIImage imageNamed:@"bear"];
    _instructions.text = @"Don't Poke My Nose";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
