//
//  ViewController.m
//  NuancierRVB
//
//  Created by m2sar on 02/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

float rouge;
float vert;
float bleu;
float alpha;
UIColor *precColor;
UIColor *penuitColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    rouge=0.5;
    vert=0.5;
    bleu=0.5;
    alpha=1.0;
    [self changeActuelView:rouge :vert :bleu];
    [self changePrecPenuitView:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1] :[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];
    [self changeRGBstepper:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PrecAction:(id)sender {
    [self changeActuelViewUIColor:precColor];
    [self changeRGBstepper:precColor];
}

- (IBAction)PenuitAction:(id)sender {
    [self changeActuelViewUIColor:penuitColor];
    [self changeRGBstepper:penuitColor];
}

- (IBAction)redAction:(id)sender {
    if([_switchWeb isOn]){
        int value = (int)[_sliderRed value];
        value=(value-value%10);
        [_sliderRed setValue:value];
    }
    
    rouge = [_sliderRed value]/100;
    [_labelRed setText:[NSString stringWithFormat:@"R : %d %%", (int)(rouge*100)]];
    [self changeActuelView:rouge :vert :bleu];
}

- (IBAction)vertAction:(id)sender {
    if([_switchWeb isOn]){
        int value = (int)[_sliderVert value];
        value=(value-value%10);
        [_sliderVert setValue:value];
    }
    
    vert=[_sliderVert value]/100;
    [_labelVert setText:[NSString stringWithFormat:@"V : %d %%", (int)(vert*100)]];
    [self changeActuelView:rouge :vert :bleu];
}

- (IBAction)blueAction:(id)sender {
    if([_switchWeb isOn]){
        int value = (int)[_sliderBlue value];
        value=(value-value%10);
        [_sliderBlue setValue:value];
    }
    
    
    bleu=[_sliderBlue value]/100;
    [_labelBlue setText:[NSString stringWithFormat:@"B : %d %%", (int)(bleu*100)]];
    [self changeActuelView:rouge :vert :bleu];
}

- (IBAction)saveAction:(id)sender {
    [self changePrecPenuitView:[_viewActuel backgroundColor] :precColor];
}

- (IBAction)razAction:(id)sender {
    
    rouge=0.5;
    vert=0.5;
    bleu=0.5;
    [self changeActuelView:rouge :vert :bleu];
    [self changePrecPenuitView:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1] :[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];
    [self changeRGBstepper:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];
}

- (IBAction)switchAction:(id)sender {
    if([_switchWeb isOn]){
        [_labelRed setText:[NSString stringWithFormat:@"R : %d %%", [self arrond:(int)(rouge*100)]]];
        [_labelVert setText:[NSString stringWithFormat:@"V : %d %%", [self arrond:(int)(vert*100)]]];
        [_labelBlue setText:[NSString stringWithFormat:@"B : %d %%", [self arrond:(int)(bleu*100)]]];
    }
}

/*
    Autres fonctions
 */

- (void) changeActuelView:(float)red :(float)vert :(float)bleu {
    UIColor *color=[UIColor colorWithRed:red green:vert blue:bleu alpha:1];
    
    [_viewActuel setBackgroundColor:color];
}

- (void) changeActuelViewUIColor:(UIColor*)color {
    [_viewActuel setBackgroundColor:color];
    
}

- (void)changePrecPenuitView:(UIColor*)colorPrec :(UIColor*)colorPenuit{
    
    [_viewPrec setBackgroundColor:colorPrec];
    precColor=colorPrec;
    [_viewPenuit setBackgroundColor:colorPenuit];
    penuitColor=colorPenuit;
}

- (void)changeRGBstepper:(UIColor*)color{
    CGFloat Crouge;
    CGFloat Cvert;
    CGFloat Cbleu;
    CGFloat Calpha;
    [color getRed:&Crouge green:&Cvert blue:&Cbleu alpha:&Calpha];
    rouge=(float)Crouge;
    vert=(float)Cvert;
    bleu=(float)Cbleu;
    [_sliderRed setValue:rouge*100];
    [_labelRed setText:[NSString stringWithFormat:@"R : %d %%", (int)(rouge*100)]];
    [_sliderVert setValue:vert*100];
    [_labelVert setText:[NSString stringWithFormat:@"V : %d %%", (int)(vert*100)]];
    [_sliderBlue setValue:bleu*100];
    [_labelBlue setText:[NSString stringWithFormat:@"B : %d %%", (int)(bleu*100)]];
}

-(int) arrond:(int)val {
    int aux = val;
    if((aux%10)<5){
        aux-=(aux%10);
    }else{
        aux=(((aux/10)+1)*10);
    }
    return aux;
}

@end
