//
//  CustomSegueFromMenu.m
//  Orca
//
//  Created by Thiago Borges Gonçalves Penna on 7/30/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "CustomSegueFromMenu.h"
#import "MenuViewController.h"
#import "UIButton+Property.h"

@implementation CustomSegueFromMenu

-(void) perform {
    
    MenuViewController *sourceViewController = (MenuViewController *)self.sourceViewController;
    UIView *sourceView = [sourceViewController view];
    UIView *destinationView = [self.destinationViewController view];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    destinationView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window insertSubview:destinationView belowSubview:sourceView];
    [window sendSubviewToBack:destinationView];
    
    [sourceView layoutIfNeeded];
    
    NSArray *buttons = @[sourceViewController.btnOrcamento, sourceViewController.btnHistorico, sourceViewController.btnProdutos, sourceViewController.btnPerfil, sourceViewController.btnNovo, sourceViewController.btnEmProgresso, sourceViewController.btnObservacoes];
    
    
    //    [UIView transitionWithView:sourceViewController.touchedButton.titleLabel
    //                      duration:1
    //                       options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionAllowAnimatedContent
    //                    animations:^{
    //                    }
    //                    completion:nil];
    //
    
    [sourceView layoutIfNeeded];
    UIImageView *imageView;
    if (sourceViewController.touchedButton == sourceViewController.btnNovo || sourceViewController.touchedButton == sourceViewController.btnEmProgresso) {
        imageView = sourceViewController.btnOrcamento.customImageView;
        [sourceView addSubview: imageView];
        imageView.frame = CGRectOffset(imageView.frame, sourceViewController.btnOrcamento.frame.origin.x, sourceViewController.btnOrcamento.frame.origin.y +                          sourceViewController.cnstOrcamentoTop.constant - sourceViewController.newCnstOrcamentoTop);
    } else {
        imageView = sourceViewController.touchedButton.customImageView;
        [sourceView addSubview: imageView];
        imageView.frame = CGRectOffset(imageView.frame, sourceViewController.touchedButton.frame.origin.x, sourceViewController.touchedButton.frame.origin.y +                          sourceViewController.cnstOrcamentoTop.constant - sourceViewController.newCnstOrcamentoTop);
    }
    [sourceView layoutIfNeeded];
    
    UIImage *image = imageView.image;
    CGFloat imageNewWidth = 112;
    CGFloat imageNewHeight = image.size.height * (imageNewWidth / image.size.width);
    CGRect imageNewFrame = CGRectMake(sourceView.center.x - imageNewWidth/2, sourceView.center.y- imageNewHeight/2 - 60, imageNewWidth, imageNewHeight);
    
    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:2
          initialSpringVelocity:4
                        options:0
                     animations:^{
                         
                         [imageView setFrame:imageNewFrame];
                         
                         [sourceViewController.touchedButton setTitleEdgeInsets:UIEdgeInsetsMake(90, 0, 0, 0)];
                         sourceViewController.touchedButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                         
                         sourceViewController.cnstOrcamentoTop.constant = sourceViewController.newCnstOrcamentoTop;
                         
                         sourceViewController.cnstOrcamentoHeight.constant = sourceViewController.newCnstOrcamentoHeight;
                         sourceViewController.cnstHistoricoHeight.constant = sourceViewController.newCnstHistoricoHeight;
                         sourceViewController.cnstProdutosHeight.constant = sourceViewController.newCnstProdutosHeight;
                         sourceViewController.cnstObservacoesHeight.constant = sourceViewController.newCnstObservacoesHeight;
                         sourceViewController.cnstPerfilHeight.constant = sourceViewController.newCnstPerfilHeight;
                         sourceViewController.cnstNovoEmProgresso.constant = sourceViewController.newCnstNovoEmProgresso;
                         sourceViewController.cnstNovoEmProgressoHeight.constant = sourceViewController.newCnstNovoEmProgressoHeight;
                         
                         sourceViewController.touchedButton.titleLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:26];
                         
                         if (sourceViewController.touchedButton == sourceViewController.btnNovo || sourceViewController.touchedButton == sourceViewController.btnEmProgresso) {
                             
                             sourceViewController.touchedButton.titleLabel.text = @"ORÇAMENTO";
                             [sourceViewController.touchedButton setTitle:@"ORÇAMENTO" forState:UIControlStateNormal];
                             [sourceViewController.touchedButton setTitle:@"ORÇAMENTO" forState:UIControlStateSelected];
                             [sourceViewController.touchedButton setTitle:@"ORÇAMENTO" forState:UIControlStateHighlighted];
                             
                         }
                         
                         for (UIButton *button in buttons) {
                             if (button != sourceViewController.touchedButton) {
                                 button.titleLabel.alpha = 0;
                                 button.imageView.alpha = 0;
                             }
                             
                         }
                         [sourceView layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.2
                                               delay:0
                              usingSpringWithDamping:2
                               initialSpringVelocity:4
                                             options:0
                                          animations:^{
                                              [sourceViewController.touchedButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
                                              
                                              if (sourceViewController.touchedButton == sourceViewController.btnNovo || sourceViewController.touchedButton == sourceViewController.btnEmProgresso) {
                                                  sourceViewController.btnNovo.backgroundColor = sourceViewController.btnOrcamento.backgroundColor;
                                                  sourceViewController.btnEmProgresso.backgroundColor = sourceViewController.btnOrcamento.backgroundColor;
                                              }
                                              
                                              sourceViewController.cnstOrcamentoTop.constant = -[UIScreen mainScreen].bounds.size.height - 20;
                                              sourceView.frame = CGRectOffset(sourceView.frame, 0, -[UIScreen mainScreen].bounds.size.height);
                                              sourceViewController.touchedButton.titleLabel.alpha = 0;
                                              [sourceView layoutIfNeeded];
                                              
                                          }
                                          completion:^(BOOL finished) {
                                              [self.sourceViewController presentViewController:self.destinationViewController animated:false completion:nil];
                                          }];
                     }];
}

@end
