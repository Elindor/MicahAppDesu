//
//  ViewController.m
//  Orca
//
//  Created by Thiago Borges Gonçalves Penna on 7/27/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "MenuViewController.h"
#import "PerfilViewController.h"
#import "CustomUnwindSegue.h"
#import "UIButton+Property.h"
#import "SaveData.h"
@interface MenuViewController ()

@end

@implementation MenuViewController

bool hasPerfil = false;
bool hasProdutos = false;
bool hasOrcamento = false;

bool showingOrcamentoOptions;

bool isAnimating = false;

NSArray *allButtons;



-(void)viewWillAppear:(BOOL)animated{
    
    /** CÓDIGO DA ANTIGA CLASSE VIEW CONTROLLER **/
    
    [SaveData sharedAppData].currentOrca = nil;
    
    /** **/
    
    //    [UIView animateWithDuration:1.2
    //                          delay:0.1
    //         usingSpringWithDamping:1
    //          initialSpringVelocity:2
    //                        options:0
    //                     animations:^{
    //                         [self.view layoutIfNeeded];
    //                         self.cnstOrcamentoTop.constant = 44;
    //                         [self setCorrectButtonStageToShow];
    //                         [self.view layoutIfNeeded];
    //                     }
    //                     completion: nil];
    //    [self alignAllImagePositions:allButtons];
    

}

-(void)viewWillLayoutSubviews {
    if (!isAnimating) {
    [super viewWillLayoutSubviews];
    [self alignAllImagePositions:allButtons];
    [self.view layoutIfNeeded];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    allButtons = @[self.btnOrcamento, self.btnHistorico, self.btnProdutos, self.btnPerfil, self.btnNovo, self.btnEmProgresso, self.btnObservacoes];
    
    UIImage *image1 = [UIImage imageNamed:@"IconeMenu1.png"];
    UIImage *image2 = [UIImage imageNamed:@"IconeMenu2.png"];
    UIImage *image3 = [UIImage imageNamed:@"IconeMenu3.png"];
    UIImage *image4 = [UIImage imageNamed:@"IconeMenu4.png"];
    UIImage *image5 = [UIImage imageNamed:@"IconeMenu5.png"];
    
    [self.view layoutIfNeeded];
    //CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height + 20;
    //self.cnstOrcamentoTop.constant = screenHeight;
    [self setAllButtonsToHeight:0];
    [self.view layoutIfNeeded];
    
    
    [self addCustomImage:image1 toButton:self.btnOrcamento];
    [self addCustomImage:image2 toButton:self.btnHistorico];
    [self addCustomImage:image3 toButton:self.btnProdutos];
    [self addCustomImage:image4 toButton:self.btnObservacoes];
    [self addCustomImage:image5 toButton:self.btnPerfil];
    
    [self setCorrectButtonStageToShow];
    
    [self.view layoutIfNeeded];
    [self alignAllImagePositions:allButtons];
    [self.view layoutIfNeeded];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addCustomImage:(UIImage *)image toButton:(UIButton *)button {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [button addSubview:imageView];
    [button setCustomImageView:imageView];
    [self alignImagePositionOnButton:button];
}

- (void)alignImagePositionOnButton:(UIButton *)button {
    UIImageView *imageView = [button customImageView];
    UIImage *image = imageView.image;
    CGFloat imageNewWidth = 35;
    CGFloat imageNewHeight = image.size.height * (imageNewWidth / image.size.width);
    [imageView setFrame:CGRectMake(button.titleLabel.frame.origin.x - 60, (button.frame.size.height - imageNewHeight)/2, imageNewWidth, imageNewHeight)];
}

-(void)alignAllImagePositions:(NSArray *)buttons {
    for (UIButton *button in buttons) {
        if (button != self.btnNovo && button != self.btnEmProgresso ) {
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, button.frame.size.width/2.29, 0, 0)];
        [self.view layoutIfNeeded];
        [self alignImagePositionOnButton:button];
        [self.view layoutIfNeeded];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setButton:(UIButton *)button AlphaTo:(CGFloat)alpha {
    button.titleLabel.alpha = alpha;
    button.customImageView.alpha = alpha;
}


-(void)setTouchedButtonHeight:(CGFloat)newHeight {
    [self setAllButtonsToHeight:0];
    if (self.touchedButton == self.btnOrcamento) {
        self.cnstOrcamentoHeight.constant = newHeight;
    } else if (self.touchedButton == self.btnNovo || self.touchedButton == self.btnEmProgresso) {
        self.cnstNovoEmProgressoHeight.constant = newHeight;
    } else if (self.touchedButton == self.btnHistorico) {
        self.cnstHistoricoHeight.constant = newHeight;
    } else if (self.touchedButton == self.btnProdutos) {
        self.cnstProdutosHeight.constant = newHeight;
    } else if (self.touchedButton == self.btnObservacoes) {
        self.cnstObservacoesHeight.constant = newHeight;
    } else if (self.touchedButton == self.btnPerfil) {
        self.cnstPerfilHeight.constant = newHeight;
    }
}

- (void)setCorrectButtonStageToShow {
    SaveData *sd = [SaveData sharedAppData];
    if (sd.userName == nil || [sd.userName isEqualToString:@""]) {
        [self setButtonStageToShow:0];
    } else if (sd.productList.count == 0) {
        [self setButtonStageToShow:1];
    } else if (sd.unfinishedList.count == 0 && sd.historicList.count == 0) {
        [self setButtonStageToShow:2];
    } else {
        [self setButtonStageToShow:3];
    }
}

- (void)setButtonStageToShow:(int)stage {
    // Stages:
    // 0 : Perfil
    // 1 : Produtos
    // 2 : Orcamento
    // 3 : Historico & Observacoes
    // 4 : Em Progresso & Novo (usado se houver orcamento em progresso
    
    CGFloat allButtonsHeight = [UIScreen mainScreen].bounds.size.height - 64;
    [self setAllButtonsToHeight:0];
    switch (stage) {
        case 0:
            self.cnstPerfilHeight.constant = allButtonsHeight;
            self.btnNovo.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            self.btnEmProgresso.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            [self setButton:self.btnOrcamento AlphaTo:0];
            [self setButton:self.btnEmProgresso AlphaTo:0];
            [self setButton:self.btnNovo AlphaTo:0];
            [self setButton:self.btnHistorico AlphaTo:0];
            [self setButton:self.btnProdutos AlphaTo:0];
            [self setButton:self.btnObservacoes AlphaTo:0];
            [self setButton:self.btnPerfil AlphaTo:1];
            showingOrcamentoOptions = false;
            break;
        case 1:
            self.cnstPerfilHeight.constant = allButtonsHeight/2;
            self.cnstProdutosHeight.constant = allButtonsHeight/2;
            self.btnNovo.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            self.btnEmProgresso.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            [self setButton:self.btnOrcamento AlphaTo:0];
            [self setButton:self.btnEmProgresso AlphaTo:0];
            [self setButton:self.btnNovo AlphaTo:0];
            [self setButton:self.btnHistorico AlphaTo:0];
            [self setButton:self.btnProdutos AlphaTo:1];
            [self setButton:self.btnObservacoes AlphaTo:0];
            [self setButton:self.btnPerfil AlphaTo:1];
            showingOrcamentoOptions = false;
            break;
        case 2:
            self.cnstPerfilHeight.constant = allButtonsHeight/3;
            self.cnstProdutosHeight.constant = allButtonsHeight/3;
            self.cnstOrcamentoHeight.constant = allButtonsHeight/3;
            self.btnNovo.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            self.btnEmProgresso.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            [self setButton:self.btnOrcamento AlphaTo:1];
            [self setButton:self.btnEmProgresso AlphaTo:0];
            [self setButton:self.btnNovo AlphaTo:0];
            [self setButton:self.btnHistorico AlphaTo:0];
            [self setButton:self.btnProdutos AlphaTo:1];
            [self setButton:self.btnObservacoes AlphaTo:0];
            [self setButton:self.btnPerfil AlphaTo:1];
            showingOrcamentoOptions = false;
            break;
        case 3:
            self.cnstPerfilHeight.constant = allButtonsHeight/5;
            self.cnstProdutosHeight.constant = allButtonsHeight/5;
            self.cnstOrcamentoHeight.constant = allButtonsHeight/5;
            self.cnstHistoricoHeight.constant = allButtonsHeight/5;
            self.cnstObservacoesHeight.constant = allButtonsHeight/5;
            self.btnNovo.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            self.btnEmProgresso.backgroundColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:38/255.0f alpha:255/255.0f];
            [self setButton:self.btnOrcamento AlphaTo:1];
            [self setButton:self.btnEmProgresso AlphaTo:0];
            [self setButton:self.btnNovo AlphaTo:0];
            [self setButton:self.btnHistorico AlphaTo:1];
            [self setButton:self.btnProdutos AlphaTo:1];
            [self setButton:self.btnObservacoes AlphaTo:1];
            [self setButton:self.btnPerfil AlphaTo:1];
            self.cnstNovoEmProgressoHeight.constant = 0;
            showingOrcamentoOptions = false;
            break;
        case 4:
            self.cnstPerfilHeight.constant = allButtonsHeight/5.5;
            self.cnstProdutosHeight.constant = allButtonsHeight/5.5;
            self.cnstOrcamentoHeight.constant = allButtonsHeight/5.5;
            self.cnstHistoricoHeight.constant = allButtonsHeight/5.5;
            self.cnstObservacoesHeight.constant = allButtonsHeight/5.5;
            self.cnstNovoEmProgressoHeight.constant = allButtonsHeight/11.0;
            self.btnNovo.backgroundColor = [UIColor colorWithRed:255/255.0f green:88/255.0f blue:90/255.0f alpha:255/255.0f];
            self.btnEmProgresso.backgroundColor = [UIColor colorWithRed:255/255.0f green:121/255.0f blue:123/255.0f alpha:255/255.0f];
            self.btnNovo.alpha = 1;
            self.btnNovo.titleLabel.alpha = 1;
            [self setButton:self.btnOrcamento AlphaTo:1];
            [self setButton:self.btnEmProgresso AlphaTo:1];
            [self setButton:self.btnNovo AlphaTo:1];
            [self setButton:self.btnHistorico AlphaTo:1];
            [self setButton:self.btnProdutos AlphaTo:1];
            [self setButton:self.btnObservacoes AlphaTo:1];
            [self setButton:self.btnPerfil AlphaTo:1];
            showingOrcamentoOptions = true;
            break;
        default:
            break;
    }
    
    [self.view layoutIfNeeded];
    [self alignAllImagePositions:allButtons];
    [self.view layoutIfNeeded];
    
    //    for (UIButton *button in allButtons) {
    //        if (button.frame.size.height < 50) {
    //            button.titleLabel.alpha = 0;
    //            button.customImageView.alpha = 0;
    //        } else {
    //            button.titleLabel.alpha = 1;
    //            button.customImageView.alpha = 1;
    //        }
    //    }
    
}

- (void)setAllButtonsToHeight:(CGFloat)newHeight {
    self.cnstOrcamentoHeight.constant = newHeight;
    self.cnstHistoricoHeight.constant = newHeight;
    self.cnstProdutosHeight.constant = newHeight;
    self.cnstObservacoesHeight.constant = newHeight;
    self.cnstPerfilHeight.constant = newHeight;
    self.cnstNovoEmProgressoHeight.constant = newHeight;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    isAnimating = true;
    self.touchedButton = sender;
    
    //    CGFloat viewWidth;
    //    CGFloat viewHeigth;
    
    self.newCnstOrcamentoTop = -20;
    
    CGFloat allButtonsHeight = self.btnPerfil.superview.frame.size.height + 64;
    
    self.newCnstOrcamentoHeight = 0;
    self.newCnstProdutosHeight = 0;
    self.newCnstObservacoesHeight = 0;
    self.newCnstPerfilHeight = 0;
    self.newCnstHistoricoHeight = 0;
    self.newCnstNovoEmProgressoHeight = 0;
    
    if (sender == self.btnNovo) {
        self.newCnstNovoEmProgresso = self.btnNovo.superview.frame.size.width;
        self.newCnstNovoEmProgressoHeight = allButtonsHeight;
    } else if (sender == self.btnEmProgresso) {
        self.newCnstNovoEmProgressoHeight = allButtonsHeight;
        self.newCnstNovoEmProgresso = -self.btnNovo.superview.frame.size.width;
    } else if (sender == self.btnProdutos) {
        self.newCnstProdutosHeight = allButtonsHeight;
    } else if (sender == self.btnObservacoes) {
        self.newCnstObservacoesHeight = allButtonsHeight;
    } else if (sender == self.btnPerfil) {
        self.newCnstPerfilHeight = allButtonsHeight;
    } else if (sender == self.btnHistorico) {
        self.newCnstHistoricoHeight = allButtonsHeight;
    } else {
        self.newCnstOrcamentoHeight = allButtonsHeight;
    }
}


//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.cnstOrcamentoLeft.constant = self.view.frame.size.width - 16;
//    self.cnstOrcamentoRight.constant = -self.view.frame.size.width - 16;
//
//    self.cnstHistoricoLeft.constant = self.view.frame.size.width - 16;
//    self.cnstHistoricoRight.constant = -self.view.frame.size.width - 16;
//
//    self.cnstProdutosLeft.constant = self.view.frame.size.width - 16;
//    self.cnstProdutosRight.constant = -self.view.frame.size.width - 16;
//
//    self.cnstPerfilLeft.constant = self.view.frame.size.width - 16;
//    self.cnstPerfilRight.constant = -self.view.frame.size.width - 16;
//}
//
//- (void) viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//
//    [self.view layoutIfNeeded];
//
//    [UIView animateWithDuration:0.7
//                          delay:0.1
//         usingSpringWithDamping:1
//          initialSpringVelocity:2
//                        options:0
//                     animations:^{
//                         self.cnstOrcamentoLeft.constant = -16;
//                         self.cnstOrcamentoRight.constant = -16;
//                         [self.view layoutIfNeeded];}
//                     completion:nil];
//
//    [UIView animateWithDuration:0.7
//                          delay:0.3
//         usingSpringWithDamping:1
//          initialSpringVelocity:2
//                        options:0
//                     animations:^{
//                         self.cnstHistoricoLeft.constant = -16;
//                         self.cnstHistoricoRight.constant = -16;
//                         [self.view layoutIfNeeded];}
//                     completion:nil];
//
//    [UIView animateWithDuration:0.7
//                          delay:0.5
//         usingSpringWithDamping:1
//          initialSpringVelocity:2
//                        options:0
//                     animations:^{
//                         self.cnstProdutosLeft.constant = -16;
//                         self.cnstProdutosRight.constant = -16;
//                         [self.view layoutIfNeeded];}
//                     completion:nil];
//
//    [UIView animateWithDuration:0.7
//                          delay:0.7
//         usingSpringWithDamping:1
//          initialSpringVelocity:2
//                        options:0
//                     animations:^{
//                         self.cnstPerfilLeft.constant = -16;
//                         self.cnstPerfilRight.constant = -16;
//                         [self.view layoutIfNeeded];}
//                     completion:nil];
//
//}
//
- (IBAction)didTouchOrcamento:(id)sender {
    [self.view layoutIfNeeded];
    
    SaveData *sd = [SaveData sharedAppData];
    
    if (sd.unfinishedList.count == 0) {
        [self performSegueWithIdentifier:@"CustomSegueNovo" sender:self.btnOrcamento];
        self.touchedButton = self.btnOrcamento;
        return;
    }
    
    if (!showingOrcamentoOptions) {
        [UIView animateWithDuration:0.6
                              delay:0
             usingSpringWithDamping:0.666
              initialSpringVelocity:6
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             showingOrcamentoOptions = true;
                             [self setButtonStageToShow:4];
                             [self.view layoutIfNeeded];
                         }
                         completion:nil];
    } else {
        [UIView animateWithDuration:0.8
                              delay:0
             usingSpringWithDamping:100
              initialSpringVelocity:-9.99
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             showingOrcamentoOptions = false;
                             [self setButtonStageToShow:3];
                             [self.view layoutIfNeeded];
                         }
                         completion:nil];
    }
}

- (IBAction)didTouchHistorico:(id)sender {
    //    [self.view layoutIfNeeded];
    //
    //    self.btnOrcamentoNovo.hidden = false;
    //    self.btnOrcamentoEmProgresso.hidden = false;
    //
    //    self.cnstHistoricoTop.constant = 0;
    //    [UIView animateWithDuration:1.2
    //                          delay:0
    //         usingSpringWithDamping:0.8
    //          initialSpringVelocity:-15
    //                        options:UIViewAnimationOptionAllowUserInteraction
    //                     animations:^{[self.view layoutIfNeeded];}
    //                     completion:nil];
}

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue*)sender
{
    //    UIViewController *self = sender.self;
    //    // Pull any data from the view controller which initiated the unwind segue.
    //    if ([self isKindOfClass:[PerfilViewController class]]) {
    //        hasPerfil = true;
    //    }
    if ([sender.identifier isEqualToString:@"unwindFromPerfilToMenu"]) {
        hasPerfil = true;
    }
    if ([sender.identifier isEqualToString:@"unwindFromProdutosToMenu"]) {
        hasProdutos = true;
    }
    if ([sender.identifier isEqualToString:@"unwindFromOrcamentoToMenu"]) {
        hasOrcamento = true;
    }
}

- (UIStoryboardSegue *) segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    
    return [[CustomUnwindSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
}

@end
