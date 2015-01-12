//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Uzair Ali on 1/11/15.
//  Copyright (c) 2015 Uzair Ali. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
- (IBAction)defaultTipValueChange:(id)sender;
- (void)loadDefaultValue;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)defaultTipValueChange:(id)sender {
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    NSInteger defaultTipValueIndex = self.defaultTipControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTipValueIndex forKey:@"defaultTipValueIndex"];
    
    [defaults synchronize];
}

- (void)loadDefaultValue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTipValueIndex = [[defaults objectForKey:@"defaultTipValueIndex"] intValue];
    
    self.defaultTipControl.selectedSegmentIndex = (int) defaultTipValueIndex;
}

@end
