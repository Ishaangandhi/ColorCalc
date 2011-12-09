//
//  FlipSideView.m
//  Calculator
//
//  Created by Ishaan Gandhi on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipSideView.h"


@implementation FlipSideView

- (void)dealloc {
    [background release];
    [backgrounds release];
    [super dealloc];
}

-(CalculatorViewController *) controller {
    if(!controller) {
        controller = [[CalculatorViewController alloc] init];
    }
    return controller;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

-(IBAction) back {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    backgrounds = [[NSMutableArray alloc] init];
    [backgrounds addObject:@"Orange"];
    [backgrounds addObject:@"Blue"];
    [backgrounds addObject:@"Purple"];
    [backgrounds addObject:@"Red"];
    [backgrounds addObject:@"Turquoise"];
    [backgrounds addObject:@"Gray"];    
    [backgrounds addObject:@"Violet"];    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [backgrounds count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [backgrounds objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    curBackground = row;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    background.alpha = 0.5;
    [UIView commitAnimations];
    switch (curBackground) {
        case 0:
            [background setImage:[UIImage imageNamed:@"OrangeGrad.png"]];
            break;
        case 1:
            [background setImage:[UIImage imageNamed:@"BlueGrad.png"]];
            break;
        case 2:
            [background setImage:[UIImage imageNamed:@"PurpleGrad.png"]];
            break;
        case 3:
            [background setImage:[UIImage imageNamed:@"RedGrad.png"]];
            break;
        case 4:
            [background setImage:[UIImage imageNamed:@"TurquoiseGrad.png"]];
            break;
        case 5:
            [background setImage:[UIImage imageNamed:@"GreyGradient.png"]];
            break;
        case 6:
            [background setImage:[UIImage imageNamed:@"VioletGrad.png"]];
            break;
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    background.alpha = 1.0;
    [UIView commitAnimations];
}

-(IBAction)preview {

}

-(IBAction)set {
    
    [[self controller] changeImage:curBackground];
    
    
    //Save the background
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:curBackground forKey:@"backgroundImageIndex"];
    [prefs synchronize];
    
    
    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self dismissModalViewControllerAnimated:YES];
    
}

@end