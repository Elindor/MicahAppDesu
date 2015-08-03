//
//  ViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 14/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ViewController.h"
#import "SaveData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [SaveData sharedAppData].currentOrca = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
