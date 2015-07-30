//
//  ContentOrcaViewController.h
//  MicahApp
//
//  Created by Gabriel Nopper on 27/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentClientViewController : UIViewController
@property NSUInteger pageIndex;
@property (strong, nonatomic) IBOutlet UIView *azulL;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *luzAL;
@property NSString *titleText;

@end
