//
//  ViewController.h
//  NuancierRVB
//
//  Created by m2sar on 02/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewActuel;
@property (weak, nonatomic) IBOutlet UIButton *viewPrec;
@property (weak, nonatomic) IBOutlet UIButton *viewPenuit;
@property (weak, nonatomic) IBOutlet UILabel *labelRed;
@property (weak, nonatomic) IBOutlet UILabel *labelVert;
@property (weak, nonatomic) IBOutlet UILabel *labelBlue;
@property (weak, nonatomic) IBOutlet UISlider *sliderRed;
@property (weak, nonatomic) IBOutlet UISlider *sliderVert;
@property (weak, nonatomic) IBOutlet UISlider *sliderBlue;
@property (weak, nonatomic) IBOutlet UISwitch *switchWeb;


- (IBAction)PrecAction:(id)sender;
- (IBAction)PenuitAction:(id)sender;
- (IBAction)redAction:(id)sender;
- (IBAction)vertAction:(id)sender;
- (IBAction)blueAction:(id)sender;
- (IBAction)saveAction:(id)sender;
- (IBAction)razAction:(id)sender;
- (IBAction)switchAction:(id)sender;




@end

