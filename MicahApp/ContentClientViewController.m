//
//  ContentOrcaViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 27/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentClientViewController.h"

@interface ContentClientViewController ()

@end

@implementation ContentClientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label.text = self.titleText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
