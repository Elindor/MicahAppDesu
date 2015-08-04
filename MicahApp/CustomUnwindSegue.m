//
//  CustomUnwindSegue.m
//  Orca
//
//  Created by Thiago Borges Gonçalves Penna on 7/29/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "CustomUnwindSegue.h"
#import "MenuViewController.h"
#import "UIButton+Property.h"

@implementation CustomUnwindSegue

-(void) perform {
    UIView *sourceView = [self.sourceViewController view];
    MenuViewController *destinationViewController = (MenuViewController *)self.destinationViewController;
    UIView *destinationView = [destinationViewController view];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height + 20;
    destinationView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    
    UIImageView *imageView;
    if (destinationViewController.touchedButton == destinationViewController.btnNovo || destinationViewController.touchedButton == destinationViewController.btnEmProgresso) {
        imageView = destinationViewController.btnOrcamento.customImageView;
        [destinationViewController.btnOrcamento addSubview: imageView];
        imageView.frame = CGRectOffset(imageView.frame, destinationViewController.btnOrcamento.frame.origin.x, destinationViewController.btnOrcamento.frame.origin.y + destinationViewController.cnstOrcamentoTop.constant - destinationViewController.newCnstOrcamentoTop);
    } else {
        imageView = destinationViewController.touchedButton.customImageView;
        [destinationViewController.touchedButton addSubview: imageView];
        imageView.frame = CGRectOffset(imageView.frame, destinationViewController.touchedButton.frame.origin.x, destinationViewController.touchedButton.frame.origin.y + destinationViewController.cnstOrcamentoTop.constant - destinationViewController.newCnstOrcamentoTop);
    }
    
    UIButton *oldTouchedButton;
    
    if (destinationViewController.touchedButton == destinationViewController.btnNovo || destinationViewController.touchedButton == destinationViewController.btnEmProgresso) {
        oldTouchedButton = destinationViewController.touchedButton;
        destinationViewController.cnstOrcamentoHeight.constant = screenHeight;
        destinationViewController.cnstNovoEmProgressoHeight.constant = 0;
        [destinationView layoutIfNeeded];
        //destinationViewController.btnOrcamento.frame = destinationViewController.touchedButton.frame;
        destinationViewController.btnOrcamento.titleLabel.font = destinationViewController.touchedButton.titleLabel.font;
        destinationViewController.touchedButton = destinationViewController.btnOrcamento;
    }
    
    [destinationView layoutIfNeeded];
    
    NSLog(@"%@",destinationViewController);
    
    UIImage *image = imageView.image;
    CGFloat imageNewWidth = 112;
    CGFloat imageNewHeight = image.size.height * (imageNewWidth / image.size.width);
    CGRect imageNewFrame = CGRectMake(destinationView.center.x - imageNewWidth/2, destinationView.center.y- imageNewHeight/2 - 60, imageNewWidth, imageNewHeight);
    
    [imageView setFrame:imageNewFrame];
    
    [destinationView layoutIfNeeded];
    
    //destinationView.frame = CGRectMake(0, -screenHeight, screenWidth, screenHeight);
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:destinationView aboveSubview:sourceView];
    [window sendSubviewToBack:sourceView];
    
    [destinationViewController.touchedButton setTitleEdgeInsets:UIEdgeInsetsMake(90, 0, 0, 0)];
    destinationViewController.touchedButton.titleLabel.alpha = 1;
    destinationViewController.touchedButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [destinationView layoutIfNeeded];
    
    [UIView animateWithDuration:1.2
                          delay:0.1
         usingSpringWithDamping:1
          initialSpringVelocity:2
                        options:0
                     animations:^{
                         destinationViewController.cnstOrcamentoTop.constant = -20;
                         
                         [destinationView layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.2
                                               delay:0.1
                              usingSpringWithDamping:1
                               initialSpringVelocity:2
                                             options:0
                                          animations:^{
                                              
                                              destinationViewController.cnstOrcamentoTop.constant = 44;
                                              [destinationView layoutIfNeeded];
                                              destinationViewController.cnstNovoEmProgresso.constant = 0;
                                              if (oldTouchedButton == destinationViewController.btnNovo || oldTouchedButton == destinationViewController.btnEmProgresso) {
                                                  
                                                  destinationViewController.btnNovo.titleLabel.text = @"NOVO";
                                                  [destinationViewController.btnNovo setTitle:@"NOVO" forState:UIControlStateNormal];
                                                  [destinationViewController.btnNovo setTitle:@"NOVO" forState:UIControlStateSelected];
                                                  [destinationViewController.btnNovo setTitle:@"NOVO" forState:UIControlStateHighlighted];
                                                  
                                                  destinationViewController.btnEmProgresso.titleLabel.text = @"EM PROGRESSO";
                                                  [destinationViewController.btnEmProgresso setTitle:@"EM PROGRESSO" forState:UIControlStateNormal];
                                                  [destinationViewController.btnEmProgresso setTitle:@"EM PROGRESSO" forState:UIControlStateSelected];
                                                  [destinationViewController.btnEmProgresso setTitle:@"EM PROGRESSO" forState:UIControlStateHighlighted];
//                                                  
                                                  [destinationView layoutIfNeeded];
                                                  destinationViewController.btnNovo.backgroundColor = [UIColor colorWithRed:255/255.0f green:88/255.0f blue:90/255.0f alpha:255/255.0f];
                                                  destinationViewController.btnEmProgresso.backgroundColor = [UIColor colorWithRed:255/255.0f green:121/255.0f blue:123/255.0f alpha:255/255.0f];
                                                  
                                                  [oldTouchedButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
                                                  oldTouchedButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                                                  
                                                  oldTouchedButton.titleLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:15];
                                              }
                                                  [destinationViewController.touchedButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 137, 0, 0)];
                                                  destinationViewController.touchedButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                                              
                                              destinationViewController.touchedButton.titleLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:15];
                                              //destinationViewController.cnstOrcamentoTop.constant = 44;
                                              [destinationView layoutIfNeeded];
                                              
                                              NSLog(@"%@",destinationViewController);
                                              destinationViewController.cnstOrcamentoTop.constant = 64;
                                              [destinationView layoutIfNeeded];
                                              [destinationViewController setButtonStageToShow:3];
                                              [destinationView layoutIfNeeded];
                                              destinationViewController.cnstOrcamentoTop.constant = 44;
                                              [destinationView layoutIfNeeded];
                                              
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              [self.sourceViewController dismissViewControllerAnimated:false completion:nil];
                                          }];
                     }];
}

@end
